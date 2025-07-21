import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/movie_repo.dart';
import 'components/state/bloc/movie_bloc.dart';
import 'components/state/bloc/movie_state.dart';
import 'components/widgets/movie_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 1;
  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    // Sayfa ilk yüklendiğinde 1. sayfa verisi çekilir
    _fetchMore();
  }

  Future<void> _fetchMore() async {
    await MovieRepo.fetchMovieList(
      page: currentPage,
      movieBloc: context.read<MovieBloc>(),
    );

    setState(() {
      currentPage++;
    });
  }

  Future<void> _onRefresh() async{
    _fetchMore();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            return PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: state.movies.length,
              onPageChanged: (index) {
                // Sayfa sonuna yaklaşınca yeni sayfayı çağır
                if (index >= state.movies.length - 2) {
                  _fetchMore();
                }
              },
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return MovieItemWidget(movie: movie);
              },
            );
          },
        ),
      ),
    );
  }
}


