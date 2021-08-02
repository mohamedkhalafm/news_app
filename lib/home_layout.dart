//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/App_cubit.dart';
import 'package:news_app/component.dart';
import 'package:news_app/cubit.dart';
import 'package:news_app/search.dart';
//import 'package:news_app/dio_helper.dart';
import 'package:news_app/states.dart';
class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context , state) {},
      builder: (context , state) 
      {
        var cubit = NewsCubit.get(context);
        return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: 
              Icon(Icons.search), 
                onPressed: ()
                {
                  navigateTo(context, SearchScreen());
                }
                ),
            IconButton(
              icon: 
              Icon(Icons.brightness_2_rounded), 
                onPressed: ()
                {
                 // NewsCubit.get(context).darkMode();
                  AppCubit.get(context).changeAppMode();

                }
                )    
          ],
          title: Text(
            'News',
          ),
        ),
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index)
          {
            cubit.changeState(index);
          },
          items: cubit.bottomItems
          ),
      );
      },
      
    );
  }
}
// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca