import 'package:bloc/bloc.dart';
import 'package:finote_birhan_mobile/blocs/WerebCategoryBloc/wereb_category_event.dart';
import 'package:finote_birhan_mobile/blocs/WerebCategoryBloc/wereb_category_state.dart';
import 'package:finote_birhan_mobile/blocs/mezmursCategoyBloc/mezmurs_category_event.dart';
import 'package:finote_birhan_mobile/blocs/mezmursCategoyBloc/mezmurs_category_state.dart';
import 'package:finote_birhan_mobile/repository/mezmurs_repository.dart';

class WerebCategoryBloc extends Bloc<WerebCategoryEvent,WerebCategoryState>{
  final MezmursRepository mezmursRepository;
  WerebCategoryBloc({required this.mezmursRepository}) : super(LoadingWerebCategoryState()){
    on<WerebCategoryEvent>((event, emit) async {

      try{


        final werebCategory = await mezmursRepository.getWerebCategory();
        emit(LoadingWerebCategoryState(werebCategory));

      }catch(e){

        emit(ErrorWerebCategoryState(e.toString()));
      }

      try{


        final werebCategory = await mezmursRepository.getWerebCategory();
        emit(LoadedWerebCategoryState(werebCategory));

      }catch(e){

        emit(ErrorWerebCategoryState(e.toString()));
      }
    });
  }

}