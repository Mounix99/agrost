class English {

  Map<String, String> titles() => {
    "app_title" : "AGROST"
  };

  Map<String, String> subtitles() => {
    "app_subtitle" : "Let's plant and grow"
  };

  Map<String, String> get strings {
    Map<String, String> allString = {};

    allString.addAll(titles());
    allString.addAll(subtitles());

    return allString;
  }
}