import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tex_stox/data/repository/purchase_repository.dart';

part 'purchase_state.dart';

class PurchaseCubit extends Cubit<PurchaseState> {
  PurchaseRepository purchaseRepository;
  PurchaseCubit({required this.purchaseRepository}) : super(PurchaseInitial());
  // add purchase
  Future<int> addPurchase(purchase) async {
    int responseCode = await purchaseRepository.addPurchase(purchase);
    return responseCode;
  }
}
