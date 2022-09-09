import 'dart:convert';

import 'location_sub.dart';

LocationFilterModel welcomeFromJson(String str) =>
    LocationFilterModel.fromJson(json.decode(str));

String welcomeToJson(LocationFilterModel data) => json.encode(data.toJson());

class LocationFilterModel {
  List<LocationSub>? item;

  LocationFilterModel({
    this.item,
  });

  LocationFilterModel.fromJson(Map<String, dynamic> json) {
    if (json['item'] != null) {
      item = <LocationSub>[];
      json['item'].forEach((v) {
        item?.add(LocationSub.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() => {
        "item": List<LocationSub>.from(item!.map((x) => x.toJson())),
      };
}
