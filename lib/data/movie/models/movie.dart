class MovieTrendingModel {
  MovieTrendingModel({
    required this.success,
    required this.content,
  });

  final bool success;
  final Content content;

  factory MovieTrendingModel.fromJson(Map<String, dynamic> json) {
    return MovieTrendingModel(
      success: json["success"],
      content: Content.fromJson(json["content"]),
    );
  }
}

class Content {
  Content({
    required this.status,
    required this.items,
    required this.pagination,
  });

  final bool status;
  final List<Item> items;
  final Pagination pagination;

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      status: json["status"],
      items: List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      pagination: Pagination.fromJson(json["pagination"]),
    );
  }
}

class Item {
  Item({
    required this.modified,
    required this.id,
    required this.name,
    required this.slug,
    required this.originName,
    required this.posterUrl,
    required this.thumbUrl,
    required this.year,
  });

  final DateTime modified;
  final String id;
  final String name;
  final String slug;
  final String originName;
  final String posterUrl;
  final String thumbUrl;
  final int year;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      modified: DateTime.parse(json['modified']['time']),
      id: json["_id"],
      name: json["name"],
      slug: json["slug"],
      originName: json["origin_name"],
      posterUrl: json["poster_url"],
      thumbUrl: json["thumb_url"],
      year: json["year"],
    );
  }
}

class Pagination {
  Pagination({
    required this.totalItems,
    required this.totalItemsPerPage,
    required this.currentPage,
    required this.totalPages,
  });

  final int totalItems;
  final int totalItemsPerPage;
  final int currentPage;
  final int totalPages;

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      totalItems: json["totalItems"],
      totalItemsPerPage: json["totalItemsPerPage"],
      currentPage: json["currentPage"],
      totalPages: json["totalPages"],
    );
  }
}
