import 'package:flutter/material.dart';
import 'package:demo_2_flutter/Demo/login.dart';
import 'package:demo_2_flutter/Demo/home.dart';
import 'package:demo_2_flutter/Demo/colors.dart';
import 'package:demo_2_flutter/Demo/supplemental/cut_corners_border.dart';
import 'backdrop.dart';
import 'package:demo_2_flutter/Demo/model/product.dart';

class FissApp extends StatelessWidget {
  const FissApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _kShrineTheme,
      title: 'FISH',
      home: Backdrop(
        currentCategory: Category.all,
        frontLayer: HomePage(),
        backLayer: Container(color: kShrineAscentPink,),
        frontTitle: Text('FISH'),
        backTitle: Text('MENU'),
      ),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => const loginPage(),
      fullscreenDialog: true,
    );
  }
}

final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      // primary: kShrinePink100,
      // onPrimary: kShrineBrown900,
      // secondary: kShrineBrown900,
      // error: kShrineErrorRed,

      primary: kShrineAscentPink,
      secondary: kShrineAscentPink,
      error: kShrineAscentPink,
    ),
    scaffoldBackgroundColor: kShrinePurple,
    textTheme: _buildShrineTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      // selectionColor: kShrinePink400,
      selectionColor: kShrineAscentPink,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          // color: kShrineBrown900,
          color: kShrineAscentPink
        ),
      ),
      border: CutCornersBorder(),
    ),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6!.copyWith(
          fontSize: 18.0,
        ),
        caption: base.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );
}
