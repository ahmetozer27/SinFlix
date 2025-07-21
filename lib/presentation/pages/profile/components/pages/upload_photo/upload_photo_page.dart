import 'dart:io';
import 'package:dating_app/data/repository/profile_repo.dart';
import 'package:dating_app/presentation/pages/profile/components/pages/upload_photo/components/widgets/photo_select_button_widget.dart';
import 'package:dating_app/presentation/pages/profile/state/cubit/profile_cubit.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:dating_app/utils/pop_up_utils.dart';
import 'package:dating_app/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../components/widgets/back_button_widget.dart';
import '../../../../../components/widgets/custom_button_widget.dart';

class UploadPhotoPage extends StatefulWidget {
  const UploadPhotoPage({super.key});

  @override
  State<UploadPhotoPage> createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  File? photoFile;

  Future<void> _selectPhoto() async {
    photoFile = await ImageUtils.pickImageFromGallery();
  }

  Future<void> _uploadPhoto() async{
    if (photoFile != null && mounted) {
      var success = await ProfileRepo.uploadPhoto(photoFile!, context.read<ProfileCubit>());
      _showPopUp(success);
    }
    _showPopUp(false);
  }

  void _showPopUp(bool success){
    PopUpUtils.showPopup(context, success, successMessage: 'Fotoğraf Yüklendi!', failureMessage: 'Fotoğraf Yüklenemedi!');
  }

  void _navigateToBack(){
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: BackButtonWidget(onPressed: _navigateToBack,),
            ),
            const Center(
              child: Text(
                'Profil Detayı',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          const Center(
            child: Text(
              "Fotoğraflarınızı Yükleyin",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
          const Spacer(),
          const Center(
            child: Text(
              "Resources out incentivize\n relaxation floor loss cc.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(
            flex: 7,
          ),
          PhotoSelectButtonWidget(onTap: _selectPhoto),
          const Spacer(
            flex: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtils.getScreenWidth(context) * 0.05),
            child: CustomButtonWidget(onPressed: _uploadPhoto, text: 'Devam Et'),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
