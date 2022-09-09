class LocationSub {
  LocationSub({
    required this.pId,
    required this.pName,
    required this.id,
    required this.name,
    required this.sub,
  });

  int pId;
  String pName;
  int id;
  String name;
  List<LocationSub>? sub;

  factory LocationSub.fromJson(Map<String, dynamic> json) => LocationSub(
        pId: json["p_id"],
        pName: json["p_name"],
        id: json["id"],
        name: json["name"],
        sub: json["sub"] == null
            ? null
            : List<LocationSub>.from(
                json["sub"].map((x) => LocationSub.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "p_id": pId,
        "p_name": pName,
        "id": id,
        "name": name,
        "sub": sub == null
            ? null
            : List<dynamic>.from(sub!.map((x) => x.toJson())),
      };
}
