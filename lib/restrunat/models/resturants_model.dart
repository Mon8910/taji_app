class ResturantsModel {
  final Map<String, dynamic>? name;
  final Map<String, dynamic>? location;
  final Map<String, dynamic>? image;
  final Map<String,dynamic>? area;

  ResturantsModel({
    required this.name,
    required this.location,
    required this.image,
    required this.area
  });

  factory ResturantsModel.fromJson(Map<String, dynamic> json) {
    return ResturantsModel(
      name: json['name'],
      location: json['address'],
      image: json['image'],
      area: json['area']
    );
  }
}
