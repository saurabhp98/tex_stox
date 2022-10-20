import 'package:tex_stox/data/services/tranpsort_services.dart';

import '../models/TransportModel.dart';

class TransportRepository {
  late TransportServices transportServices;
  TransportRepository() {
    transportServices = TransportServices();
  }
  Future<List<TransportModel>> getTransportDetails() async {
    // print(await transportServices.getTransportDetails());
    List transportDetail = await transportServices.getTransportDetails();
    // print(transportDetail);

    return transportDetail.map((e) => TransportModel.fromJson(e)).toList();
  }
}
