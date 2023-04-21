import 'dart:convert';

ChaptersRead chaptersReadFromJson(String str) =>
    ChaptersRead.fromJson(json.decode(str));

String chaptersReadToJson(ChaptersRead data) => json.encode(data.toJson());

class ChaptersRead {
  ChaptersRead({
    this.id,
    this.header,
    this.slug,
    this.body,
    this.viewCount,
    this.uploadDate,
    this.updatedDate,
    this.deletedAt,
    this.story,
  });

  int? id;
  String? header;
  String? slug;
  List<String>? body;
  int? viewCount;
  DateTime? uploadDate;
  DateTime? updatedDate;
  dynamic deletedAt;
  Story? story;

  factory ChaptersRead.fromJson(Map<String, dynamic> json) => ChaptersRead(
        id: json["id"],
        header: json["header"],
        slug: json["slug"],
        body: json["body"] != null
            ? List<String>.from(json["body"].map((x) => x))
            : null,
        viewCount: json["viewCount"],
        uploadDate: json["uploadDate"] != null
            ? DateTime.parse(json["uploadDate"])
            : null,
        updatedDate: json["updatedDate"] != null
            ? DateTime.parse(json["updatedDate"])
            : null,
        deletedAt: json["deletedAt"],
        story: json["story"] != null ? Story.fromJson(json["story"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "header": header,
        "slug": slug,
        "body": body != null ? List<dynamic>.from(body!.map((x) => x)) : null,
        "viewCount": viewCount,
        "uploadDate": uploadDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
        "deletedAt": deletedAt,
        "story": story?.toJson(),
      };
}

class Story {
  Story({
    required this.id,
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

  factory Story.fromJson(Map<String, dynamic> json) => Story(
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
        uploadDate: json["uploadDate"] != null
            ? DateTime.parse(json["uploadDate"])
            : null,
        updatedDate: json["updatedDate"] != null
            ? DateTime.parse(json["updatedDate"])
            : null,
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
