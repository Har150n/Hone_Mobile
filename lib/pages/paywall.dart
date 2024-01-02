import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:hone_mobile/constant.dart';
import 'package:hone_mobile/model/singletons_data.dart';
import 'package:hone_mobile/widgets/text.dart';
import 'package:hone_mobile/pages/tos.dart';

class Paywall extends StatefulWidget {
  final Offering offering;

  const Paywall({Key? key, required this.offering}) : super(key: key);

  @override
  _PaywallState createState() => _PaywallState();
}

class _PaywallState extends State<Paywall> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SafeArea(
        child: Wrap(
          children: <Widget>[
            Container(
              height: 70.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0))),
              child: Center(
                  child: Text('Unlock all Emoquest Stories!',
                      style: TextStyles.subtitleText(context))),
            ),
            Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(25.0))),
              child: Center(
                  child: Text('A new story every month!',
                      style: TextStyles.biggerText(context))),
            ),
            ListView.builder(
              itemCount: widget.offering.availablePackages.length,
              itemBuilder: (BuildContext context, int index) {
                var myProductList = widget.offering.availablePackages;
                return Card(
                  color: Colors.white,
                  child: ListTile(
                      onTap: () async {
                        try {
                          CustomerInfo customerInfo =
                              await Purchases.purchasePackage(
                                  myProductList[index]);
                          EntitlementInfo? entitlement =
                              customerInfo.entitlements.all[entitlementID];
                          appData.entitlementIsActive =
                              entitlement?.isActive ?? false;
                        } catch (e) {
                          print(e);
                        }

                        setState(() {});
                        Navigator.pop(context);
                      },
                      title: Text(
                        myProductList[index].storeProduct.title,
                        style: TextStyles.headingText(context),
                      ),
                      subtitle: Text(
                        myProductList[index].storeProduct.description,
                        style: TextStyles.text(context),
                      ),
                      trailing: Text(
                          myProductList[index].storeProduct.priceString,
                          style: TextStyles.subtitleText(context))),
                );
              },
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 32, bottom: 16, left: 16.0, right: 16.0),
                child: SizedBox(
                  child: Text(
                    footer,
                    style: TextStyles.text(context),
                  ),
                  width: double.infinity,
                ),
              ),
            ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tos');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  // Sets the button color to orange
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  minimumSize: Size(screenWidth / 6, screenWidth / 24)),
              child: Text('Terms of Service',
                  style: TextStyles.subtitleText(context)),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/privacy');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  // Sets the button color to orange
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  minimumSize: Size(screenWidth / 6, screenWidth / 24)),
              child: Text('Privacy Policy',
                  style: TextStyles.subtitleText(context)),
            ),
          ],
        )
          ],
        ),
      ),
    );
  }
}
