class LocationSub {
  LocationSub({
    required this.lId,
    required this.sId,
    required this.lName,
    required this.sub,
  });

  int lId;
  int sId;
  String lName;
  List<LocationSub>? sub;

  factory LocationSub.fromJson(Map<String, dynamic> json) => LocationSub(
        lId: json["l_id"],
        sId: json["s_id"],
        lName: json["l_name"],
        sub: json["sub"] == null
            ? null
            : List<LocationSub>.from(json["sub"].map((x) => LocationSub.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "l_id": lId,
        "s_id": sId,
        "l_name": lName,
        "sub": sub == null
            ? null
            : List<dynamic>.from(sub!.map((x) => x.toJson())),
      };
}