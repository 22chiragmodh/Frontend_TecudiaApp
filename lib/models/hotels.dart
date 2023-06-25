class HotelsData {
  final String imageUrl;
  final String text;
  final String location;
  final int money;
  final double rating;
  int? offer;

  HotelsData(
      {required this.imageUrl,
      required this.text,
      required this.location,
      required this.money,
      required this.rating,
      this.offer});
}
