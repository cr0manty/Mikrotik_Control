import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mikrotik_switch/src/repositories/ssh_repository.dart';

part 'sshbloc_event.dart';

part 'sshbloc_state.dart';

class SSHBloc extends Bloc<SSHBlocEvent, SSHBlocState> {
  final SSHRepository _repository;

  SSHBloc(this._repository) : super(SSHBlocInitial());

  @override
  Stream<SSHBlocState> mapEventToState(SSHBlocEvent event) async* {
    if (event is SSHBlocConnectEvent) {
      yield* _connectToSSh();
    } else if (event is SSHBlocGetClientsEvent) {
      yield* _getClients();
    }
  }

  Stream<SSHBlocState> _connectToSSh() async* {
    _repository.connect();
  }

  Stream<SSHBlocState> _getClients() async* {
    _repository.getClients();
  }

  @override
  Future<void> close() {
    _repository?.dispose();
    return super.close();
  }
}
