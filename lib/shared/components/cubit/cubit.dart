import 'package:flutter/material.dart';

import 'package:news_app/modules/NewsApp_Screens/Business/business_screen.dart';
import 'package:news_app/modules/NewsApp_Screens/Health/health_screen.dart';
import 'package:news_app/modules/NewsApp_Screens/Science/science_screen.dart';
import 'package:news_app/modules/NewsApp_Screens/Sports/sport_screen.dart';
import 'package:news_app/modules/NewsApp_Screens/Technology/technology_Screen.dart';
import 'package:news_app/shared/components/cubit/status.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/Dio_Helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
class NewsCubit extends Cubit<NewsStatus> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

int CurrentIndex=0;
  List<BottomNavigationBarItem> bottomItem=[
    const BottomNavigationBarItem(
        icon: Icon(
      Icons.business_center_outlined,
      ),
  label: 'Business',
        ),
  const  BottomNavigationBarItem(
    icon:
      Icon(
        Icons.sports_soccer_rounded,
      ),
    label: 'Sport',
  ),
   const BottomNavigationBarItem(
     icon: Icon(
       Icons.science_outlined,
     ),
     label: 'Science',
   ),
   const BottomNavigationBarItem(
     icon: Icon(
       Icons.health_and_safety_outlined,
     ),
     label: 'health',
   ),
   const BottomNavigationBarItem(
     icon: Icon(
       Icons.phone_android,
     ),
     label: 'technology',
   ),
  ];

  List <Widget>screen=[
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    HealthScreen(),
    TechnologyScreen(),
  ];

  void changeBottomNavBar(int index){

    CurrentIndex=index;
if(index==0)getBusiness();
    if(index==1) getSport();
    if(index==2) getScience();
    if(index==3) getHealth();
    if(index==4) getTechnology();


    emit(NewsBottomNavState());
  }

  List<dynamic>business=[];

  void getBusiness()
  {

    emit(NewsGetBusinessLoadingState());
    if(business.length==0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'64dc4ac09c7140bc8d73151e446b88d4',
        },
      ).then((value) {
        business= value.data['articles'];
        emit(NewsGetBusinessSuccessState());
      }).catchError((error){
        emit(NewsGetBusinessErrorState(error.toString()));
        print(error.toString());
      });
    }else{
      emit(NewsGetBusinessSuccessState());
    }

  }

  List<dynamic>sport=[];

  void getSport()
  {
    emit(NewsGetSportLoadingState());
    if(sport.length==0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sport',
          'apiKey':'64dc4ac09c7140bc8d73151e446b88d4',
        },
      ).then((value) {
        sport= value.data['articles'];
        emit(NewsGetSportSuccessState());
      }).catchError((error){
        emit(NewsGetSportErrorState(error.toString()));
        print(error.toString());
      });
    }else{
      emit(NewsGetSportSuccessState());
    }

  }

  List<dynamic>science=[];

  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    if(science.length==0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'64dc4ac09c7140bc8d73151e446b88d4',
        },
      ).then((value) {
        science= value.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        emit(NewsGetScienceErrorState(error.toString()));
        print(error.toString());
      });
    }else{
      emit(NewsGetScienceSuccessState());
    }

  }

  List<dynamic>health=[];

  void getHealth()
  {
    emit(NewsGetHealthLoadingState());
    if(health.length==0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'health',
          'apiKey':'64dc4ac09c7140bc8d73151e446b88d4',
        },
      ).then((value) {
        health= value.data['articles'];
        emit(NewsGetHealthSuccessState());
      }).catchError((error){
        emit(NewsGetHealthErrorState(error.toString()));
        print(error.toString());
      });
    }else{
      emit(NewsGetHealthSuccessState());
    }

  }

  List<dynamic>technology=[];

  void getTechnology()
  {
    emit(NewsGetTechnologyLoadingState());
    if(technology.length==0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'technology',
          'apiKey':'64dc4ac09c7140bc8d73151e446b88d4',
        },
      ).then((value) {
        technology= value.data['articles'];
        emit(NewsGetTechnologySuccessState());
      }).catchError((error){
        emit(NewsGetTechnologyErrorState(error.toString()));
        print(error.toString());
      });
    }else{
      emit(NewsGetTechnologySuccessState());
    }

  }


  List<dynamic>search=[];

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {

        'q':'$value',

        'apiKey':'64dc4ac09c7140bc8d73151e446b88d4',
      },
    ).then((value) {
      search= value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      emit(NewsGetSearchErrorState(error.toString()));
      print(error.toString());
    });
  }


  bool isDark = false;
  void changeAppMode( {bool? fromShared})
  {
    if(fromShared !=null){
      isDark=fromShared;
      emit(NewsChangeModeState());
    }else {
     isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).
      then((value) {
        emit(NewsChangeModeState());
      });
    }
  }

}

