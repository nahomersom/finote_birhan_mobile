import 'package:equatable/equatable.dart';

abstract class RecommendationEvent extends Equatable{
  @override
  List<Object> get props=>[];
}
class GetRecommended extends RecommendationEvent{
  GetRecommended();
}
class RefreshRecommend extends RecommendationEvent{}