import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsnew/modules/search_screen.dart';
import 'package:whatsnew/shared/cubit/news_cubit.dart';
import 'package:whatsnew/shared/network/remote/dio_helper.dart';

import 'layouts/home_layout.dart';

void main() {
  DioHelper.init();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getBusinessNews()
        ..getscienceNews()
        ..getSportsNews(),
      child: MaterialApp(
        routes: {
          'HomeLayout': (context) => HomeLayout(),
          'SearchScreen': (context) => SearchScreen(),
        },
        initialRoute: 'HomeLayout',
        theme: ThemeData(
            primarySwatch: Colors.orange,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
              backgroundColor: Colors.white,
              elevation: 0.0,
            )),
        debugShowCheckedModeBanner: false,
        home: const HomeLayout(),
      ),
    );
  }
}
