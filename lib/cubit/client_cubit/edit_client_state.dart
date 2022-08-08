part of 'edit_client_cubit.dart';

@immutable
abstract class EditClientState {}

class EditClientInitial extends EditClientState {}

class ClientEdited extends EditClientState {}

class ClientDeleted extends EditClientState {}
