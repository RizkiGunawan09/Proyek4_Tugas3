import 'package:flutter/material.dart';
import 'backdrop.dart';
import 'category_menu_page.dart';
import 'colors.dart';
import 'home.dart';
import 'login.dart';
import 'model/product.dart';
import 'supplemental/cut_corners_border.dart';

class ArtConnectApp extends StatefulWidget {
  const ArtConnectApp({Key? key}) : super(key: key);

  @override
  State<ArtConnectApp> createState() => _ArtConnectAppState();
}

class _ArtConnectAppState extends State<ArtConnectApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArtConnect',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => Backdrop(
              currentCategory: _currentCategory,
              frontLayer: HomePage(category: _currentCategory),
              backLayer: CategoryMenuPage(
                currentCategory: _currentCategory,
                onCategoryTap: _onCategoryTap,
              ),
              frontTitle: const Text('ARTCONNECT'),
              backTitle: const Text('MENU'),
            ),
      },
      theme: _kArtConnectTheme,
    );
  }
}

final ThemeData _kArtConnectTheme = _buildArtConnectTheme();

ThemeData _buildArtConnectTheme() {
  final ThemeData base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kArtConnectGrey100,
      onPrimary: kArtConnectBlack,
      secondary: kArtConnectBlack,
      error: kArtConnectErrorRed,
    ),
    textTheme: _buildArtConnectTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: kArtConnectGrey100,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: kArtConnectBlack,
      backgroundColor: kArtConnectGrey100,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: CutCornersBorder(),
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kArtConnectBlack,
        ),
      ),
      floatingLabelStyle: TextStyle(
        color: kArtConnectBlack,
      ),
    ),
  );
}

TextTheme _buildArtConnectTextTheme(TextTheme base) {
  return base
      .copyWith(
        headlineSmall: base.headlineSmall!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        titleLarge: base.titleLarge!.copyWith(
          fontSize: 18.0,
        ),
        bodySmall: base.bodySmall!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyLarge: base.bodyLarge!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kArtConnectBlack,
        bodyColor: kArtConnectBlack,
      );
}
