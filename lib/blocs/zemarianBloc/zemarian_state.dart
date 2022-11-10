import 'package:equatable/equatable.dart';
import 'package:finote_birhan_mobile/repository/models/zemarian.dart';
import '../../repository/models/recomended.dart';

abstract class ZemarianState extends Equatable{}
class LoadingZemarianState extends ZemarianState{
  final List<ZemarianModel>? zemarian;
  LoadingZemarianState([this.zemarian]);
  @override
  // TODO: implement props
  //data loaded and stored into props
  List<Object?> get props => [zemarian];
}
class LoadedZemarianState extends ZemarianState{
  final List<ZemarianModel> zemarian;
  LoadedZemarianState(this.zemarian);
  @override
  // TODO: implement props
  //data loaded and stored into props
  List<Object?> get props => [zemarian];
}
class ErrorZemarianState extends ZemarianState {
  final String errors;

  ErrorZemarianState(this.errors);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}