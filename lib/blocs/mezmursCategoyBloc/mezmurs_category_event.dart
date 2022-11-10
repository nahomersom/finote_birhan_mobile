import 'package:equatable/equatable.dart';

abstract class MezmursCategoryEvent extends Equatable{
  @override
  List<Object> get props=>[];
}
class GetMezmursCategory extends MezmursCategoryEvent{
  GetMezmursCategory();
}
class RefreshMezmursCategory extends MezmursCategoryEvent{}
