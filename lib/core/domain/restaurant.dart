class Restaurant{
  final String name;
  final String imagesPath;
  final String imagesPath1;
  final String imagesPath2;
  final String imagesPath3;
  final String logoPath;
  final int deliveryTime;
  final String? offer;
  final bool online;
  final List<String> tags;
  final double rating;
  final bool offerOn;
  Restaurant(  { required this.name,
    required this.imagesPath1,
    required this.imagesPath,
    required this.imagesPath2,
    required this.imagesPath3,
    required this.logoPath,
    required this.deliveryTime,
    this.offer,
    required this.online,
    required this.tags,
    required this.rating,
    required this.offerOn,
  });
}
