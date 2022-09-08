import 'dart:convert';

import 'package:mlm/screens/SearchFilterScreen/model/location_Item.dart';

LocationFilter welcomeFromJson(String str) =>
    LocationFilter.fromJson(json.decode(str));

String welcomeToJson(LocationFilter data) => json.encode(data.toJson());

class LocationFilter {
  List<LocationItem>? item;

  LocationFilter({
    this.item,
  });

  LocationFilter.fromJson(Map<String, dynamic> json) {
    if (json['item'] != null) {
      item = <LocationItem>[];
      json['item'].forEach((v) {
        item?.add(LocationItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() => {
        "item": List<LocationItem>.from(item!.map((x) => x.toJson())),
      };
}
