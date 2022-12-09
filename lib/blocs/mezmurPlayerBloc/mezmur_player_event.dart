import 'package:equatable/equatable.dart';
import 'package:finote_birhan_mobile/repository/models/playerModel.dart';

import '../../repository/models/recomended.dart';

abstract class MezmurPlayerEvent extends Equatable{
  @override
  List<Object> get props=>[];
}
class SelectedMezmur extends MezmurPlayerEvent{
  final MezmurModel mezmur;
  SelectedMezmur({required this.mezmur});
}