import 'package:movie_app/data/search/models/search.dart';
import 'package:movie_app/domain/search/entities/search.dart';

class SearchMapper {
  static SearchEntity toEntity(SearchModel model) {
    return SearchEntity(
        success: model.success,
        content: ContentEntity(
            status: model.content.status,
            msg: model.content.msg,
            data: DataEntity(
                seoOnPage: SeoOnPageEntity(
                    ogType: model.content.data.seoOnPage.ogType,
                    titleHead: model.content.data.seoOnPage.titleHead,
                    descriptionHead:
                        model.content.data.seoOnPage.descriptionHead,
                    ogImage: model.content.data.seoOnPage.ogImage,
                    ogUrl: model.content.data.seoOnPage.ogUrl),
                breadCrumb: model.content.data.breadCrumb
                    .map((item) => BreadCrumbEntity(
                        name: item.name,
                        isCurrent: item.isCurrent,
                        position: item.position))
                    .toList(),
                titlePage: model.content.data.titlePage,
                items: model.content.data.items
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
                            .map((cat) => CategoryEntity(
                                id: cat.id, name: cat.name, slug: cat.slug))
                            .toList(),
                        country: item.country
                            .map((cou) => CountryEntity(
                                id: cou.id, name: cou.name, slug: cou.slug))
                            .toList()))
                    .toList(),
                params: ParamsEntity(
                  typeSlug: model.content.data.params.typeSlug,
                  filterCategory: model.content.data.params.filterCategory,
                  filterCountry: model.content.data.params.filterCountry,
                  filterYear: model.content.data.params.filterYear,
                  filterType: model.content.data.params.filterType,
                  sortField: model.content.data.params.sortField,
                  sortType: model.content.data.params.sortType,
                  keyword: model.content.data.params.keyword,
                  pagination: PaginationEntity(
                      totalItems:
                          model.content.data.params.pagination.totalItems,
                      totalItemsPerPage: model
                          .content.data.params.pagination.totalItemsPerPage,
                      currentPage:
                          model.content.data.params.pagination.currentPage,
                      totalPages:
                          model.content.data.params.pagination.totalPages),
                ),
                typeList: model.content.data.typeList,
                appDomainFrontend: model.content.data.appDomainFrontend,
                appDomainCdnImage: model.content.data.appDomainCdnImage)));
  }
}
