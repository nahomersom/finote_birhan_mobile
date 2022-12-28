import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finote_birhan_mobile/blocs/recommendationBloc/recommendation_event.dart';
import 'package:finote_birhan_mobile/repository/mezmurs_repository.dart';
import 'package:flutter/foundation.dart';
import '../../repository/models/recomended.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../mezmurPlayerBloc/mezmur_player_bloc.dart';


part 'recommendation_state.dart';
class RecommendationMezmurBloc extends Bloc<RecommendationEvent,RecommendationState> {
   MezmurPlayerBloc? playerBloc;
  final MezmursRepository mezmursRepository;

  RecommendationMezmurBloc({required this.mezmursRepository})
      :super(const RecommendationState()){
      on<GetRecommended>(_mapGetRecommendedEventToState);
      on<RefreshRecommend>(_mapGetRecommendedEventToState);

  }


void _mapGetRecommendedEventToState(event, Emitter<RecommendationState> emit) async{
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (kDebugMode) {
    print(connectivityResult);

  }emit(state.copyWith(status: recommendationStatus.loading));
  try{

        final recommendMezmurs = await mezmursRepository.getMezmurs();

      emit(state.copyWith(
          status: recommendationStatus.success,
          recommended: recommendMezmurs
      ));
      // playerBloc?.emit(recommendMezmurs);
      }catch(e){

        emit(state.copyWith(status: recommendationStatus.error));
      }
}
}
//   RecommendationMezmurBloc({required this.mezmursRepository}) : super(LoadingState()){
//     on<RecommendationEvent>((event, emit) async {
//       try{
//
//         final recommendMezmurs = await mezmursRepository.getMezmurs(true);
//
//         emit(LoadingState(recommendMezmurs));
//       }catch(e){
//
//         emit(ErrorState(e.toString()));
//       }
//
//       try{
//
//         final recommendMezmurs = await mezmursRepository.getMezmurs();
//
//         emit(LoadedState(recommendMezmurs));
//       }catch(e){
//
//         emit(ErrorState(e.toString()));
//       }
//     });
// }

