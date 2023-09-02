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
      var callTrendingContents = _contentRepositoryImpl.getTrendingContents(limit: 5);
      var callPopularContents = _contentRepositoryImpl.getPopularContents(limit: 5);
      var callRecommendedCategories = _categoryRepositoryImpl
          .getRecommendedCategories(limit: 5);
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
              var trendingContents = results[0] as List<ContentModel>;

              if(trendingContents.isNotEmpty){
                listing.add(TrendingContents(
                    "Trending Contents", trendingContents));
              }

            }
            break;
          case 1:
            {
              var data = results[1] as List<ContentModel>;

              if(data.isNotEmpty){
                listing.add(PopularContents(
                    "Popular Contents", data));
              }


            }
            break;
          case 2:
            {
              var data = results[2] as List<CategoryModel>;

              if(data.isNotEmpty){
                listing.add(RecommendCategories(
                    "Recommended Categories", data));
              }

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