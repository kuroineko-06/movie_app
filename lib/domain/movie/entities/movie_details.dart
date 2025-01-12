class MovieDetailEntity {
  final bool status;
  final String msg;
  final MovieEntities movie;
  final List<EpisodeEntity> episodes;

  MovieDetailEntity({
    required this.status,
    required this.msg,
    required this.movie,
    required this.episodes,
  });
}

class MovieEntities {
  final String id;
  final String name;
  final String slug;
  final String originName;
  final String content;
  final String type;
  final String status;
  final String posterUrl;
  final String thumbUrl;
  final bool isCopyright;
  final bool subDocquyen;
  final bool chieurap;
  final String trailerUrl;
  final String time;
  final String episodeCurrent;
  final String episodeTotal;
  final String quality;
  final String lang;
  final String notify;
  final String showtimes;
  final int year;
  final int view;
  final List<String> actor;
  final List<String> director;
  final List<CategoryEntity> category;
  final List<CountryEntity> country;
  final TMDBEntity tmdb; // Adding TMDB entity
  final IMDBEntity imdb; // Adding IMDB entity
  final DateTime created; // Adding created time
  final DateTime modified;

  MovieEntities({
    required this.id,
    required this.name,
    required this.slug,
    required this.originName,
    required this.content,
    required this.type,
    required this.status,
    required this.posterUrl,
    required this.thumbUrl,
    required this.isCopyright,
    required this.subDocquyen,
    required this.chieurap,
    required this.trailerUrl,
    required this.time,
    required this.episodeCurrent,
    required this.episodeTotal,
    required this.quality,
    required this.lang,
    required this.notify,
    required this.showtimes,
    required this.year,
    required this.view,
    required this.actor,
    required this.director,
    required this.category,
    required this.country,
    required this.tmdb,
    required this.imdb,
    required this.created,
    required this.modified,
  });
}

class EpisodeEntity {
  final String serverName;
  final List<ServerDataEntity> serverData;

  EpisodeEntity({
    required this.serverName,
    required this.serverData,
  });
}

class ServerDataEntity {
  final String name;
  final String slug;
  final String filename;
  final String linkEmbed;
  final String linkM3u8;

  ServerDataEntity({
    required this.name,
    required this.slug,
    required this.filename,
    required this.linkEmbed,
    required this.linkM3u8,
  });
}

class CategoryEntity {
  final String id;
  final String name;
  final String slug;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
  });
}

class TMDBEntity {
  final String type;
  final String id;
  final int season;
  final double voteAverage;
  final int voteCount;

  TMDBEntity({
    required this.type,
    required this.id,
    required this.season,
    required this.voteAverage,
    required this.voteCount,
  });
}

class IMDBEntity {
  final String? id;

  IMDBEntity({this.id});
}

class CountryEntity {
  final String id;
  final String name;
  final String slug;

  CountryEntity({
    required this.id,
    required this.name,
    required this.slug,
  });
}
