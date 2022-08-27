// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newsapp/bloc/bloc_app.dart';
import 'package:flutter_newsapp/screens/other_screen.dart';
import 'package:flutter_newsapp/screens/search_screen.dart';
import 'package:flutter_newsapp/screens/sport_screen.dart';
//import 'package:flutter_newsapp/service/dio_helper.dart';
//import 'package:flutter_newsapp/widgets/widget.dart';

import 'package:flutter_newsapp/bloc/states_app.dart';
import 'buisness_screen.dart';

// ignore: must_be_immutable
class NewsApp extends StatelessWidget {
  List screens = [
    BuisnessScreen(),
    SportScreen(),
    OtherScreen(),
  ];

  NewsApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc()
        ..getBuisness()
        ..getSports()
        ..getOther(),
      child: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: screens[AppBloc.get(context).index],
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                                  value: BlocProvider.of<AppBloc>(context),
                                  child: SearchScreen(),
                                )));
                      },
                      icon: Icon(Icons.search))
                ],
                title: Text(
                  'NewsApp',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  AppBloc.get(context).changeNav(index);
                },
                currentIndex: AppBloc.get(context).index,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.business), label: 'Buisness'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.sports_baseball), label: 'Sports'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.science), label: 'Other')
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
