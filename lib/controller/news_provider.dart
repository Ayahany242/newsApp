// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/dio_helper.dart';
import '../view/business_screen.dart';
import '../view/science_screen.dart';
import '../view/sport_screen.dart';

class NewsProvider with ChangeNotifier {
  //static NewsProvider get(context) => Provider.of<NewsProvider>(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'ٍSport'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> screens = const [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];
  void changeNavBarIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<dynamic> business = [];
  void getBusiness() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '8ba9e5754d9742cd8a812daa773ffdfc',
    }).then(
      (value) {
        business = value.data['articles'];
        notifyListeners();
        print(business[0]['title']);
      },
    ).catchError(
      (error) {
        print(error.toString());
      },
    );
  }

  List<dynamic> sport = [];
  void getSport() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sport',
      'apiKey': '8ba9e5754d9742cd8a812daa773ffdfc',
    }).then(
      (value) {
        sport = value.data['articles'];
        notifyListeners();
        print(sport[0]['title']);
      },
    ).catchError(
      (error) {
        print(error.toString());
      },
    );
  }

  List<dynamic> science = [];
  void getScience() {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '8ba9e5754d9742cd8a812daa773ffdfc',
      },
    ).then(
      (value) {
        science = value.data['articles'];
        notifyListeners();
        print(science[0]['title']);
      },
    ).catchError(
      (error) {
        print(error.toString());
      },
    );
  }

  List<dynamic> search = [];
  void getsearch(String value) {
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': value,
        'apiKey': '8ba9e5754d9742cd8a812daa773ffdfc',
      },
    ).then(
      (value) {
        search = value.data['articles'];
        notifyListeners();
        print('search = ${search[0]['title']}');
      },
    ).catchError(
      (error) {
        print(error.toString());
      },
    );
  }

  // bool isSearchEmpty = true;
  void onTappedSearch() {
    search = [];
    // isSearchEmpty = !isSearchEmpty;
    notifyListeners();
  }

  // ThemeData theme = lightTheme;
  bool isDarkMode = false;
  void changeAppMode() async {
/*     if (isDarkMode) {
      theme = lightTheme;
    } else {
      theme = darkTheme;
    }
 */
    isDarkMode = !isDarkMode;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('theme', isDarkMode);
    notifyListeners();
  }

  TextStyle get textStyle => TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: isDarkMode ? Colors.white : Colors.black,
      );

  initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    isDarkMode = prefs.getBool('theme') ?? false;
    notifyListeners();
  }
}
/* 
final lightTheme = ThemeData(
      primarySwatch: Colors.deepOrange,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        elevation: 20.0,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    ),
    darkTheme = ThemeData(
      scaffoldBackgroundColor: HexColor('333739'),
      primarySwatch: Colors.deepOrange,
      appBarTheme: AppBarTheme(
        backgroundColor: HexColor('333739'),
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light,
        ),
        // titleTextStyle: const TextStyle(
        //     fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: HexColor('333739'),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        elevation: 20.0,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
 */