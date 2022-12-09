import 'package:equatable/equatable.dart';

abstract class RecommendationEvent extends Equatable{
  @override
  List<Object> get props=>[];
}
class GetRecommended extends RecommendationEvent{}

class RefreshRecommend extends RecommendationEvent{}

class SelectedRecommended extends RecommendationEvent{
  final int selectedId;
  SelectedRecommended({required this.selectedId});

  @override
  List<Object> get props => [selectedId];
}