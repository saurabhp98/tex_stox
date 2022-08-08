import 'dart:convert';

import 'package:tex_stox/data/models/ClientModel.dart';
import 'package:tex_stox/data/services/client_services.dart';
import '../../cubit/client_cubit/client_cubit_cubit.dart';

class ClientRepository {
  late ClientService clientService;

  ClientRepository() {
    clientService = ClientService();
  }

  // fetching the client using clientService and casting it to the list of
  // respected Model and iterating it to the respected model by using fromJson
  // method and casting it to the list and returnig it as list.
  Future<List<ClientModel>?> fetchClientFromClientService() async {
    List clientList = await clientService.fetchClient();
    List reversedClientList = new List.from(clientList.reversed);

    return reversedClientList.map((e) => ClientModel.fromJson(e)).toList();
  }

  //  adding client recd fromthe add client cubit and passing it to the clientservice
  // and returning it as the ClientModel so that it can be used by the addClientCubit
  // after the completion of adding to the database
  // and adding it to the clientScreen via clientCubit
  // so that there is not a need to use Streams inside the cubit itself

  Future<ClientModel> addClientFromClientSerivce(client) async {
    clientService.addClient(client);
    return client;
  }

  ClientModel editClientFromClientCubit(client, id) {
    clientService.editClient(client, id);
    return client;
  }

  void deleteClientFromEditCubit(id) {
    clientService.deleteClientFromClientCubit(id);
  }
}
