import 'package:movie_app/data/movie/models/movie.dart';
import 'package:movie_app/domain/movie/entities/movie.dart';

class MovieMapper {
  static MovieTrendingEntity toEntity(MovieTrendingModel model) {
    return MovieTrendingEntity(
        success: model.success,
        content: ContentEntity(
            status: model.content.status,
            items: model.content.items
                .map((item) => ItemEntity(
                    modified: item.modified,
                    id: item.id,
                    name: item.name,
                    slug: item.slug,
                    originName: item.originName,
                    posterUrl: item.posterUrl,
                    thumbUrl: item.thumbUrl,
                    year: item.year))
                .toList(),
            pagination: PaginationEntity(
                totalItems: model.content.pagination.totalItems,
                totalItemsPerPage: model.content.pagination.totalItemsPerPage,
                currentPage: model.content.pagination.currentPage,
                totalPages: model.content.pagination.totalPages)));
  }
}
