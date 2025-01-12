class MovieDetailModel {
  final bool status;
  final String msg;
  final Movie movie;
  final List<EpisodeModel> episodes;

  MovieDetailModel({
    required this.status,
    required this.msg,
    required this.movie,
    required this.episodes,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      status: json['status'] ?? true,
      msg: json['msg'] ?? '',
      movie: Movie.fromJson(json['movie'] ?? []),
      episodes: List<EpisodeModel>.from(
        json['episodes'].map((x) => EpisodeModel.fromJson(x)) ?? [],
      ),
    );
  }
}

class Movie {
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
  final List<CategoryModel> category;
  final List<CountryModel> country;

  final TMDBModel tmdb; // Adding TMDB model
  final IMDBModel imdb; // Adding IMDB model
  final DateTime created; // Adding created time
  final DateTime modified;

  Movie({
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

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      originName: json['origin_name'] ?? '',
      content: json['content'] ?? '',
      type: json['type'] ?? '',
      status: json['status'] ?? '',
      posterUrl: json['poster_url'] ?? '',
      thumbUrl: json['thumb_url'] ?? '',
      isCopyright: json['is_copyright'] ?? false,
      subDocquyen: json['sub_docquyen'] ?? false,
      chieurap: json['chieurap'] ?? '',
      trailerUrl: json['trailer_url'] ?? '',
      time: json['time'] ?? '',
      episodeCurrent: json['episode_current'] ?? '',
      episodeTotal: json['episode_total'] ?? '',
      quality: json['quality'] ?? '',
      lang: json['lang'] ?? '',
      notify: json['notify'] ?? '',
      showtimes: json['showtimes'] ?? '',
      year: json['year'] ?? 0,
      view: json['view'] ?? 0,
      actor: List<String>.from(json['actor'] ?? []),
      director: List<String>.from(json['director'] ?? []),
      category: List<CategoryModel>.from(
          json['category'].map((x) => CategoryModel.fromJson(x)) ?? []),
      country: List<CountryModel>.from(
          json['country'].map((x) => CountryModel.fromJson(x)) ?? []),
      tmdb: TMDBModel.fromJson(json['tmdb'] ?? ''), // Parse TMDB data
      imdb: IMDBModel.fromJson(json['imdb'] ?? ''), // Parse IMDB data
      created: DateTime.parse(json['created']['time']),
      modified: DateTime.parse(json['modified']['time']),
    );
  }
}

class TMDBModel {
  final String type;
  final String id;
  final int season;
  final double voteAverage;
  final int voteCount;

  TMDBModel({
    required this.type,
    required this.id,
    required this.season,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TMDBModel.fromJson(Map<String, dynamic> json) {
    return TMDBModel(
      type: json['type'] ?? '',
      id: json['id'] ?? '',
      season: json['season'] ?? 0,
      voteAverage:
          json['vote_average']?.toDouble() ?? 0.0, // Safe handling of null
      voteCount: json['vote_count'] ?? '',
    );
  }
}

class IMDBModel {
  final String? id;

  IMDBModel({this.id});

  factory IMDBModel.fromJson(Map<String, dynamic> json) {
    return IMDBModel(
      id: json['id'] ?? '',
    );
  }
}

class CategoryModel {
  final String id;
  final String name;
  final String slug;

  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
    );
  }
}

class CountryModel {
  final String id;
  final String name;
  final String slug;

  CountryModel({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
    );
  }
}

class EpisodeModel {
  final String serverName;
  final List<ServerDataModel> serverData;

  EpisodeModel({
    required this.serverName,
    required this.serverData,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      serverName: json['server_name'] ?? '',
      serverData: List<ServerDataModel>.from(
          json['server_data'].map((x) => ServerDataModel.fromJson(x)) ?? []),
    );
  }
}

class ServerDataModel {
  final String name;
  final String slug;
  final String filename;
  final String linkEmbed;
  final String linkM3u8;

  ServerDataModel({
    required this.name,
    required this.slug,
    required this.filename,
    required this.linkEmbed,
    required this.linkM3u8,
  });

  factory ServerDataModel.fromJson(Map<String, dynamic> json) {
    return ServerDataModel(
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      filename: json['filename'] ?? '',
      linkEmbed: json['link_embed'] ?? '',
      linkM3u8: json['link_m3u8'] ?? '',
    );
  }
}
