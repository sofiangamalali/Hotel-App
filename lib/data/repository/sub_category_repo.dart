import '../data_provider/sub_category_date_provider.dart';
import '../models/category_model.dart';
import '../models/service_model.dart';
import '../models/sub_category_model.dart';

class CategoryRepository {
  final CategoryDataProvider categoryDataProvider;
  CategoryRepository({required this.categoryDataProvider});

  Future<Category> getCategory(String type, String token, String lang) async {
    final category = await categoryDataProvider.getCategory(type, token, lang);
    return Category.fromJson(category);
  }

  Future<SubCategory> getSubCategory(
      int? categoryId, String token, String lang) async {
    final subcategory =
        await categoryDataProvider.getSubCategory(categoryId, token, lang);
    return SubCategory.fromJson(subcategory);
  }

  Future<Service> getService(
      int? subCategoryId, String token, String lang) async {
    final service =
        await categoryDataProvider.getService(subCategoryId, token, lang);
    return Service.fromJson(service);
  }

  Future<List> getAllServirce(String type, String token, String lang) async {
    List allServices = [];

    Category category = await getCategory(type, token, lang);

    for (var element in category.data!) {
      SubCategory subCategory = await getSubCategory(element.id, token, lang);

      for (var element in subCategory.data!) {
        Service service = await getService(element.id, token, lang);

        for (var element in service.data!) {
          allServices.add(element);
        }
      }
    }
    return allServices;
  }
}
