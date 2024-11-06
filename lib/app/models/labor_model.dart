class Labor {
  final int? id;
  final String title;
  final String subtitle;

  Labor({this.id, required this.title, required this.subtitle});

  Labor.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        title = item["title"],
        subtitle = item["subtitle"];

  Map<String, Object> toMap() {
    return {"title": title, "subtitle": subtitle};
  }
}
