import 'package:equatable/equatable.dart';
import 'package:finote_birhan_mobile/repository/models/mezmursByCategory.dart';

abstract class MezmursByCategoryState extends Equatable{}
class MezmursByCategoryLoadingState extends MezmursByCategoryState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class MezmursByCategoryLoadedState extends MezmursByCategoryState{
  final List<MezmursByCategoryModel> mezmursByCategoryModel;
  MezmursByCategoryLoadedState(this.mezmursByCategoryModel);
  @override
  // TODO: implement props
  List<Object?> get props => [mezmursByCategoryModel];

}
class MezmursByCategoryErrorState extends MezmursByCategoryState{
  final String errors;
  MezmursByCategoryErrorState(this.errors);
  @override
  // TODO: implement props
  List<Object?> get props => [errors];

}