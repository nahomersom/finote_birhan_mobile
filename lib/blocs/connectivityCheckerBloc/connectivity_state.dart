part of 'connectivity_bloc.dart';
enum ConnectionType{
  wifi,
  data
}
@immutable
abstract class InternetState{}
class LoadingState extends InternetState{

}
class ConnectedState extends InternetState{
  final ConnectionType connectionType;
  ConnectedState({required this.connectionType});
}
class DisconnectedState extends InternetState{}