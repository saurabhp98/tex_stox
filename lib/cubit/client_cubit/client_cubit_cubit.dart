import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tex_stox/data/models/ClientModel.dart';
import 'package:tex_stox/data/repository/client_repository.dart';

part 'client_cubit_state.dart';

class ClientCubitCubit extends Cubit<ClientCubitState> {
  ClientRepository clientRepository;
  ClientCubitCubit({required this.clientRepository})
      : super(ClientCubitInitial());

  // fetching client method from the repository and emiting the state.
  void fetchClientsFromClientRepository() async {
    await clientRepository.fetchClientFromClientService().then((client) {
      emit(ClientsLoaded(clientModel: client));
    });
  }

  // adding client to the state recd from the add client cubit.
  addClient(ClientModel client) {
    // print(client.email);
    final currentState = state;
    print(currentState);
    if (currentState is ClientsLoaded) {
      final clientList = currentState.clientModel;
      clientList?.insert(0, client);

      emit(ClientsLoaded(clientModel: clientList));
    }
  }

  void editclient(ClientModel client, id) {
    final currentState = state;
    if (currentState is ClientsLoaded) {
      final clientList = currentState.clientModel;
      // getting index of the client with id by iterating list
      final indexOfClient =
          clientList?.indexWhere((element) => element.id == id);
      client.id = id;
      // clientList?.insert(indexOfClient!, client);
      clientList![indexOfClient!] = client;

      emit(ClientsLoaded(clientModel: clientList));

      // getting data with the id of iterated element with passeded element
      // print(clientList?.firstWhere((element) => element.id == id));
    }
  }

  void deleteClient(id) {
    final currentState = state;

    if (currentState is ClientsLoaded) {
      final clientList = currentState.clientModel;

      final indexOfClient =
          clientList?.indexWhere((element) => element.id == id);
      clientList?.removeAt(indexOfClient!);

      emit(ClientsLoaded(clientModel: clientList));
    }
  }
}
