import 'package:equatable/equatable.dart';

abstract class WerebCategoryEvent extends Equatable{
  @override
  List<Object> get props=>[];
}
class GetWerebCategory extends WerebCategoryEvent{
  GetWerebCategory();
}
class RefreshWerebCategory extends WerebCategoryEvent{}
