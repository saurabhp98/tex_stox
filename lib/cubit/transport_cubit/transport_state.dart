part of 'transport_cubit.dart';

@immutable
abstract class TransportState {}

class TransportInitial extends TransportState {}

class TransportLoaded extends TransportState {
  Stream<List<TransportModel>> transportStream;
  TransportLoaded({required this.transportStream});
}
