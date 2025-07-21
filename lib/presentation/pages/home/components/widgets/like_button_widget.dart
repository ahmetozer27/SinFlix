import 'package:dating_app/data/repository/movie_repo.dart';
import 'package:dating_app/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../data/models/movie_model.dart';

class LikeButtonWidget extends StatefulWidget {
  const LikeButtonWidget({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  State<LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {

  void _toggleLike() async{
    bool success = false;
    if(widget.movie.isFavorite){
      success = await MovieRepo.removeFavorite(widget.movie.id);
    }else{
      success = await MovieRepo.addFavorite(widget.movie.id);
    }
    if(success){
      widget.movie.isFavorite = !widget.movie.isFavorite;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.getScreenHeight(context) * 0.085,
      width: ScreenUtils.getScreenWidth(context) * 0.11,
      decoration: BoxDecoration(
          color: const Color(0xFF33000000),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.inputBorder)),
      child: IconButton(
          icon: widget.movie.isFavorite
              ? const FaIcon(FontAwesomeIcons.solidHeart, color: Colors.red)
              : const FaIcon(FontAwesomeIcons.heart, color: Colors.white),
          onPressed: _toggleLike),
    );
  }
}
