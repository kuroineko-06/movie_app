class MovieTrendingEntity {
  MovieTrendingEntity({
    required this.success,
    required this.content,
  });

  final bool success;
  final ContentEntity content;
}

class ContentEntity {
  ContentEntity({
    required this.status,
    required this.items,
    required this.pagination,
  });

  final bool status;
  final List<ItemEntity> items;
  final PaginationEntity pagination;
}

class ItemEntity {
  ItemEntity({
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
