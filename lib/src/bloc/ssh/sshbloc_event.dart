part of 'sshbloc_bloc.dart';

abstract class SSHBlocEvent extends Equatable {
  const SSHBlocEvent();

  @override
  List<Object> get props => [];
}

class SSHBlocConnectEvent extends SSHBlocEvent {}
class SSHBlocGetClientsEvent extends SSHBlocEvent {}
