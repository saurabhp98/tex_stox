import 'package:tex_stox/data/models/PurchaseModel.dart';
import 'package:tex_stox/data/services/purchase_services.dart';

class PurchaseRepository {
  late PurchaseServices purchaseServices;
  PurchaseRepository() {
    purchaseServices = PurchaseServices();
  }

  Future<int> addPurchase(PurchaseModel purchaseModel) async {
    final responseStatus = await purchaseServices.addPurchase(purchaseModel);
    return responseStatus;
  }
}
