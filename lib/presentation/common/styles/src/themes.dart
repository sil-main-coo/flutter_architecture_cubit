part of style;

class AppThemes {
  static ThemeData defaultTheme() {
    return ThemeData(
      // Define the default brightness and colors.
      primaryColor: mAccentColor,
      accentColor: mAccentColor,
      fontFamily: 'Quicksand',
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0.sp, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 36.0.sp, fontStyle: FontStyle.italic),
        headline3: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        button: TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    );
  }
}
