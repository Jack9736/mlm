enum SearchMenuType {
  TYPE,
  BREED,
  AGE,
  LOCATION,
  SIZE,
  GENDER,
  PERSONALITY,
  CRAATETRAINED,
  TRANSPORT,
  VETCHECKED,
}

SearchMenuToString(SearchMenuType time) {
  switch (time) {
    case SearchMenuType.TYPE:
      return "TYPE";

    case SearchMenuType.BREED:
      return "BREED";

    case SearchMenuType.AGE:
      return "AGE";

    case SearchMenuType.LOCATION:
      return "LOCATION";

    case SearchMenuType.SIZE:
      return "SIZE";

    case SearchMenuType.GENDER:
      return "GENDER";

    case SearchMenuType.PERSONALITY:
      return "PERSONALITY";

    case SearchMenuType.CRAATETRAINED:
      return "CRAATE TRAINED";

    case SearchMenuType.TRANSPORT:
      return "TRANSPORT";

    case SearchMenuType.VETCHECKED:
      return "VET CHECKED";
  }
}

searchStringToMenu(String time) {
  switch (time) {
    case "TYPE":
      return SearchMenuType.TYPE;

    case "BREED":
      return SearchMenuType.BREED;

    case "AGE":
      return SearchMenuType.AGE;

    case "LOCATION":
      return SearchMenuType.LOCATION;

    case "SIZE":
      return SearchMenuType.SIZE;

    case "GENDER":
      return SearchMenuType.GENDER;

    case "PERSONALITY":
      return SearchMenuType.PERSONALITY;

    case "CRAATETRAINED":
      return SearchMenuType.CRAATETRAINED;

    case "TRANSPORT":
      return SearchMenuType.TRANSPORT;

    case "VETCHECKED":
      return SearchMenuType.VETCHECKED;
  }
}
