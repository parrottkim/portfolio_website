import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ThemeData lightTheme = ThemeData(
//   fontFamily: 'Pretendard',
//   brightness: Brightness.light,
//   scaffoldBackgroundColor: Color(0xFFF4F6F5),
//   primaryColor: Colors.white,
//   cardColor: Colors.white,
//   shadowColor: Colors.grey.withOpacity(0.25),
//   splashColor: Colors.transparent,
//   dividerColor: Colors.grey[400],
//   highlightColor: Colors.black.withOpacity(0.1),
//   colorScheme: ColorScheme.fromSwatch(
//     brightness: Brightness.light,
//     backgroundColor: Colors.white,
//   ).copyWith(
//     primary: Color(0xFF669F85),
//     secondary: Color(0xFFE5E7E8),
//     tertiary: Color(0xFF556F63),
//     outline: Color(0xFF3B4E52),
//   ),
//   textTheme: TextTheme(
//     headlineSmall: TextStyle(
//       fontWeight: FontWeight.w700,
//       fontSize: 24.0,
//     ),
//     titleLarge: TextStyle(
//       fontWeight: FontWeight.w600,
//       fontSize: 20.0,
//     ),
//     bodyLarge: TextStyle(
//       fontSize: 16.0,
//     ),
//     bodySmall: TextStyle(
//       fontWeight: FontWeight.w400,
//       fontSize: 14.0,
//       color: Colors.grey[700],
//     ),
//   ),
//   appBarTheme: AppBarTheme(
//     elevation: 0.0,
//     backgroundColor: Colors.transparent,
//     foregroundColor: Color(0xFF3B4E52),
//     shadowColor: Colors.grey.withOpacity(0.75),
//     iconTheme: IconThemeData(
//       color: Color(0xFF3B4E52),
//     ),
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.dark,
//       statusBarBrightness: Brightness.light,
//     ),
//   ),
//   buttonTheme: ButtonThemeData(
//     buttonColor: Colors.teal,
//     textTheme: ButtonTextTheme.primary,
//   ),
//   textButtonTheme: TextButtonThemeData(
//     style: TextButton.styleFrom(
//       minimumSize: Size.zero,
//       padding: EdgeInsets.zero,
//       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//     ),
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ButtonStyle(
//       backgroundColor: MaterialStateProperty.all(Color(0xFFD9F6E9)),
//     ),
//   ),
//   iconTheme: IconThemeData(
//     color: Color(0xFF3B4E52),
//   ),
// );

ThemeData darkTheme = ThemeData(
  fontFamily: 'Pretendard',
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF181818),
  primaryColor: Color(0xFF79A1D8),
  cardColor: Color(0xFFE5E7E8),
  shadowColor: Colors.black.withOpacity(0.75),
  splashColor: Colors.transparent,
  dividerColor: Colors.grey[400],
  highlightColor: Colors.black.withOpacity(0.1),
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    backgroundColor: Colors.white,
  ).copyWith(
    primary: Color(0xFF1B4E96),
    secondary: Color(0xFF245FB2),
    tertiary: Color(0xFF517FBF),
    outline: Color(0xFF8B8B8A),
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Schabo',
      fontSize: 70.0,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Schabo',
      fontSize: 60.0,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Schabo',
      fontSize: 30.0,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Schabo',
      fontSize: 24.0,
    ),
    displayLarge: TextStyle(
      fontFamily: 'Pretendard',
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 16.0,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Pretendard',
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      color: Colors.grey[400],
    ),
  ).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    foregroundColor: Color(0xFFE5E7E8),
    shadowColor: Colors.black.withOpacity(0.75),
    iconTheme: IconThemeData(
      color: Color(0xFFE5E7E8),
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFF79A1D8),
    textTheme: ButtonTextTheme.primary,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF2C2C2C),
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.teal),
    ),
  ),
  iconTheme: IconThemeData(
    color: Color(0xFFE5E7E8),
  ),
);

// class ThemeProvider extends ChangeNotifier {
//   final String key = "theme";
//   late SharedPreferences prefs;
//   late bool _darkTheme;

//   bool get darkTheme => _darkTheme;

//   ThemeProvider() {
//     _darkTheme = false;
//     loadFromPrefs();
//   }

//   toggleTheme() {
//     _darkTheme = !_darkTheme;
//     saveToPrefs();
//     notifyListeners();
//   }

//   _initPrefs() async {
//     prefs = await SharedPreferences.getInstance();
//   }

//   loadFromPrefs() async {
//     await _initPrefs();
//     _darkTheme = prefs.getBool(key) ?? false;
//     notifyListeners();
//   }

//   saveToPrefs() async {
//     await _initPrefs();
//     prefs.setBool(key, darkTheme);
//   }
// }
