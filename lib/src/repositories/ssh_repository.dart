import 'dart:convert';

import 'package:mikrotik_switch/models/client.dart';
import 'package:ssh/ssh.dart';

class SSHRepository {
  SSHClient _client;

  Future<bool> connect() async {
    _client = SSHClient(
      host: "192.168.88.1",
      port: 22,
      username: "admin",
      passwordOrKey: "",
    );

    var result = await _client.connect();
    return result == 'session_connected';
  }

  Future<List<Client>> getClients() async {
    // String command = await _client.execute('{lease:foreach i in=[find] do={\n:put "\$[get value-name=address \$i] \$[get value-name=host-name \$i] \$[get value-name=mac-address \$i]";\n}\n}'
    // );

    String command =
        '{\n:foreach i in=[find] do={\n:put "\$[get value-name=address \$i]  \$[get value-name=host-name \$i]";\n}\n}';

    String result = await _client.execute(command);

    print(command);
    print(result);
  }

/*
  Denis, [27.12.20 21:42]
{

:foreach i in=[find] do={
:put "$[get value-name=address $i]  $[get value-name=host-name $i]  connections:$con";
}
}

Denis, [27.12.20 21:49]
{
/ip dhcp-server lease
:foreach i in=[find] do={
:put "$[get value-name=address $i]  $[get value-name=host-name $i]  $[get value-name=mac-address $i]";
}
}
   */

  void dispose() {
    _client?.disconnect();
  }
}
