class Buku {
  int? id;
  String? author_name;
  String? nationality;
  int? birth_year;

  Buku({
    this.id,
    this.author_name,
    this.nationality,
    this.birth_year,
  });

  factory Buku.fromJson(Map<String, dynamic> json) {
    return Buku(
      id: json['id'],
      author_name: json['author_name'],
      nationality: json['nationality'],
      birth_year: json['birth_year'],
    );
  }
}
