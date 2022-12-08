import 'package:equatable/equatable.dart';
import 'package:finote_birhan_mobile/repository/models/playerModel.dart';

abstract class MezmurPlayerEvent extends Equatable{
  @override
  List<Object> get props=>[];
}
class SelectedMezmur extends MezmurPlayerEvent{
  final PlayerModel mezmur;
  SelectedMezmur({required this.mezmur});
}