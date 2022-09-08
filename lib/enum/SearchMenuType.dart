import 'package:mlm/Utils/constant.dart';

enum SearchMenuType {
  type,
  breed,
  age,
  location,
  size,
  gender,
  personality,
  craatetrained,
  transport,
  vetChecked,
}

searchMenuToString(SearchMenuType time) {
  var list = AppConstant().filterTypeStringList;
  switch (time) {
    case SearchMenuType.type:
      return list[0];

    case SearchMenuType.breed:
      return list[1];

    case SearchMenuType.age:
      return list[2];

    case SearchMenuType.location:
      return list[3];

    case SearchMenuType.size:
      return list[4];

    case SearchMenuType.gender:
      return list[5];

    case SearchMenuType.personality:
      return list[6];

    case SearchMenuType.craatetrained:
      return list[7];

    case SearchMenuType.transport:
      return list[8];

    case SearchMenuType.vetChecked:
      return list[9];
  }
}

searchStringToMenu(String time) {
  time = time.toUpperCase();
  var list = AppConstant().filterTypeStringList;
  if (list[0] == time) {
    return SearchMenuType.type;
  } else if (list[1] == time) {
    return SearchMenuType.breed;
  } else if (list[2] == time) {
    return SearchMenuType.age;
  } else if (list[3] == time) {
    return SearchMenuType.location;
  } else if (list[4] == time) {
    return SearchMenuType.size;
  } else if (list[5] == time) {
    return SearchMenuType.gender;
  } else if (list[6] == time) {
    return SearchMenuType.personality;
  } else if (list[7] == time) {
    return SearchMenuType.craatetrained;
  } else if (list[8] == time) {
    return SearchMenuType.transport;
  } else if (list[9] == time) {
    return SearchMenuType.vetChecked;
  }
}
