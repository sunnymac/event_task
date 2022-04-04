import 'dart:convert';

EventListModel eventListModelFromJson(String str) =>
    EventListModel.fromJson(json.decode(str));

String eventListModelToJson(EventListModel data) => json.encode(data.toJson());

class EventListModel {
  EventListModel({
    this.success,
    this.data,
    this.totalPages,
    this.count,
  });

  bool? success;
  List<Datum>? data;
  int? totalPages;
  int? count;

  factory EventListModel.fromJson(Map<String, dynamic> json) => EventListModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalPages: json["totalPages"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "totalPages": totalPages,
        "count": count,
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.fullName,
    this.date,
    this.image,
    this.isActive,
    this.isDelete,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.price,
    this.location,
    this.latitude,
    this.longitude,
    this.rating,
    this.time,
    this.likeCount,
    this.disLikeCount,
    this.likedUser,
    this.disLikedUser,
    this.bookMarkedUser,
    this.appartmentNo,
    this.area,
    this.city,
    this.thumbnail,
    this.registeredEvent,
  });

  String? id;
  String? name;
  String? fullName;
  DateTime? date;
  String? image;
  bool? isActive;
  bool? isDelete;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? createdBy;
  int? price;
  String? location;
  double? latitude;
  double? longitude;
  double? rating;
  String? time;
  int? likeCount;
  int? disLikeCount;
  List<String>? likedUser;
  List<dynamic>? disLikedUser;
  List<String>? bookMarkedUser;
  String? appartmentNo;
  String? area;
  String? city;
  String? thumbnail;
  bool? registeredEvent;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        fullName: json["fullName"],
        date: DateTime.parse(json["date"]),
        image: json["image"],
        isActive: json["isActive"],
        isDelete: json["isDelete"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        price: json["price"],
        location: json["location"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        rating: json["rating"].toDouble(),
        time: json["time"],
        likeCount: json["likeCount"],
        disLikeCount: json["disLikeCount"],
        likedUser: List<String>.from(json["likedUser"].map((x) => x)),
        disLikedUser: List<dynamic>.from(json["disLikedUser"].map((x) => x)),
        bookMarkedUser: List<String>.from(json["bookMarkedUser"].map((x) => x)),
        appartmentNo: json["appartmentNo"],
        area: json["area"],
        city: json["city"],
        thumbnail: json["thumbnail"],
        registeredEvent: json["registeredEvent"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "fullName": fullName,
        "date": date!.toIso8601String(),
        "image": image,
        "isActive": isActive,
        "isDelete": isDelete,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "createdBy": createdBy,
        "price": price,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "rating": rating,
        "time": time,
        "likeCount": likeCount,
        "disLikeCount": disLikeCount,
        "likedUser": List<dynamic>.from(likedUser!.map((x) => x)),
        "disLikedUser": List<dynamic>.from(disLikedUser!.map((x) => x)),
        "bookMarkedUser": List<dynamic>.from(bookMarkedUser!.map((x) => x)),
        "appartmentNo": appartmentNo,
        "area": area,
        "city": city,
        "thumbnail": thumbnail,
        "registeredEvent": registeredEvent,
      };
}
