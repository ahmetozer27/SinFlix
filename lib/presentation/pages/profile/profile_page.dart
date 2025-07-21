import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/extensions/string_extension.dart';
import 'package:dating_app/data/models/profile_model.dart';
import 'package:dating_app/data/repository/movie_repo.dart';
import 'package:dating_app/presentation/pages/profile/components/widgets/favorite_movie_item_widget.dart';
import 'package:dating_app/presentation/pages/profile/state/bloc/favorite_movie_bloc.dart';
import 'package:dating_app/presentation/pages/profile/state/bloc/favorite_movie_state.dart';
import 'package:dating_app/presentation/pages/profile/state/cubit/profile_cubit.dart';
import 'package:dating_app/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../data/repository/auth_repo.dart';
import '../../../utils/pop_up_utils.dart';
import 'components/bottom_sheet/special_offer_bottom_sheet.dart';
import 'components/widgets/add_photo_button_widget.dart';
import 'components/widgets/offer_button_widget.dart';
import 'components/widgets/sign_out_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    _initialize();
    // TODO: implement initState
    super.initState();
  }

  Future<void> _initialize() async {
    await MovieRepo.fetchFavoriteMovie(context.read<FavoriteMovieBloc>());
  }

  void _navigateToAddPhoto() {
    context.push('/upload_photo');
  }

  Future<void> _signOut() async {
    var success = await AuthRepo.signOut();
    _showPopup(success);

    if (success) {
      _navigateLogin();
    }
  }

  void _navigateLogin() {
    context.go('/login');
  }

  void _showPopup(bool success) async {
    if (mounted) {
      PopUpUtils.showPopup(context, success,
          successMessage: 'Başarıyla Çıkıldı!',
          failureMessage: 'Çıkış Başarısız!');
    }
  }



  // Usage example:
  void _showOfferBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const SpecialOfferBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SignOutWidget(
              onPressed: _signOut,
            ),
            const Spacer(
              flex: 3,
            ),
            const Text(
              'Profil Detayı',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            const Spacer(),
            OfferButtonWidget(onTap: _showOfferBottomSheet)
          ],
        ),
      ),
      body: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          BlocBuilder<ProfileCubit, ProfileModel>(builder: (context, profile) {
            return Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: profile.photoUrl.isNullOrEmpty
                        ? const AssetImage(
                            'lib/resources/assets/images/profile_photo.png')
                        : NetworkImage(profile.photoUrl!),
                    backgroundColor: AppColors
                        .inputBackground, // Yüklenmeden önceki arka plan
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.name.capitalize() ?? '',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "ID: ${profile.id}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textMini,
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 5,
                  child: AddPhotoButtonWidget(
                    onTap: _navigateToAddPhoto,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            );
          }),
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 20,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtils.getScreenWidth(context) * 0.07),
              child: Column(
                children: [
                  const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 10),
                      child: Text(
                        "Beğendiğim Filmler",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 13),
                      ),
                    ),
                  ),
                  Expanded(
                      child: BlocBuilder<FavoriteMovieBloc, FavoriteMovieState>(
                    builder: (context, state) {
                      if (state is FavoriteMovieLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is FavoriteMovieLoaded) {
                        final movies = state.movies;
                        if(movies.isEmpty){
                          return const Center(
                          child: Text('Favori Film Bulunamadı!'),
                          );
                        }
                        return GridView.builder(
                          padding: const EdgeInsets.all(12),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.6,
                          ),
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            final movie = movies[index];
                            return FavoriteMovieItemWidget(movie: movie);
                          },
                        );
                      } else if (state is FavoriteMovieError) {
                        return Center(child: Text(state.message));
                      } else {
                        return const Center(
                          child: Text('Favori Film Bulunamadı!'),
                        );
                      }
                    },
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
