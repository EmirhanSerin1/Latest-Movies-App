import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
import '../../providers/movies_prov.dart';
import '../../screens/movie_details.dart';
import '../home_screen/single_popular_film.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key, required this.typeOfMovie}) : super(key: key);

  final String typeOfMovie;

  @override
  Widget build(BuildContext context) {
    MoviesProv prov = Provider.of<MoviesProv>(context, listen: false);

    
    
    return FutureBuilder(
      future: getFuture(prov),
      builder: (context, snapshot) {
        return Consumer<MoviesProv>(
          builder: (context, value, child) {
            return SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: getItemCount(value),
                itemBuilder: (context, index) {
                  Movie item = getItem(value, index);
                  return SingleFilmItem(
                    widget: MovieDetails(movie: item),
                    name: item.title,
                    imagePath: item.posterPath ?? "",
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Future<void>? getFuture(MoviesProv prov) {
    if(typeOfMovie == "populars"){
      return prov.getPopulars();
    }else if(typeOfMovie == "recommended"){
      return prov.getRecommendeds(movieId: "100");
    }else if(typeOfMovie == "latest") {
      return prov.getLatestMovies();
    }else{
      return prov.getPopulars();
    }
  }

  int? getItemCount(MoviesProv value) {
    if(typeOfMovie == "populars"){
      return value.populars!.length;
    }else if(typeOfMovie == "recommended"){
      return value.recommendeds!.length;
    }else if(typeOfMovie == "latest") {
      return value.latestMovies!.length;
    }else{
      return value.populars!.length;
    }
  }

  Movie getItem(MoviesProv value, int index) {
    if(typeOfMovie == "populars"){
      return value.populars![index];
    }else if(typeOfMovie == "recommended"){
      return value.recommendeds![index];
    }else if(typeOfMovie == "latest") {
      return value.latestMovies![index];
    }else{
      return value.populars![index];
    }
  }


}
