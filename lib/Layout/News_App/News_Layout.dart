// ignore_for_file: file_names
// ignore: file_names

import 'package:flutter/material.dart';
import 'package:news_app/modules/NewsApp_Screens/Search/search_Screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/components/cubit/cubit.dart';
import 'package:news_app/shared/components/cubit/status.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStatus>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
       
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon: Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.brightness_6_outlined,
                ),
                onPressed: () {
                  cubit.changeAppMode();
                },
              ),
            ],
          ),
          body: cubit.screen[cubit.CurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.CurrentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItem,
          ),
        );
      },
    );
  }
}
