import 'package:equatable/equatable.dart';
import 'package:finote_birhan_mobile/repository/models/category.dart';

abstract class MezmursCategoryState extends Equatable{}
class LoadingCategoryState extends MezmursCategoryState{
  final List<CategoryModel>? mezmursCategory;

  LoadingCategoryState([this.mezmursCategory]);
  @override
  // TODO: implement props
  List<Object?> get props => [mezmursCategory];
}
class LoadedMezmurCategoryState extends MezmursCategoryState{
  final List<CategoryModel> mezmursCategory;

  LoadedMezmurCategoryState(this.mezmursCategory);
  @override
  // TODO: implement props
  //data loaded and stored into props
  List<Object?> get props => [mezmursCategory];
}
class ErrorMezmurCategoryState extends MezmursCategoryState {
  final String errors;

  ErrorMezmurCategoryState(this.errors);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}