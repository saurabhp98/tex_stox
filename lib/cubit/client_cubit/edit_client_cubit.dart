import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tex_stox/cubit/client_cubit/client_cubit_cubit.dart';
import 'package:tex_stox/data/repository/client_repository.dart';

import '../../data/models/ClientModel.dart';

part 'edit_client_state.dart';

class EditClientCubit extends Cubit<EditClientState> {
  ClientCubitCubit clientCubit;
  ClientRepository clientRepository;

  EditClientCubit({required this.clientCubit, required this.clientRepository})
      : super(EditClientInitial());

  ClientModel editClientFromEditScreen(ClientModel client, id) {
    clientRepository.editClientFromClientCubit(client, id);
    print(client);
    print(id);
    clientCubit.editclient(client, id);
    emit(ClientEdited());
    return client;
  }

  void deleteClient(id) {
    clientRepository.deleteClientFromEditCubit(id);
    clientCubit.deleteClient(id);
    emit(ClientDeleted());
    print("deleting $id");
  }
}
