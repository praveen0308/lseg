import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:lseg/data/data.dart';
import 'package:lseg/data/entities/content_data_entity.dart';
import 'package:lseg/data/entities/content_entity.dart';
import 'package:lseg/data/remote/firebase_data_source/firestore_config.dart';
import 'package:lseg/data/remote/services/content_service.dart';
import 'package:lseg/domain/domain.dart';

class FirebaseContentServiceImpl extends ContentService {
  final contents = FirebaseFirestore.instance.collection(contentCollection);
  final contentViewHistory =
      FirebaseFirestore.instance.collection(contentViewHistoryCollection);
  final users = FirebaseFirestore.instance.collection(userCollection);
  final storageRef = FirebaseStorage.instance.ref();

  Future<List<ContentEntity>> getContentWithRealUrls(
      List<ContentEntity> items) async {
    List<ContentEntity> newItems = [];
    await Future.forEach(items, (element) async {
      var contentData = element.contentData;
      if (contentData != null) {
        try{
          contentData.contentUrl = await storageRef
              .child(element.contentData!.contentPath!)
              .getDownloadURL();
        } catch(e){
          contentData.contentUrl = "";
          debugPrint(e.toString());
        }

        try{
          contentData.thumbnailUrl = await storageRef
              .child(element.contentData!.thumbnailPath!)
              .getDownloadURL();
        } catch(e){
          contentData.thumbnailUrl = "";
          debugPrint(e.toString());
        }

      }

      newItems.add(element.copyWith(contentData: contentData));
    });
    return newItems;
  }

