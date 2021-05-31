class Food {
  Food(this.id, this.name, this.imageUrl, this.rating, this.tags,
      {this.isSelected});
  int id;
  String name;
  String imageUrl;
  List<String> tags;
  double rating;
  bool isSelected;
}
