class Watch {
  String name;
  String image;
  int year;
  bool isVision;
  String description;

  Watch(this.name, this.image, this.year, this.isVision, this.description);

  factory Watch.fromJson(Map<String, dynamic> json) {
    return Watch(
      json['title'] as String,
      "https://image.tmdb.org/t/p/original${json['backdrop_path'] as String}",
      json['vote_count'] as int,
      true,
      json['overview'] as String,
    );
  }
}
