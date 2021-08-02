import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component.dart';
import 'package:news_app/cubit.dart';
import 'package:news_app/states.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context , state) {},
      builder: (context , state) 
      {
        var list = NewsCubit.get(context).science;
        return ConditionalBuilder(
        condition: list.length > 0 ,
        builder: (context) =>ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context , index) =>buildArticleItem(list[index], context)
          , separatorBuilder: (context , index) => myDivider()
          , itemCount: 20),
        fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
      
    );
  }
}