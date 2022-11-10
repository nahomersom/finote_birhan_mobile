import 'package:equatable/equatable.dart';
import 'package:finote_birhan_mobile/repository/models/category.dart';

abstract class WerebCategoryState extends Equatable{}
class LoadingWerebCategoryState extends WerebCategoryState{
  final List<CategoryModel>? werebCategory;

  LoadingWerebCategoryState([this.werebCategory]);
  @override
  // TODO: implement props
  //data loaded and stored into props
  List<Object?> get props => [werebCategory];
}
class LoadedWerebCategoryState extends WerebCategoryState{
  final List<CategoryModel> werebCategory;

  LoadedWerebCategoryState(this.werebCategory);
  @override
  // TODO: implement props
  //data loaded and stored into props
  List<Object?> get props => [werebCategory];
}
class ErrorWerebCategoryState extends WerebCategoryState {
  final String errors;

  ErrorWerebCategoryState(this.errors);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}