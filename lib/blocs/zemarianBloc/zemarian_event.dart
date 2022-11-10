import 'package:equatable/equatable.dart';

abstract class ZemarianEvent extends Equatable{
  @override
  List<Object> get props=>[];
}
class GetZemarian extends ZemarianEvent{
  GetZemarian();
}
class RefreshZemarian extends ZemarianEvent{}