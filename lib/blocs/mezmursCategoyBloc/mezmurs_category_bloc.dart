import 'package:bloc/bloc.dart';
import 'package:finote_birhan_mobile/blocs/mezmursCategoyBloc/mezmurs_category_event.dart';
import 'package:finote_birhan_mobile/blocs/mezmursCategoyBloc/mezmurs_category_state.dart';
import 'package:finote_birhan_mobile/repository/mezmurs_repository.dart';

class MezmursCategoryBloc extends Bloc<MezmursCategoryEvent,MezmursCategoryState>{
  final MezmursRepository mezmursRepository;
  MezmursCategoryBloc({required this.mezmursRepository}) : super(LoadingCategoryState()){
    on<MezmursCategoryEvent>((event, emit) async {

      try{

        final mezmursCategory = await mezmursRepository.getMezmursCategory(true);

        emit(LoadingCategoryState(mezmursCategory));

      }catch(e){

        emit(ErrorMezmurCategoryState(e.toString()));
      }
      try{

        final mezmursCategory = await mezmursRepository.getMezmursCategory();

        emit(LoadedMezmurCategoryState(mezmursCategory));

      }catch(e){

        emit(ErrorMezmurCategoryState(e.toString()));
      }
    });
  }

}