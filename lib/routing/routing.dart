import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mikrotik_switch/screens/home/home.dart';
import 'package:mikrotik_switch/src/bloc/ssh/sshbloc_bloc.dart';
import 'package:mikrotik_switch/src/repositories/ssh_repository.dart';

class AppRouting {
  final SSHBloc _sshBloc = SSHBloc(SSHRepository());

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SSHBloc>.value(
            value: _sshBloc,
            child: HomePage(),
          ),
        );
    }
    return null;
  }

  void dispose() {
    _sshBloc?.close();
  }
}
