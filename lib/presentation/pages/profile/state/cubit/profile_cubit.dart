import 'package:dating_app/data/models/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileModel> {
  ProfileCubit()
      : super(ProfileModel(id: null, name: null, email: null, photoUrl: null));

  void updateProfileData(ProfileModel profile) {
    emit(profile);
  }

}
