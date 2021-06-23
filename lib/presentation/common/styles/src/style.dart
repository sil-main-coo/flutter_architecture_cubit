part of style;

class Style {
  static void styleDefault() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: mColorNavigationBar,
        systemNavigationBarIconBrightness: Brightness.light));
  }
}
