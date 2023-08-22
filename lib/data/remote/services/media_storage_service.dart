import 'dart:io';

abstract class MediaStorageService{
  Future<String> uploadProfileImage(String userId,File file);
  Future<String> uploadContentThumbnail(String contentId,File file);
  Future<String> uploadContentPdf(String contentId,File file);
  Future<String> uploadContentAudio(String contentId,File file);
}