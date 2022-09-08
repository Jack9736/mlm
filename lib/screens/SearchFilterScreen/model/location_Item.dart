import 'package:mlm/screens/SearchFilterScreen/model/location_sub.dart';

class LocationItem {
  LocationItem({
    required this.lId,
    required this.lName,
    required this.sub,
  });

  int lId;
  String lName;
  List<LocationSub>? sub;

  factory LocationItem.fromJson(Map<String, dynamic> json) => LocationItem(
        lId: json["l_id"],
        lName: json["l_name"],
        sub: json["sub"] == null
            ? null
            : List<LocationSub>.from(
                json["sub"].map((x) => LocationSub.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "l_id": lId,
        "l_name": lName,
        "sub": sub == null
            ? null
            : List<LocationSub>.from(sub!.map((x) => x.toJson())),
      };
}
