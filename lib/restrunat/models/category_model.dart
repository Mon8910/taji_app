class CategoryModel {
  final Map<String, dynamic> name;
  
  final Map<String, dynamic> ?image;

  CategoryModel({
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
     
      image: json['image'],
      
    );
  }
}
