import 'package:purchases_flutter/purchases_flutter.dart';

Future<CustomerInfo> getCustomerInfo() async {
  CustomerInfo customerInfo = await Purchases.getCustomerInfo();
  return customerInfo;
}

// restores the user's premium features if any
void restorePurchases() async {
  await Purchases.restorePurchases();
}