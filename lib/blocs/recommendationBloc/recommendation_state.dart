part of 'recommendation_bloc.dart';

enum recommendationStatus {initial,loading,success,error,selected}

extension RecommendationStatusx on recommendationStatus{
  bool get isInitial => this == recommendationStatus.initial;
  bool get isLoading => this == recommendationStatus.loading;
  bool get  isSuccess => this == recommendationStatus.success;
  bool get isSelected => this == recommendationStatus.selected;
  bool get hasError => this == recommendationStatus.error;

}
 class RecommendationState extends Equatable{

  const RecommendationState({
    this.status = recommendationStatus.initial,
    List<MezmurModel>? recommended,
    this.selectedRecommended = 0}):recommended = recommended ?? const [];


  final List<MezmurModel> recommended;
  final int selectedRecommended;
  final recommendationStatus status;

  @override
  List<Object?> get props => [recommended,selectedRecommended,status];

  RecommendationState copyWith({List<MezmurModel>? recommended,recommendationStatus? status, int? selectedRecommended}){
    return  RecommendationState(recommended: recommended ?? this.recommended,status: status ?? this.status,selectedRecommended:selectedRecommended ?? this.selectedRecommended);
  }

}
// class LoadingState extends RecommendationState{
//   final List<MezmurModel>? recommended;
//   LoadingState([this.recommended]);
//   @override
//   // TODO: implement props
//   //data loaded and stored into props
//   List<Object?> get props => [recommended];
// }
// class LoadedState extends RecommendationState{
//   final List<MezmurModel> recommended;
//   LoadedState(this.recommended);
//   @override
//   // TODO: implement props
//   //data loaded and stored into props
//   List<Object?> get props => [recommended];
// }
// class ErrorState extends RecommendationState {
//   final String errors;
//
//   ErrorState(this.errors);
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }
