import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tex_stox/data/repository/transport_repository.dart';

import '../../data/models/TransportModel.dart';

part 'transport_state.dart';

class TransportCubit extends Cubit<TransportState> {
  TransportRepository transportRepository;
  TransportCubit({required this.transportRepository})
      : super(TransportInitial());

  void getTransportDetail() async {
    Stream<List<TransportModel>> transportStream = (() async* {
      yield await transportRepository.getTransportDetails();
    })();

    emit(TransportLoaded(transportStream: transportStream));
  }
}
