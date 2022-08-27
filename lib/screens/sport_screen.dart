import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newsapp/bloc/bloc_app.dart';
import 'package:flutter_newsapp/widgets/widget.dart';
import 'package:flutter_newsapp/bloc/states_app.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BuildCondition(
          condition: AppBloc.get(context).sports.isNotEmpty,
          builder: (context) => ListView.separated(
            itemCount: AppBloc.get(context).sports.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              return articleItem(AppBloc.get(context).sports[index], context);
            },
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
