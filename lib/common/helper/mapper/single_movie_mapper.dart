import 'package:movie_app/data/singleMovie/models/single_movie.dart';
import 'package:movie_app/domain/singleMovie/entities/single_movie.dart';

class SingleMovieMapper {
  static SingleMovieEntity toEntity(SingleMovieModel model) {
    return SingleMovieEntity(
      content: ContentEntity(
        seoOnPage: SeoOnPageEntity(
          ogType: model.content.seoOnPage.ogType,
          titleHead: model.content.seoOnPage.titleHead,
          descriptionHead: model.content.seoOnPage.descriptionHead,
          ogImage: model.content.seoOnPage.ogImage,
          ogUrl: model.content.seoOnPage.ogUrl,
        ),
        breadCrumb: model.content.breadCrumb
            .map((item) => BreadCrumbEntity(
                  name: item.name,
                  slug: item.slug,
                  isCurrent: item.isCurrent,
                  position: item.position,
                ))
            .toList(),
        titlePage: model.content.titlePage,
        items: model.content.items
            .map((item) => ItemEntity(
                  modified: item.modified,
                  id: item.id,
                  name: item.name,
                  slug: item.slug,
                  originName: item.originName,
                  type: item.type,
                  posterUrl: item.posterUrl,
                  thumbUrl: item.thumbUrl,
                  subDocquyen: item.subDocquyen,
                  chieurap: item.chieurap,
                  time: item.time,
                  episodeCurrent: item.episodeCurrent,
                  quality: item.quality,
                  lang: item.lang,
                  year: item.year,
                  category: item.category
                      .map((category) => CategoryEntity(
                            id: category.id,
                            name: category.name,
                            slug: category.slug,
                          ))
                      .toList(),
                  country: item.country
                      .map((country) => CountryEntity(
                            id: country.id,
                            name: country.name,
                            slug: country.slug,
                          ))
                      .toList(),
                ))
            .toList(),
        paramsEntity: ParamsEntity(
          typeSlug: model.content.params.typeSlug,
          filterCategory: model.content.params.filterCategory,
          filterCountry: model.content.params.filterCountry,
          filterYear: model.content.params.filterYear,
          filterType: model.content.params.filterType,
          sortField: model.content.params.sortField,
          sortType: model.content.params.sortType,
          paginationEntity: PaginationEntity(
            totalItems: model.content.params.pagination.totalItems,
            totalItemsPerPage:
                model.content.params.pagination.totalItemsPerPage,
            currentPage: model.content.params.pagination.currentPage,
            totalPages: model.content.params.pagination.totalPages,
          ),
        ),
        typeList: model.content.typeList,
        appDomainFrontend: model.content.appDomainFrontend,
        appDomainCdnImage: model.content.appDomainCdnImage,
      ),
    );
  }
}
