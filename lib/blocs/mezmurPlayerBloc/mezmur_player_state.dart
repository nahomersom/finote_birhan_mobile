import 'package:equatable/equatable.dart';
import 'package:finote_birhan_mobile/repository/models/playerModel.dart';

import '../../repository/models/recomended.dart';

class MezmurPlayerState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class SelectedMezmurPlayerState extends MezmurPlayerState{
  final MezmurModel mezmur;
   SelectedMezmurPlayerState({required this.mezmur});
  @override
  // TODO: implement props
  List<Object?> get props => [mezmur];
}