import 'package:equatable/equatable.dart';
import '../../repository/models/recomended.dart';

abstract class RecommendationState extends Equatable{}
class LoadingState extends RecommendationState{
  final List<RecommendedModel>? recommended;
  LoadingState([this.recommended]);
  @override
  // TODO: implement props
  //data loaded and stored into props
  List<Object?> get props => [recommended];
}
class LoadedState extends RecommendationState{
  final List<RecommendedModel> recommended;
  LoadedState(this.recommended);
  @override
  // TODO: implement props
  //data loaded and stored into props
  List<Object?> get props => [recommended];
}
class ErrorState extends RecommendationState {
  final String errors;

  ErrorState(this.errors);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}