  @override
  Future<List<ContentEntity>?> getContentByCategory(String categoryId) async {
    try {
      var response =
          await contents.where("category_id", isEqualTo: categoryId).get();
      var items = response.docs
          .map((e) => ContentEntity.fromJson(e))
          .toList(growable: true);
      return getContentWithRealUrls(items);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ContentEntity>?> getContentByCreator(String userId) async {
    try {
      var response =
          await contents.where("creator_id", isEqualTo: userId).get();
      var items = response.docs
          .map((e) => ContentEntity.fromJson(e))
          .toList(growable: true);
      return getContentWithRealUrls(items);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ContentEntity>?> getContentByQuery(String query) async {
    try {
      var response = await contents
          .orderBy('title', descending: false)
          .startAt([query]).endAt(['$query\uf8ff']).get();
      var items = response.docs
          .map((e) => ContentEntity.fromJson(e))
          .toList(growable: true);
      return getContentWithRealUrls(items);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ContentEntity?> getContentDetails(String contentId) {
    return contents
        .doc(contentId)
        .get()
        .then((snapshot) => ContentEntity.fromJson(snapshot))
        .catchError((error) {
      print('Error: $error');
      null;
    });
  }

  @override
  Future<List<ContentEntity>?> getFavourites(List<String> ids) async {
    try {
      var response = await contents.where("content_id", whereIn: ids).get();
      var items = response.docs
          .map((e) => ContentEntity.fromJson(e))
          .toList(growable: true);
      return getContentWithRealUrls(items);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ContentEntity>?> getPurchasedContents(List<String> ids) async {
    try {
      var response = await contents.where("content_id", whereIn: ids).get();
      var items = response.docs
          .map((e) => ContentEntity.fromJson(e))
          .toList(growable: true);
      return getContentWithRealUrls(items);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ContentEntity>?> getRecommendedContent(String userId) async {
    try {
      var response =
          await contents.orderBy('view_count', descending: true).get();
      var items = response.docs
          .map((e) => ContentEntity.fromJson(e))
          .toList(growable: true);
      return getContentWithRealUrls(items);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ContentEntity>?> getRecommendedContentOfCategory(
      String categoryId,{int limit = 10}) async {
    try {
      // var response = await contents.where("category_id",isEqualTo: categoryId).orderBy('views', descending: true).limit(10).get();
      var response =
          await contents.where("category_id", isEqualTo: categoryId).limit(limit).get();

      var items = response.docs
          .map((e) => ContentEntity.fromJson(e))
          .toList(growable: true);
      items.sort((a, b) => a.views!.compareTo(b.views!));
      return getContentWithRealUrls(items.reversed.take(10).toList());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateViewCount(String contentId) async {
    try {
      var docId = DateFormat("yyyy_MM").format(DateTime.now());
      WriteBatch batch = FirebaseFirestore.instance.batch();
      var response = await contentViewHistory.doc(docId).get();
      if (response.exists) {
        var viewCountEntity = ViewCountEntity.fromJson(response);
        var newCounts = List<ContentViewCount>.empty(growable: true);
        var isExists = false;
        viewCountEntity.contentViewCount?.forEach((element) {
          if (element.contentId == contentId) {
            element.count = (element.count ?? 0) + 1;
            isExists = true;
          }
          newCounts.add(element);
        });

        if (!isExists) {
          newCounts.add(ContentViewCount(contentId: contentId, count: 1));
        }
        batch.set(contentViewHistory.doc(docId),
            viewCountEntity.copyWith(contentViewCount: newCounts).toJson());

        var cResponse = await contents.doc(contentId).get();
        var content = ContentEntity.fromJson(cResponse);

        batch.update(contents.doc(contentId),
            content.copyWith(views: (content.views ?? 0) + 1).toJson());
        await batch.commit();
      } else {
        var viewCountEntity = ViewCountEntity();
        var items = List<ContentViewCount>.empty(growable: true);
        items.add(ContentViewCount(contentId: contentId, count: 1));
        viewCountEntity.contentViewCount = items;
        batch.set(contentViewHistory.doc(docId), viewCountEntity.toJson());
        var cResponse = await contents.doc(contentId).get();
        var content = ContentEntity.fromJson(cResponse);

        batch.update(contents.doc(contentId),
            content.copyWith(views: (content.views ?? 0) + 1).toJson());
        await batch.commit();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ContentEntity>?> getTrendingContents({int limit = 10}) async {
    try {
      var docId = DateFormat("yyyy_MM").format(DateTime.now());
      var response = await contentViewHistory.doc(docId).get();
      var currentMonthContents =
          ViewCountEntity.fromJson(response).contentViewCount;
      currentMonthContents?.sort((x, y) => x.count!.compareTo(y.count!));
      var lItems =
          currentMonthContents?.take(limit).map((e) => e.contentId).toList();

      var response1 = await contents.where("content_id", whereIn: lItems).get();
      var items = response1.docs
          .map((e) => ContentEntity.fromJson(e))
          .toList(growable: true);
      return getContentWithRealUrls(items);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ContentEntity>?> getPopularContents({int limit = 10}) async {
    try {
      var response = await contents.orderBy('views', descending: true).limit(limit).get();
      var items = response.docs
          .map((e) => ContentEntity.fromJson(e))
          .toList(growable: true);
      return getContentWithRealUrls(items);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateContentDetails(ContentEntity contentEntity) async{
    try {
      await contents
          .doc(contentEntity.contentId)
          .update(contentEntity.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ContentEntity?> uploadNewContent(ContentEntity contentEntity) {
    var newContentRef = contents.doc();
    var contentData = ContentDataEntity(
      contentPath: "contents/docs/doc_${newContentRef.id}.pdf",
      thumbnailPath: "contents/thumbnails/picture_${newContentRef.id}.jpg",
    );
    var finalContent = contentEntity.copyWith(
        contentId: newContentRef.id, contentData: contentData);
    return newContentRef.set(finalContent.toJson()).then((value) {
      print("Content added successfully!!!");
      return finalContent;
    }).catchError((error) {
      print("Failed to add content: $error");
      throw Exception(error);
    });
  }

  @override
  Future<void> deleteContent(String contentId) {
    return contents
        .doc(contentId)
        .delete()
        .then((value) => print("Content Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  @override
  Future<void> updateContentReview(
      String contentId, ReviewEntity review) async {
    try {
      var result = await contents.doc(contentId).get();
      var content = ContentEntity.fromJson(result);
      if (content.reviews != null) {
        content.reviews!.add(review);
        await contents.doc(contentId).update(content.toJson());
      } else {
        var reviews = List<ReviewEntity>.empty(growable: true);
        reviews.add(review);
        await contents
            .doc(contentId)
            .update(content.copyWith(reviews: reviews).toJson());
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
