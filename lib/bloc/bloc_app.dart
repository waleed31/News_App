import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newsapp/bloc/states_app.dart';
import 'package:flutter_newsapp/service/dio_helper.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(AppintialState());

  static AppBloc get(context) => BlocProvider.of(context);

  int index = 0;
  void changeNav(int currentindex) {
    index = currentindex;
    emit(AppChangeNavBarState());
  }

  List<dynamic> buisness = [];
  void getBuisness() {
    if (buisness.isEmpty) {
      emit(AppGetBuisnessLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '20d6505f9dd74793b24462ff9845d285'
      }).then((value) {
        buisness = value.data['articles'];
        // ignore: avoid_print
        print(buisness[0]['title']);
        emit(AppGetBuisnessSucceedState());
      }).catchError((erorr) {
        // ignore: avoid_print
        print(erorr.toString());
        emit(AppGetBuisnessErorrState());
      });
    } else {
      emit(AppGetBuisnessSucceedState());
    }
  }

  List<dynamic> sports = [];
  void getSports() {
    if (sports.isEmpty) {
      emit(AppGetSportLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'sport',
        'apiKey': '20d6505f9dd74793b24462ff9845d285'
      }).then((value) {
        sports = value.data['articles'];
        // ignore: avoid_print
        print(sports[0]['title']);
        emit(AppGetSportSucceedState());
      }).catchError((erorr) {
        // ignore: avoid_print
        print(erorr.toString());
        emit(AppGetSportErorrState());
      });
    } else {
      emit(AppGetSportSucceedState());
    }
  }

  List<dynamic> other = [];
  void getOther() {
    if (other.isEmpty) {
      emit(AppGetOtherLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'sources': 'techcrunch',
        'apiKey': '20d6505f9dd74793b24462ff9845d285'
      }).then((value) {
        other = value.data['articles'];
        // ignore: avoid_print
        print(other[0]['title']);
        emit(AppGetOtherSucceedState());
      }).catchError((erorr) {
        // ignore: avoid_print
        print(erorr.toString());
        emit(AppGetOtherErorrState());
      });
    } else {
      emit(AppGetOtherSucceedState());
    }
  }

  List<dynamic> search = [];
  void getSearch(String sub) {
    emit(AppSearchLoadingstate());
    search = [];
    DioHelper.getData(
            url: 'v2/everything',
            query: {'q': sub, 'apiKey': '20d6505f9dd74793b24462ff9845d285'})
        .then((value) {
      search = value.data['articles'];
      // ignore: avoid_print
      print(search[0]['title']);
      emit(AppSearchSucceedState());
    }).catchError((erorr) {
      // ignore: avoid_print
      print(erorr.toString());
      emit(AppSearchErorrState());
    });
  }
}
