class AllProductModel {
  bool? success;
  List<Data>? data;
  int? page;
  int? recordsPerPage;
  int? totalRecords;
  int? pages;

  AllProductModel({this.success, this.data, this.page, this.recordsPerPage, this.totalRecords, this.pages});

  AllProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    page = json['page'];
    recordsPerPage = json['recordsPerPage'];
    totalRecords = json['totalRecords'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['page'] = page;
    data['recordsPerPage'] = recordsPerPage;
    data['totalRecords'] = totalRecords;
    data['pages'] = pages;
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  String? description;
  bool? isFeatured;
  double? price;
  String? sku;
  int? initialTotalStock;
  bool? isWish;
  double? rating;
  int? stock;
  List<Reviews>? reviews;
  List<Variants>? variants;
  String? status;
  String? brandId;
  String? categoryId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.sId,
      this.title,
      this.description,
      this.isFeatured,
      this.isWish,
      this.rating,
      this.price,
      this.sku,
      this.initialTotalStock,
      this.stock,
      this.variants,
      this.status,
      this.brandId,
      this.categoryId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    isFeatured = json['isFeatured'];
    isWish = json['isWish'];
    price = json['price'];
    rating = json['rating'];
    sku = json['sku'];
    initialTotalStock = json['initialTotalStock'];
    stock = json['stock'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(Variants.fromJson(v));
      });
    }
    status = json['status'];
    brandId = json['brand_id'];
    categoryId = json['category_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['isFeatured'] = isFeatured;
    data['price'] = price;
    data['sku'] = sku;
    data['initialTotalStock'] = initialTotalStock;
    data['isWish'] = isWish;
    data['rating'] = rating;
    data['stock'] = stock;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['brand_id'] = brandId;
    data['category_id'] = categoryId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Reviews {
  String? date;
  String? image;
  String? userName;
  double? rate;
  String? comments;

  Reviews({this.date, this.image, this.userName, this.rate, this.comments});

  Reviews.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    image = json['image'];
    userName = json['userName'];
    rate = json['rate'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['image'] = image;
    data['userName'] = userName;
    data['rate'] = rate;
    data['comments'] = comments;
    return data;
  }
}

class Variants {
  List<String>? images;
  double? price;
  CustomAttributes? customAttributes;
  String? sId;

  Variants({this.images, this.price, this.customAttributes, this.sId});

  Variants.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
    price = json['price'];
    customAttributes = json['customAttributes'] != null ? CustomAttributes.fromJson(json['customAttributes']) : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['images'] = images;
    data['price'] = price;
    if (customAttributes != null) {
      data['customAttributes'] = customAttributes!.toJson();
    }
    data['_id'] = sId;
    return data;
  }
}

class CustomAttributes {
  String? color;

  CustomAttributes({this.color});

  CustomAttributes.fromJson(Map<String, dynamic> json) {
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color'] = color;
    return data;
  }
}
