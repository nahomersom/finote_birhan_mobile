import 'package:equatable/equatable.dart';
import 'package:finote_birhan_mobile/repository/models/playerModel.dart';

class MezmurPlayerState extends Equatable{
  final PlayerModel mezmur;
  const MezmurPlayerState({required this.mezmur});
  @override
  // TODO: implement props
  List<Object?> get props => [mezmur];
}
