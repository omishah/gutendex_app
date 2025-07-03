class Author {
  final String name;
  final int? birthYear;
  final int? deathYear;

  Author({required this.name, this.birthYear, this.deathYear});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json['name'],
      birthYear: json['birth_year'],
      deathYear: json['death_year'],
    );
  }
}
