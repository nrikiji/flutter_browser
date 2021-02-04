class Host {
  final int id;
  final String name;
  final String url;
  final bool include;
  final bool exclude;
  final DateTime createdAt;

  Host({
    this.id,
    this.name,
    this.url,
    this.include,
    this.exclude,
    this.createdAt,
  });

  factory Host.fromMap(Map<String, dynamic> map) {
    return Host(
      id: map["id"],
      name: map["name"],
      url: map["url"],
      include: map["include"] == 1,
      exclude: map["exclude"] == 1,
      createdAt: DateTime.parse(map["created_at"]).toLocal(),
    );
  }
}
