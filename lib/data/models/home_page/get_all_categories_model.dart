class GetAllCategoriesModel {
  String? message;
  List<Categories>? categories;

  GetAllCategoriesModel({this.message, this.categories});

  GetAllCategoriesModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Message'] = message;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? categoryImage;
  String? categoryName;

  Categories({this.categoryImage, this.categoryName});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryImage = json['categoryImage'];
    categoryName = json['categoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryImage'] = categoryImage;
    data['categoryName'] = categoryName;
    return data;
  }
}
