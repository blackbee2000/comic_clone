import 'dart:convert';

List<Chapters> chaptersFromJson(String str) =>
    List<Chapters>.from(json.decode(str).map((x) => Chapters.fromJson(x)));

String chaptersToJson(List<Chapters> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chapters {
  Chapters({
    this.id,
    this.header,
    this.slug,
    this.viewCount,
    this.updatedDate,
    this.story,
  });

  int? id;
  String? header;
  String? slug;
  int? viewCount;
  DateTime? updatedDate;
  Story? story;

  factory Chapters.fromJson(Map<String, dynamic> json) => Chapters(
        id: json["id"],
        header: json["header"],
        slug: json["slug"],
        viewCount: json["viewCount"],
        updatedDate: json["updatedDate"] != null
            ? DateTime.parse(json["updatedDate"])
            : null,
        story: json["story"] != null ? Story.fromJson(json["story"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "header": header,
        "slug": slug,
        "viewCount": viewCount,
        "updatedDate": updatedDate?.toIso8601String(),
        "story": story?.toJson(),
      };
}

class Story {
  Story({
    this.id,
    this.slug,
  });

  int? id;
  String? slug;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        id: json["id"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
      };
}
