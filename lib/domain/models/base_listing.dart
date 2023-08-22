import 'package:lseg/domain/domain.dart';

abstract class BaseListing{}

class TrendingContentListing extends BaseListing{
  final List<ContentModel> data;

  TrendingContentListing(this.data);
}
class RecommendedContentListing extends BaseListing{
  final List<ContentModel> data;

  RecommendedContentListing(this.data);
}
class PopularContentListing extends BaseListing{
  final List<ContentModel> data;

  PopularContentListing(this.data);
}

class CategoryContentListing extends BaseListing{
  final List<ContentModel> data;

  CategoryContentListing(this.data);
}

class RecommendedCategoriesListing extends BaseListing{
  final List<CategoryModel> data;

  RecommendedCategoriesListing(this.data);
}


