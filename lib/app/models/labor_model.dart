class Labor {
  final int? id;
  final String title;
  final String subtitle;
  bool isCompleted;

  Labor({
    this.id,
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
  });

  Labor.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        title = item["title"],
        subtitle = item["subtitle"],
        isCompleted = item["isCompleted"] == 1;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "subtitle": subtitle,
      "isCompleted": isCompleted ? 1 : 0,
    };
  }
}
