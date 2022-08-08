part of 'client_cubit_cubit.dart';

@immutable
abstract class ClientCubitState {}

class ClientCubitInitial extends ClientCubitState {}

class ClientsLoaded extends ClientCubitState {
  late List<ClientModel>? clientModel;
  ClientsLoaded({required this.clientModel});
}
