class Ukrainian {
  Map<String, String> titles() => {"app_title": "AGROST"};

  Map<String, String> subtitles() => {"app_subtitle": "Саджаймо та вирощуймо"};

  Map<String, String> get strings {
    Map<String, String> allString = {};

    allString.addAll(titles());
    allString.addAll(subtitles());

    return allString;
  }
}
