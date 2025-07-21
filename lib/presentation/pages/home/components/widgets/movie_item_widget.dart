import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/extensions/string_extension.dart';
import 'package:dating_app/presentation/components/animations/shimmer_effect.dart';
import 'package:dating_app/utils/screen_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../data/models/movie_model.dart';
import 'like_button_widget.dart';

class MovieItemWidget extends StatefulWidget {
  final MovieModel movie;

  const MovieItemWidget({super.key, required this.movie});

  @override
  State<MovieItemWidget> createState() => _MovieItemWidgetState();
}

class _MovieItemWidgetState extends State<MovieItemWidget> {
  bool showFullDescription = false;
  final maxLines = 2;

  Future<void> _onTap() async {
    setState(() {
      showFullDescription = !showFullDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          // Arka plan görseli
          Positioned.fill(
            child: Image.network(
              widget.movie.posterUrl.fixHttps(),
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const ShimmerEffect();
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child:
                      Icon(Icons.broken_image, color: Colors.white, size: 50),
                );
              },
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Like Butonu
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: ScreenUtils.getScreenWidth(context) * 0.03,
                    bottom: ScreenUtils.getScreenHeight(context) * 0.01
                    ),
                    child: LikeButtonWidget(movie: widget.movie),
                  ),
                ),
                // Description
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.all(
                      ScreenUtils.getScreenWidth(context) * 0.07),
                  color: Colors.black.withOpacity(0.3),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: ScreenUtils.getScreenWidth(context) * 0.15,
                            height: ScreenUtils.getScreenWidth(context) * 0.15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.network(
                                widget.movie.images[0],
                                fit: BoxFit.fill,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const ShimmerEffect(); // Kendi shimmer widget'ınız
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(Icons.broken_image,
                                        color: Colors.grey),
                                  );
                                },
                              ),
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.movie.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: showFullDescription
                                              ? widget.movie.writer
                                              : widget.movie.writer.shorten(60),
                                          // karakter limiti, ayarlanabilir
                                          style: const TextStyle(
                                            color: AppColors.textMini,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          )),
                                      if (!showFullDescription &&
                                          widget.movie.writer.length > 60)
                                        const TextSpan(text: '... '),
                                      TextSpan(
                                          text: showFullDescription
                                              ? ' Kapat'
                                              : ' Daha Fazlası',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = _onTap),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
