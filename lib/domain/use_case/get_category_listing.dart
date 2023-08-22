import 'package:lseg/domain/domain.dart';
import 'package:lseg/domain/models/base_listing.dart';

class GetCategoryListing {
  final ContentRepositoryImpl _contentRepositoryImpl;
  final CategoryRepositoryImpl _categoryRepositoryImpl;

  GetCategoryListing(this._categoryRepositoryImpl,this._contentRepositoryImpl );

  Future<BaseListing> fetchListing(CategoryType type,
      {String? categoryId}) async {
    switch (type) {
      case CategoryType.trendingContent:
        {
          try {
            var result = await _contentRepositoryImpl.getTrendingContents();

            return TrendingContentListing(result);
          } catch (e) {
            throw Exception(e);
          }
        }

      case CategoryType.popularContent:
        {
          try {
            var result = await _contentRepositoryImpl.getPopularContents();

            return PopularContentListing(result);
          } catch (e) {
            throw Exception(e);
          }
        }

      case CategoryType.recommendedContent:
        {
          try {
            var result = await _contentRepositoryImpl
                .getRecommendedContentOfCategory(categoryId!);

            return RecommendedContentListing(result);
          } catch (e) {
            throw Exception(e);
          }
        }
      case CategoryType.recommendedCategories:
        {
          try {
            var result =
                await _categoryRepositoryImpl.getRecommendedCategories();

            return RecommendedCategoriesListing(result);
          } catch (e) {
            throw Exception(e);
          }
        }

      case CategoryType.contentOfCategory:
        {
          try {
            var result =
                await _contentRepositoryImpl.getContentByCategory(categoryId!);

            return CategoryContentListing(result);
          } catch (e) {
            throw Exception(e);
          }
        }
    }
  }
}
