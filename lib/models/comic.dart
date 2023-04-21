import 'dart:convert';

List<Comic> comicFromJson(String str) =>
    List<Comic>.from(json.decode(str).map((x) => Comic.fromJson(x)));

String comicToJson(List<Comic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comic {
  Comic({
    this.id,
    this.title,
    this.author,
    this.slug,
    this.description,
    this.poster,
    this.categoryList,
    this.status,
    this.uploadDate,
    this.updatedDate,
    this.deletedAt,
  });

  int? id;
  String? title;
  String? author;
  String? slug;
  List<String>? description;
  String? poster;
  List<String>? categoryList;
  String? status;
  DateTime? uploadDate;
  DateTime? updatedDate;
  dynamic deletedAt;

  factory Comic.fromJson(Map<String, dynamic> json) => Comic(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        slug: json["slug"],
        description: json["description"] != null
            ? List<String>.from(json["description"].map((x) => x))
            : null,
        poster: json["poster"],
        categoryList: json["categoryList"] != null
            ? List<String>.from(json["categoryList"].map((x) => x))
            : null,
        status: json["status"],
        uploadDate: DateTime.parse(json["uploadDate"]),
        updatedDate: DateTime.parse(json["updatedDate"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "slug": slug,
        "description": description != null
            ? List<dynamic>.from(description!.map((x) => x))
            : null,
        "poster": poster,
        "categoryList": categoryList != null
            ? List<dynamic>.from(categoryList!.map((x) => x))
            : null,
        "status": status,
        "uploadDate": uploadDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
