import 'dart:convert';

ComicDetail comicDetailFromJson(String str) =>
    ComicDetail.fromJson(json.decode(str));

String comicDetailToJson(ComicDetail data) => json.encode(data.toJson());

class ComicDetail {
  ComicDetail({
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
    this.raters,
    this.ratings,
    this.categories,
    this.bookmarks,
    this.comments,
    this.rateCount,
    this.rateAvg,
    this.favorite,
    this.latestUpdatedDate,
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
  List<Rater>? raters;
  List<Rating>? ratings;
  List<Category>? categories;
  List<Bookmark>? bookmarks;
  List<Comment>? comments;
  int? rateCount;
  int? rateAvg;
  Favorite? favorite;
  DateTime? latestUpdatedDate;

  factory ComicDetail.fromJson(Map<String, dynamic> json) => ComicDetail(
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
        raters: json["raters"] != null
            ? List<Rater>.from(json["raters"].map((x) => Rater.fromJson(x)))
            : null,
        ratings: json["ratings"] != null
            ? List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x)))
            : null,
        categories: json["categories"] != null
            ? List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x)))
            : null,
        bookmarks: json["bookmarks"] != null
            ? List<Bookmark>.from(
                json["bookmarks"].map((x) => Bookmark.fromJson(x)))
            : null,
        comments: json["comments"] != null
            ? List<Comment>.from(
                json["comments"].map((x) => Comment.fromJson(x)))
            : null,
        rateCount: json["rateCount"],
        rateAvg: json["rateAvg"],
        favorite: json["favorite"] != null
            ? Favorite.fromJson(json["favorite"])
            : null,
        latestUpdatedDate: json["latestUpdatedDate"] != null
            ? DateTime.parse(json["latestUpdatedDate"])
            : null,
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
        "raters": raters != null
            ? List<dynamic>.from(raters!.map((x) => x.toJson()))
            : null,
        "ratings": ratings != null
            ? List<dynamic>.from(ratings!.map((x) => x.toJson()))
            : null,
        "categories": categories != null
            ? List<dynamic>.from(categories!.map((x) => x.toJson()))
            : null,
        "bookmarks": bookmarks != null
            ? List<dynamic>.from(bookmarks!.map((x) => x.toJson()))
            : null,
        "comments": comments != null
            ? List<dynamic>.from(comments!.map((x) => x.toJson()))
            : null,
        "rateCount": rateCount,
        "rateAvg": rateAvg,
        "favorite": favorite?.toJson(),
        "latestUpdatedDate": latestUpdatedDate?.toIso8601String(),
      };
}

class Bookmark {
  Bookmark({
    this.id,
    this.updatedDate,
  });

  int? id;
  DateTime? updatedDate;

  factory Bookmark.fromJson(Map<String, dynamic> json) => Bookmark(
        id: json["id"],
        updatedDate: json["updatedDate"] != null
            ? DateTime.parse(json["updatedDate"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
    this.description,
  });

  int? id;
  String? name;
  String? slug;
  String? description;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
      };
}

class Comment {
  Comment({
    this.id,
    this.content,
    this.parentId,
    this.updatedDate,
    this.deletedAt,
    this.replies,
    this.user,
  });

  int? id;
  String? content;
  int? parentId;
  DateTime? updatedDate;
  dynamic deletedAt;
  List<Comment>? replies;
  Rater? user;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        content: json["content"],
        parentId: json["parentId"],
        updatedDate: json["updatedDate"] != null
            ? DateTime.parse(json["updatedDate"])
            : null,
        deletedAt: json["deletedAt"],
        replies: json["replies"] != null
            ? List<Comment>.from(
                json["replies"].map((x) => Comment.fromJson(x)))
            : null,
        user: json["user"] != null ? Rater.fromJson(json["user"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "parentId": parentId,
        "updatedDate": updatedDate?.toIso8601String(),
        "deletedAt": deletedAt,
        "replies": replies != null
            ? List<dynamic>.from(replies!.map((x) => x.toJson()))
            : null,
        "user": user?.toJson(),
      };
}

class Rater {
  Rater({
    this.id,
    this.email,
    this.name,
    this.roles,
    this.permissions,
    this.avatarFilePath,
    this.isEmailConfirmed,
    this.updatedDate,
    this.deletedAt,
  });

  int? id;
  String? email;
  String? name;
  List<String>? roles;
  List<dynamic>? permissions;
  String? avatarFilePath;
  bool? isEmailConfirmed;
  DateTime? updatedDate;
  dynamic deletedAt;

  factory Rater.fromJson(Map<String, dynamic> json) => Rater(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        permissions: json["permissions"] != null
            ? List<dynamic>.from(json["permissions"].map((x) => x))
            : null,
        avatarFilePath: json["avatarFilePath"],
        isEmailConfirmed: json["isEmailConfirmed"],
        updatedDate: json["updatedDate"] != null
            ? DateTime.parse(json["updatedDate"])
            : null,
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "roles":
            roles != null ? List<dynamic>.from(roles!.map((x) => x)) : null,
        "permissions": permissions != null
            ? List<dynamic>.from(permissions!.map((x) => x))
            : null,
        "avatarFilePath": avatarFilePath,
        "isEmailConfirmed": isEmailConfirmed,
        "updatedDate": updatedDate?.toIso8601String(),
        "deletedAt": deletedAt,
      };
}

class Favorite {
  Favorite({
    this.count,
    this.isFavorite,
  });

  int? count;
  bool? isFavorite;

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        count: json["count"],
        isFavorite: json["isFavorite"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "isFavorite": isFavorite,
      };
}

class Rating {
  Rating({
    this.id,
    this.value,
  });

  int? id;
  int? value;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
