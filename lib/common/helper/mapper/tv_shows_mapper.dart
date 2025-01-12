import 'package:movie_app/data/tv/models/tv.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';

class TvShowsMapper {
  static TvShowsEntity toEntity(TvShowsModel model) {
    return TvShowsEntity(
        status: model.status,
        msg: model.msg,
        data: DataEntity(
          seoOnPage: SeoOnPageEntity(
            ogType: model.data.seoOnPage.ogType,
            titleHead: model.data.seoOnPage.titleHead,
            descriptionHead: model.data.seoOnPage.descriptionHead,
            ogImage: model.data.seoOnPage.ogImage,
            ogUrl: model.data.seoOnPage.ogUrl,
          ),
          breadCrumb: model.data.breadCrumb
              .map((item) => BreadCrumbEntity(
                    name: item.name,
                    slug: item.slug,
                    isCurrent: item.isCurrent,
                    position: item.position,
                  ))
              .toList(),
          titlePage: model.data.titlePage,
          items: model.data.items
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
          params: ParamsEntity(
            typeSlug: model.data.params.typeSlug,
            filterCategory: model.data.params.filterCategory,
            filterCountry: model.data.params.filterCountry,
            filterYear: model.data.params.filterYear,
            filterType: model.data.params.filterType,
            sortField: model.data.params.sortField,
            sortType: model.data.params.sortType,
            pagination: PaginationEntity(
              totalItems: model.data.params.pagination.totalItems,
              totalItemsPerPage: model.data.params.pagination.totalItemsPerPage,
              currentPage: model.data.params.pagination.currentPage,
              totalPages: model.data.params.pagination.totalPages,
            ),
          ),
          typeList: model.data.typeList,
          appDomainFrontend: model.data.appDomainFrontend,
          appDomainCdnImage: model.data.appDomainCdnImage,
        ));
  }
}
