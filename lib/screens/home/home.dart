import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mikrotik_switch/src/bloc/ssh/sshbloc_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SSHBloc _sshBloc;

  @override
  void initState() {
    super.initState();
    _sshBloc = BlocProvider.of<SSHBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FlatButton(
              onPressed: () {
                _sshBloc.add(SSHBlocConnectEvent());
              },
              child: Text('Connect'),
            ),
            const SizedBox(height: 20),
            FlatButton(
              onPressed: () {
                _sshBloc.add(SSHBlocGetClientsEvent());
              },
              child: Text('GetClients'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _sshBloc.close();
  }
}
