import 'package:bloc/bloc.dart';
import 'package:finote_birhan_mobile/blocs/recommendationBloc/recommendation_event.dart';
import 'package:finote_birhan_mobile/blocs/recommendationBloc/recommendation_state.dart';
import 'package:finote_birhan_mobile/repository/mezmurs_repository.dart';

class RecommendationMezmurBloc extends Bloc<RecommendationEvent,RecommendationState>{
  final MezmursRepository mezmursRepository;
  RecommendationMezmurBloc({required this.mezmursRepository}) : super(LoadingState()){
    on<RecommendationEvent>((event, emit) async {
      try{

        final recommendMezmurs = await mezmursRepository.getMezmurs(true);

        emit(LoadingState(recommendMezmurs));
      }catch(e){

        emit(ErrorState(e.toString()));
      }

      try{

        final recommendMezmurs = await mezmursRepository.getMezmurs();

        emit(LoadedState(recommendMezmurs));
      }catch(e){

        emit(ErrorState(e.toString()));
      }
    });
}

}