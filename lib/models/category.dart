class Category {
  final int id;
  final String slug;
  final String name;

  Category({required this.id, required this.slug, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json['id'], slug: json['slug'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'slug': slug, 'name': name};
  }
}
