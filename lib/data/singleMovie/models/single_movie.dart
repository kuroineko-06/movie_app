class SingleMovieModel {
  SingleMovieModel({
    required this.content,
  });

  final Content content;

  factory SingleMovieModel.fromJson(Map<String, dynamic> json) {
    if (json["content"] == null) {
      throw Exception("Content is null");
    }
    return SingleMovieModel(
      content: Content.fromJson(json["content"]),
    );
  }
}

class Content {
  Content({
    required this.seoOnPage,
    required this.breadCrumb,
    required this.titlePage,
    required this.items,
    required this.params,
    required this.typeList,
    required this.appDomainFrontend,
    required this.appDomainCdnImage,
  });

  final SeoOnPage seoOnPage;
  final List<BreadCrumb> breadCrumb;
  final String titlePage;
  final List<Item> items;
  final Params params;
  final String typeList;
  final String appDomainFrontend;
  final String appDomainCdnImage;

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      seoOnPage: SeoOnPage.fromJson(json["seoOnPage"]),
      breadCrumb: List<BreadCrumb>.from(
          json["breadCrumb"]!.map((x) => BreadCrumb.fromJson(x))),
      titlePage: json["titlePage"] ?? "", // Provide a default value
      items: List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      params: Params.fromJson(json["params"]),
      typeList: json["type_list"] ?? "", // Provide a default value
      appDomainFrontend:
          json["APP_DOMAIN_FRONTEND"] ?? "", // Provide a default value
      appDomainCdnImage:
          json["APP_DOMAIN_CDN_IMAGE"] ?? "", // Provide a default value
    );
  }
}

class BreadCrumb {
  BreadCrumb({
    required this.name,
    required this.slug,
    required this.isCurrent,
    required this.position,
  });

  final String name;
  final String slug;
  final bool isCurrent;
  final int position;

  factory BreadCrumb.fromJson(Map<String, dynamic> json) {
    return BreadCrumb(
      name: json["name"] ?? "", // Provide a default value
      slug: json["slug"] ?? "", // Provide a default value
      isCurrent: json["isCurrent"] ?? false, // Provide a default value
      position: json["position"] ?? 0, // Provide a default value
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
    required this.type,
    required this.posterUrl,
    required this.thumbUrl,
    required this.subDocquyen,
    required this.chieurap,
    required this.time,
    required this.episodeCurrent,
    required this.quality,
    required this.lang,
    required this.year,
    required this.category,
    required this.country,
  });

  final DateTime modified; // Ensure this is a DateTime
  final String id;
  final String name;
  final String slug;
  final String originName;
  final String type;
  final String posterUrl;
  final String thumbUrl;
  final bool subDocquyen;
  final bool chieurap;
  final String time;
  final String episodeCurrent;
  final String quality;
  final String lang;
  final int year;
  final List<Category> category;
  final List<Country> country;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      modified: DateTime.parse(json["modified"]["time"]), // Parse as DateTime
      id: json["_id"] ?? "", // Provide a default value
      name: json["name"] ?? "", // Provide a default value
      slug: json["slug"] ?? "", // Provide a default value
      originName: json["origin_name"] ?? "", // Provide a default value
      type: json["type"] ?? "", // Provide a default value
      posterUrl: json["poster_url"] ?? "", // Provide a default value
      thumbUrl: json["thumb_url"] ?? "", // Provide a default value
      subDocquyen: json["sub_docquyen"] ?? false, // Provide a default value
      chieurap: json["chieurap"] ?? false, // Provide a default value
      time: json["time"] ?? "", // Provide a default value
      episodeCurrent: json["episode_current"] ?? "", // Provide a default value
      quality: json["quality"] ?? "", // Provide a default value
      lang: json["lang"] ?? "", // Provide a default value
      year: json["year"] ?? 0, // Provide a default value
      category: List<Category>.from(
          json["category"]?.map((x) => Category.fromJson(x)) ?? []),
      country: List<Country>.from(
          json["country"]?.map((x) => Country.fromJson(x)) ?? []),
    );
  }
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  final String id;
  final String name;
  final String slug;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"] ?? "", // Provide a default value
      name: json["name"] ?? "", // Provide a default value
      slug: json["slug"] ?? "", // Provide a default value
    );
  }
}

class Country {
  Country({
    required this.id,
    required this.name,
    required this.slug,
  });

  final String id;
  final String name;
  final String slug;

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json["id"] ?? "", // Provide a default value
      name: json["name"] ?? "", // Provide a default value
      slug: json["slug"] ?? "", // Provide a default value
    );
  }
}

class Params {
  Params({
    required this.typeSlug,
    required this.filterCategory,
    required this.filterCountry,
    required this.filterYear,
    required this.filterType,
    required this.sortField,
    required this.sortType,
    required this.pagination,
  });

  final String typeSlug;
  final List<String> filterCategory;
  final List<String> filterCountry;
  final String? filterYear; // Nullable
  final String? filterType; // Nullable
  final String sortField;
  final String sortType;
  final Pagination pagination;

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      typeSlug: json["type_slug"] ?? "", // Provide a default value
      filterCategory:
          List<String>.from(json["filterCategory"]?.map((x) => x) ?? []),
      filterCountry:
          List<String>.from(json["filterCountry"]?.map((x) => x) ?? []),
      filterYear: json["filterYear"] ?? "", // Provide a default value
      filterType: json["filterType"] ?? "", // Provide a default value
      sortField: json["sortField"] ?? "", // Provide a default value
      sortType: json["sortType"] ?? "", // Provide a default value
      pagination: Pagination.fromJson(json["pagination"]),
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
      totalItems: json["totalItems"] ?? 0, // Provide a default value
      totalItemsPerPage:
          json["totalItemsPerPage"] ?? 0, // Provide a default value
      currentPage: json["currentPage"] ?? 0, // Provide a default value
      totalPages: json["totalPages"] ?? 0, // Provide a default value
    );
  }
}

class SeoOnPage {
  SeoOnPage({
    required this.ogType,
    required this.titleHead,
    required this.descriptionHead,
    required this.ogImage,
    required this.ogUrl,
  });

  final String ogType;
  final String titleHead;
  final String descriptionHead;
  final List<String> ogImage;
  final String ogUrl;

  factory SeoOnPage.fromJson(Map<String, dynamic> json) {
    return SeoOnPage(
      ogType: json["og_type"] ?? "", // Provide a default value
      titleHead: json["titleHead"] ?? "", // Provide a default value
      descriptionHead: json["descriptionHead"] ?? "", // Provide a default value
      ogImage: List<String>.from(json["og_image"]?.map((x) => x) ?? []),
      ogUrl: json["og_url"] ?? "", // Provide a default value
    );
  }
}
