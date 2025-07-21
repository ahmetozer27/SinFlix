import 'dart:io';
import 'package:dating_app/data/models/profile_model.dart';
import 'package:dating_app/data/service/profile_service.dart';
import 'package:dating_app/data/service/secure_storage_service.dart';
import 'package:dating_app/presentation/pages/profile/state/cubit/profile_cubit.dart';
import '../../utils/logger_utils.dart';

class ProfileRepo {
  static Future<bool> fetchProfileData(ProfileCubit profileCubit) async {
    var token = await SecureStorageService.getToken();
    if (token == null || token.isEmpty) {
      return false;
    }
    try {
      var data = await ProfileService.getProfile(token: token);
      if (data == null) {
        return false;
      }

      var profile = ProfileModel.fromJson(data);
      profileCubit.updateProfileData(profile);
      LoggerUtils.logger.i('Profil Bilgisi Alındı!');
      return true;

    } catch (e) {
      LoggerUtils.logger.e('Profil Bilgisi Alınamadı! Hata:$e');
      return false;
    }
  }

  static Future<bool> uploadPhoto(
      File photoFile, ProfileCubit profileCubit) async {
    var token = await SecureStorageService.getToken();
    if (token == null || token.isEmpty) {
      return false;
    }
    try {
      var success =
      await ProfileService.uploadPhoto(token: token, photoFile: photoFile);
      if (success) {
        fetchProfileData(profileCubit);
        LoggerUtils.logger.i('Fotoğraf Başarıyla Yüklendi!');
        return true;
      }else{
        LoggerUtils.logger.e('Fotoğraf Yüklenemedi!');
        return false;
      }
    }catch(e){
      LoggerUtils.logger.e('Fotoğraf Yüklenemedi! Hata:$e');
      return false;
    }

  }
}
