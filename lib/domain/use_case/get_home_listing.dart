import 'package:lseg/data/remote/firebase_data_source/config_manager.dart';
import 'package:lseg/domain/domain.dart';

class GetHomeListing {
  final ConfigManager _configManager;
  final CategoryRepositoryImpl _categoryRepositoryImpl;
  final ContentRepositoryImpl _contentRepositoryImpl;

  GetHomeListing(this._categoryRepositoryImpl, this._contentRepositoryImpl, this._configManager);

  Future<List<HomeListing>> fetchData() async {
    try {
      var banners = _configManager.fetchBanners();
      var callTrendingContents = _contentRepositoryImpl.getTrendingContents();
      var callPopularContents = _contentRepositoryImpl.getPopularContents();
      var callRecommendedCategories = _categoryRepositoryImpl
          .getRecommendedCategories();
      var results = await Future.wait([
        callTrendingContents,
        callPopularContents,
        callRecommendedCategories
      ]);
      List<HomeListing> listing = [];
      results.asMap().forEach((index, value) {
        switch (index) {
          case 0:
            {
              listing.add(TrendingContents(
                  "Trending Contents", results[0] as List<ContentModel>));
            }
            break;
          case 1:
            {
              listing.add(PopularContents(
                  "Popular Contents", results[1] as List<ContentModel>));
            }
            break;
          case 2:
            {
              listing.add(RecommendCategories(
                  "Recommended Categories", results[2] as List<CategoryModel>));
            }
            break;
        }
      });

      listing.insert(0, Carousal("", banners));
      return listing;
    } catch (e) {
      throw Exception(e);
    }
  }

}