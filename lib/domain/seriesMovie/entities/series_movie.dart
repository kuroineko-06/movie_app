class SeriesMovieEntity {
  SeriesMovieEntity({
    required this.content,
  });

  final ContentEntity content;
}

class ContentEntity {
  ContentEntity({
    required this.seoOnPage,
    required this.breadCrumb,
    required this.titlePage,
    required this.items,
    required this.params,
    required this.typeList,
    required this.appDomainFrontend,
    required this.appDomainCdnImage,
  });

  final SeoOnPageEntity seoOnPage;
  final List<BreadCrumbEntity> breadCrumb;
  final String titlePage;
  final List<ItemEntity> items;
  final ParamsEntity params;
  final String typeList;
  final String appDomainFrontend;
  final String appDomainCdnImage;
}

class BreadCrumbEntity {
  BreadCrumbEntity({
    required this.name,
    required this.slug,
    required this.isCurrent,
    required this.position,
  });

  final String name;
  final String slug;
  final bool isCurrent;
  final int position;
}

class ItemEntity {
  ItemEntity({
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
  final List<CategoryEntity> category;
  final List<CountryEntity> country;
}

class CategoryEntity {
  CategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
  });

  final String id;
  final String name;
  final String slug;
}

class CountryEntity {
  CountryEntity({
    required this.id,
    required this.name,
    required this.slug,
  });

  final String id;
  final String name;
  final String slug;
}

class ParamsEntity {
  ParamsEntity({
    required this.typeSlug,
    required this.filterCategory,
    required this.filterCountry,
    required this.filterYear,
    required this.filterType,
    required this.sortField,
    required this.sortType,
    required this.paginationEntity,
  });

  final String typeSlug;
  final List<String> filterCategory;
  final List<String> filterCountry;
  final String? filterYear;
  final String? filterType;
  final String sortField;
  final String sortType;
  final PaginationEntity paginationEntity;
}

class PaginationEntity {
  PaginationEntity({
    required this.totalItems,
    required this.totalItemsPerPage,
    required this.currentPage,
    required this.totalPages,
  });

  final int totalItems;
  final int totalItemsPerPage;
  final int currentPage;
  final int totalPages;
}

class SeoOnPageEntity {
  SeoOnPageEntity({
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
}
