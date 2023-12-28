import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import '../../controller/cart-price-controller.dart';
import '../model/cart-model.dart';
import 'main_page.dart';

class Cart2 extends StatefulWidget {
  const Cart2({super.key});

  @override
  State<Cart2> createState() => _Cart2State();
}

class _Cart2State extends State<Cart2> {
  User? user = FirebaseAuth.instance.currentUser;
  final ProductPriceController _productPriceController =
  Get.put(ProductPriceController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,
          height: Get.height,
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('cart')
                      .doc(user!.uid)
                      .collection('cartOrders')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text(
                        "Error",
                        style: TextStyle(
                            fontSize: 20, fontFamily: 'Roboto-Regular'),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        height: Get.height / 5,
                        child: Center(
                          child: CupertinoActivityIndicator(),
                        ),
                      );
                    }

                    if (snapshot.data!.docs.isEmpty) {
                      return const Text(
                        "No products found!",
                        style: TextStyle(
                            fontSize: 20, fontFamily: 'Roboto-Regular'),
                      );
                    }

                    if (snapshot.data != null) {
                      return Container(
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final productData = snapshot.data!.docs[index];
                            CartModel cartModel = CartModel(
                              productId: productData['productId'],
                              categoryId: productData['categoryId'],
                              productName: productData['productName'],
                              categoryName: productData['categoryName'],
                              salePrice: productData['salePrice'],
                              fullPrice: productData['fullPrice'],
                              productImages: productData['productImages'],
                              deliveryTime: productData['deliveryTime'],
                              isSale: productData['isSale'],
                              productDescription:
                              productData['productDescription'],
                              createdAt: productData['createdAt'],
                              updatedAt: productData['updatedAt'],
                              productQuantity: productData['productQuantity'],
                              productTotalPrice: double.parse(
                                  productData['productTotalPrice'].toString()),
                            );

                            //calculate price
                            _productPriceController.fetchProductPrice();
                            return SwipeActionCell(
                              key: ObjectKey(cartModel.productId),
                              trailingActions: [
                                SwipeAction(
                                  title: "Delete",
                                  forceAlignmentToBoundary: true,
                                  performsFirstActionWithFullSwipe: true,
                                  onTap: (CompletionHandler handler) async {
                                    print('deleted');

                                    await FirebaseFirestore.instance
                                        .collection('cart')
                                        .doc(user!.uid)
                                        .collection('cartOrders')
                                        .doc(cartModel.productId)
                                        .delete();
                                  },
                                )
                              ],
                              child: SizedBox(
                                height: 200,
                                child: Card(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        height: 160,
                                        child: Image(
                                            image: NetworkImage(
                                                cartModel.productImages[0])),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(cartModel.productName,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(cartModel.salePrice,
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                              "Price : ${cartModel.productTotalPrice.toString()}"),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }

                    return Container();
                  },
                ),
              ]),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                    () => Text(
                  " Total ₹ : ${_productPriceController.totalPrice.value.toStringAsFixed(1)} rs",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  child: Container(
                    width: Get.width / 2.0,
                    height: Get.height / 18,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextButton(
                      child: const Text(
                        "Checkout",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        if (_productPriceController.totalPrice.value > 0) {
                          // Navigate to CheckoutPage only if the cart is not empty
                          Get.to(() => null);
                        } else {
                          // Show a message or perform any action when the cart is empty
                          Get.snackbar(
                            'Empty Cart',
                            'Your cart is empty. Add some items to proceed to checkout.',
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 3),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
