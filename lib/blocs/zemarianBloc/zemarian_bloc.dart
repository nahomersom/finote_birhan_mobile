import 'package:bloc/bloc.dart';
import 'package:finote_birhan_mobile/blocs/zemarianBloc/zemarian_event.dart';
import 'package:finote_birhan_mobile/blocs/zemarianBloc/zemarian_state.dart';
import 'package:finote_birhan_mobile/repository/mezmurs_repository.dart';

class ZemarainBloc extends Bloc<ZemarianEvent,ZemarianState>{
  final MezmursRepository zemarianRepository;
  ZemarainBloc({required this.zemarianRepository}) : super(LoadingZemarianState()){
    on<ZemarianEvent>((event, emit) async {

      try{

        final zemarians = await zemarianRepository.getZemarians();

        emit(LoadingZemarianState(zemarians));
      }catch(e){

        emit(ErrorZemarianState(e.toString()));
      }

      try{

        final zemarians = await zemarianRepository.getZemarians();

        emit(LoadedZemarianState(zemarians));
      }catch(e){

        emit(ErrorZemarianState(e.toString()));
      }
    });
  }

}