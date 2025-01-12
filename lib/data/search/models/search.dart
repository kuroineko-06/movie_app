class SearchModel {
  SearchModel({
    required this.success,
    required this.content,
  });

  final bool success;
  final Content content;

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      success: json["success"],
      content: Content.fromJson(json["content"]),
    );
  }
}

class Content {
  Content({
    required this.status,
    required this.msg,
    required this.data,
  });

  final String status;
  final String msg;
  final Data data;

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      status: json["status"] ?? "",
      msg: json["msg"] ?? "",
      data: Data.fromJson(json["data"] ?? []),
    );
  }
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      seoOnPage: SeoOnPage.fromJson(json["seoOnPage"] ?? []),
      breadCrumb: List<BreadCrumb>.from(
          json["breadCrumb"]!.map((x) => BreadCrumb.fromJson(x)) ?? []),
      titlePage: json["titlePage"] ?? "",
      items: List<Item>.from(json["items"]!.map((x) => Item.fromJson(x)) ?? []),
      params: Params.fromJson(json["params"] ?? []),
      typeList: json["type_list"] ?? "",
      appDomainFrontend: json["APP_DOMAIN_FRONTEND"] ?? "",
      appDomainCdnImage: json["APP_DOMAIN_CDN_IMAGE"] ?? "",
    );
  }
}

class BreadCrumb {
  BreadCrumb({
    required this.name,
    required this.isCurrent,
    required this.position,
  });

  final String name;
  final bool isCurrent;
  final int position;

  factory BreadCrumb.fromJson(Map<String, dynamic> json) {
    return BreadCrumb(
      name: json["name"] ?? "",
      isCurrent: json["isCurrent"] ?? false,
      position: json["position"] ?? 0,
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

  final DateTime modified;
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
      modified: DateTime.parse(json['modified']['time']),
      id: json["_id"] ?? '',
      name: json["name"] ?? '',
      slug: json["slug"] ?? '',
      originName: json["origin_name"] ?? '',
      type: json["type"] ?? '',
      posterUrl: json["poster_url"] ?? '',
      thumbUrl: json["thumb_url"] ?? '',
      subDocquyen: json["sub_docquyen"] ?? false,
      chieurap: json["chieurap"] ?? false,
      time: json["time"] ?? '',
      episodeCurrent: json["episode_current"] ?? '',
      quality: json["quality"] ?? '',
      lang: json["lang"] ?? '',
      year: json["year"] ?? 0,
      category: List<Category>.from(
          json["category"]!.map((x) => Category.fromJson(x)) ?? []),
      country: List<Country>.from(
          json["country"]!.map((x) => Country.fromJson(x)) ?? []),
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
      id: json["id"] ?? '',
      name: json["name"] ?? '',
      slug: json["slug"] ?? '',
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
      id: json["id"] ?? '',
      name: json["name"] ?? '',
      slug: json["slug"] ?? '',
    );
  }
}

class Params {
  Params({
    required this.typeSlug,
    required this.keyword,
    required this.filterCategory,
    required this.filterCountry,
    required this.filterYear,
    required this.filterType,
    required this.sortField,
    required this.sortType,
    required this.pagination,
  });

  final String typeSlug;
  final String keyword;
  final List<String> filterCategory;
  final List<String> filterCountry;
  final String? filterYear;
  final String? filterType;
  final String sortField;
  final String sortType;
  final Pagination pagination;

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      typeSlug: json["type_slug"] ?? '',
      keyword: json["keyword"] ?? '',
      filterCategory:
          List<String>.from(json["filterCategory"]!.map((x) => x) ?? []),
      filterCountry:
          List<String>.from(json["filterCountry"]!.map((x) => x) ?? []),
      filterYear: json["filterYear"] ?? '',
      filterType: json["filterType"] ?? '',
      sortField: json["sortField"] ?? '',
      sortType: json["sortType"] ?? '',
      pagination: Pagination.fromJson(json["pagination"] ?? []),
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
      totalItems: json["totalItems"] ?? 0,
      totalItemsPerPage: json["totalItemsPerPage"] ?? 0,
      currentPage: json["currentPage"] ?? 0,
      totalPages: json["totalPages"] ?? 0,
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
      ogType: json["og_type"] ?? '',
      titleHead: json["titleHead"] ?? '',
      descriptionHead: json["descriptionHead"] ?? '',
      ogImage: List<String>.from(json["og_image"]!.map((x) => x) ?? []),
      ogUrl: json["og_url"] ?? '',
    );
  }
}
