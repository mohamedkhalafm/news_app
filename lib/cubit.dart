import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business.dart';
import 'package:news_app/cash_helper.dart';
import 'package:news_app/dio_helper.dart';
import 'package:news_app/science.dart';
import 'package:news_app/settings.dart';
import 'package:news_app/sports.dart';
import 'package:news_app/states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;
 bool isDark = false;
 
 Future darkMode() async
 {
   SharedPreferences pref = await SharedPreferences.getInstance();
   pref.setBool('dark', isDark=!isDark);
   emit(NewsDarkModeStates());
 }

 Future getDarkMode() async
 {
   SharedPreferences pref = await SharedPreferences.getInstance();
   // ignore: unnecessary_statements
   pref.getBool('dark') ?? false ;
   emit(NewsGetDarkModeState());
 }


  /*void changeAppMode({bool fromShared})
  {
    if(fromShared!=null)
    {
      isDark = fromShared;
    }
    else
    isDark = isDark;
    isDark = !isDark;
    CashHelper.putData(key: 'isDark', value: isDark).then((value)  
    {
      emit(AppChangeModeState());
    }
    );
    
  } */
  
List<BottomNavigationBarItem> bottomItems = 
[
  /*BottomNavigationBarItem(
    icon: Icon(
      Icons.business_rounded,
    ),
    label: 'Business',
     ),*/
  BottomNavigationBarItem(
    icon: Icon(
      Icons.sports
    ),
    label: 'Sports',
    ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.science
    ),
    label: 'Science',
    ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.settings
    ),
    label: 'Settings',
    ),       
];

List<Widget> screens =
[
  //BusinessScreen(),
  SportsScreen(),
  ScienceScreen(),
  SettingScreen()
];

void changeState (int index)
{
  currentIndex = index ;
  if(index == 1) getSports();
  emit(NewsBottomNavState());
}
/*List<dynamic> business = [];

void getbusiness()
{
  emit(NewsGetBusinessLoadingState());
  DioHelper.getdata(
    url: 'v2/top-headlines', 
    query:{
       'country' : 'eg',
        'category' : 'business',
        'apiKey' : '65f7f556ec76449fa7dc7c0069f040ca'
            }, 
            ).then((value)  
            {
              //print(value.data['totalResults']);
              business = value.data['articles'];
              print(business[0]['title']);
              emit(NewsGetBusinessSuccessState());
            }
            ).catchError((error)
            {
              print(error.toString());
              emit(NewsGetBusinesserrorState(error.toString()));
            }
            );
}
*/

List<dynamic> sports = [];

void getSports()
{
  emit(NewsGetSportsLoadingState());
  DioHelper.getdata(
    url: 'v2/top-headlines', 
    query:{
       'country' : 'eg',
        'category' : 'sports',
        'apiKey' : '65f7f556ec76449fa7dc7c0069f040ca'
            }, 
            ).then((value)  
            {
              print(value.data['totalResults']);
              sports = value.data['articles'];
              print(sports[0]['title']);
              emit(NewsGetSportsSuccessState());
            }
            ).catchError((error)
            {
              print(error.toString());
              emit(NewsGetSportserrorState(error.toString()));
            }
            );
}
List<dynamic> science = [];

void getScience()
{
  emit(NewsGetScienceLoadingState());
  DioHelper.getdata(
    url: 'v2/top-headlines', 
    query:{
       'country' : 'eg',
        'category' : 'science',
        'apiKey' : '65f7f556ec76449fa7dc7c0069f040ca'
            }, 
            ).then((value)  
            {
              print(value.data['totalResults']);
              science = value.data['articles'];
              print(science[0]['title']);
              emit(NewsGetScienceSuccessState());
            }
            ).catchError((error)
            {
              print(error.toString());
              emit(NewsGetScienceerrorState(error.toString()));
            }
            );
}
 List<dynamic> search = [];

void getSearch(String value)
{
  emit(NewsGetSearchLoadingState());
  //search = [];
  DioHelper.getdata(
    url: 'v2/everything', 
    query:{
        'q' : '$value',
        'apiKey' : '65f7f556ec76449fa7dc7c0069f040ca'
            }, 
            ).then((value)  
            {
              print(value.data['totalResults']);
              search = value.data['articles'];
              print(search[0]['title']);
              emit(NewsGetSearchSuccessState());
            }
            ).catchError((error)
            {
              print(error.toString());
              emit(NewsGetSearcheerrorState(error.toString()));
            }
            );
}
}

