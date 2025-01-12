import 'package:movie_app/domain/movie/entities/movie_details.dart';
import 'package:movie_app/data/movie/models/movie_details.dart';

class MovieDetailMapper {
  // Method to map MovieDetailModel to MovieDetailEntity
  static MovieDetailEntity toEntity(MovieDetailModel model) {
    return MovieDetailEntity(
      status: model.status, // Mapping status
      msg: model.msg, // Mapping message
      movie: MovieEntities(
        id: model.movie.id,
        name: model.movie.name,
        slug: model.movie.slug,
        created: model.movie.created,
        modified: model.movie.modified,
        tmdb: TMDBMapper.toEntity(model.movie.tmdb),
        imdb: IMDBMapper.toEntity(model.movie.imdb),
        originName: model.movie.originName,
        content: model.movie.content,
        type: model.movie.type,
        status: model.movie.status,
        posterUrl: model.movie.posterUrl,
        thumbUrl: model.movie.thumbUrl,
        isCopyright: model.movie.isCopyright,
        subDocquyen: model.movie.subDocquyen,
        chieurap: model.movie.chieurap,
        trailerUrl: model.movie.trailerUrl,
        time: model.movie.time,
        episodeCurrent: model.movie.episodeCurrent,
        episodeTotal: model.movie.episodeTotal,
        quality: model.movie.quality,
        lang: model.movie.lang,
        notify: model.movie.notify,
        showtimes: model.movie.showtimes,
        year: model.movie.year,
        view: model.movie.view,
        actor: model.movie.actor,
        director: model.movie.director,
        category: model.movie.category
            .map((category) => CategoryEntity(
                  id: category.id,
                  name: category.name,
                  slug: category.slug,
                ))
            .toList(),
        country: model.movie.country
            .map((country) => CountryEntity(
                  id: country.id,
                  name: country.name,
                  slug: country.slug,
                ))
            .toList(),
      ),
      episodes: model.episodes
          .map((episode) => EpisodeEntity(
                serverName: episode.serverName,
                serverData: episode.serverData
                    .map((data) => ServerDataEntity(
                          name: data.name,
                          slug: data.slug,
                          filename: data.filename,
                          linkEmbed: data.linkEmbed,
                          linkM3u8: data.linkM3u8,
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }
}

class TMDBMapper {
  static TMDBEntity toEntity(TMDBModel model) {
    return TMDBEntity(
      type: model.type,
      id: model.id,
      season: model.season,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
    );
  }
}

class IMDBMapper {
  static IMDBEntity toEntity(IMDBModel model) {
    return IMDBEntity(
      id: model.id,
    );
  }
}
