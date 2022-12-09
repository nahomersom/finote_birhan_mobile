import 'package:bloc/bloc.dart';
import 'package:finote_birhan_mobile/blocs/mezmurPlayerBloc/mezmur_player_event.dart';
import 'package:finote_birhan_mobile/blocs/mezmurPlayerBloc/mezmur_player_state.dart';

class MezmurPlayerBloc extends Bloc<MezmurPlayerEvent,MezmurPlayerState>{
  MezmurPlayerBloc() : super(MezmurPlayerState()){
    on<SelectedMezmur>((event, emit) => {
       emit(SelectedMezmurPlayerState(mezmur: event.mezmur))
    });
  }
}
