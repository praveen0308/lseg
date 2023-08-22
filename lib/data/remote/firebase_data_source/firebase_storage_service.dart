import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:lseg/data/remote/services/media_storage_service.dart';

class FirebaseMediaStorageService extends MediaStorageService{
  @override
  Future<String> uploadContentAudio(String contentId, File file) {
    // TODO: implement uploadContentAudio
    throw UnimplementedError();
  }

  @override
  Future<String> uploadContentPdf(String contentId, File file) {
    // TODO: implement uploadContentPdf
    throw UnimplementedError();
  }

  @override
  Future<String> uploadContentThumbnail(String contentId, File file) {
    // TODO: implement uploadContentThumbnail
    throw UnimplementedError();
  }

  @override
  Future<String> uploadProfileImage(String userId, File file) {
    // TODO: implement uploadProfileImage
    throw UnimplementedError();
  }
}