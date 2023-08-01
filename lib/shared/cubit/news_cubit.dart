import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:whatsnew/modules/business_screen.dart';
import 'package:whatsnew/modules/science_screen.dart';

import 'package:whatsnew/modules/sports_screen.dart';

import '../network/remote/dio_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  int currentIndex = 0;
  List<Widget> screens = const [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
  ];

  void changeNavBar(index) {
    currentIndex = index;
    // if (index == 1) {
    //   getscienceNews();
    // } else if (index == 2) {
    //   getSportsNews();
    // }
    emit(NewsNavBarState());
  }

  List<dynamic> business = [];

  void getBusinessNews() {
    emit(BusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '2b36a90e765a47249012e63f9207648a'
    }).then((value) {
      business = value.data['articles'];
      emit(BusinessSuccessState());
    }).catchError((errorm) {
      emit(BusinessFailedState(errorm.toString()));
    });
  }

  List<dynamic> science = [];

  void getscienceNews() {
    emit(scienceLoadingState());

    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '2b36a90e765a47249012e63f9207648a'
      }).then((value) {
        science = value.data['articles'];
        emit(scienceSuccessState());
      }).catchError((errorm) {
        emit(scienceFailedState(errorm.toString()));
      });
    } else {
      emit(scienceSuccessState());
    }
  }

  List<dynamic> sports = [];

  void getSportsNews() {
    emit(SportsLoadingState());

    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '2b36a90e765a47249012e63f9207648a'
      }).then((value) {
        sports = value.data['articles'];
        emit(SportsSuccessState());
      }).catchError((errorm) {
        emit(SportsFailedState(errorm.toString()));
      });
    } else {
      emit(SportsSuccessState());
    }
  }

  List<dynamic> search = [];

  void searchNews(String value) {
    if (search.length == 0) {
      DioHelper.getData(url: 'v2/everything', query: {
        'q': value,
        'apiKey': '2b36a90e765a47249012e63f9207648a',
      }).then((value) {
        search = value.data['articles'];
        emit(SearchSuccessState());
      }).catchError((errorm) {
        emit(SearchFailedState(errorm.toString()));
      });
    } else {
      emit(SearchSuccessState());
    }
  }
}
