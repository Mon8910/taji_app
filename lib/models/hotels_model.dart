class HotelModels {
  final Map<String, dynamic>? name;
  final Map<String, dynamic>? location;
  final Map<String, dynamic>? image;

  HotelModels({
    required this.name,
    required this.location,
    required this.image,
  });

  factory HotelModels.fromJson(Map<String, dynamic> json) {
    return HotelModels(
      name: json['name'],
      location: json['address'],
      image: json['image'],
    );
  }
}
