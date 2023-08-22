import 'package:lseg/domain/domain.dart';

abstract class HomeListing{
  abstract String title;
}

class Carousal extends HomeListing{
  @override
  String title;
  List<String> urls;

  Carousal(this.title, this.urls);
}

class TrendingContents extends HomeListing{
  @override
  String title;
  List<ContentModel> data;

  TrendingContents(this.title, this.data);
}

class PopularContents extends HomeListing{
  @override
  String title;
  List<ContentModel> data;

  PopularContents(this.title, this.data);
}

class RecommendCategories extends HomeListing{
  @override
  String title;
  List<CategoryModel> data;

  RecommendCategories(this.title, this.data);
}