import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tex_stox/cubit/client_cubit/client_cubit_cubit.dart';

import '../../data/models/ClientModel.dart';
import '../../data/repository/client_repository.dart';

part 'add_client_state.dart';

class AddClientCubit extends Cubit<AddClientState> {
  ClientRepository clientRepository;

  ClientCubitCubit clientCubit;
  AddClientCubit({required this.clientRepository, required this.clientCubit})
      : super(AddClientInitial());

// adding the client to the repository and then passsing it to the client cubit
// for showing it on the client screen
  void addClientFromClient(client) {
    // passed client recd from the addclient screen
    // to the repository and then sending it to the clientCubit and
    // by emitting the ClientAddedState.
    // one can use ClientAdded() state to check and add functionality to the
    // add client page like circular progress indicator.
    clientRepository.addClientFromClientSerivce(client).then((client) {
      if (client != null) {
        clientCubit.addClient(client);
        emit(ClientAdded());
      }
    });
  }
}
