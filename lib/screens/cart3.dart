import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import '../../controller/cart-price-controller.dart';
import '../model/cart-model.dart';
import 'main_page.dart';

class Cart3 extends StatefulWidget {
  const Cart3({super.key});

  @override
  State<Cart3> createState() => _Cart3State();
}

class _Cart3State extends State<Cart3> {
  User? user = FirebaseAuth.instance.currentUser;
  final ProductPriceController _productPriceController =
      Get.put(ProductPriceController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          leading: IconButton(
              onPressed: () => Get.offAll(() => const MainPage(),
                  transition: Transition.leftToRightWithFade),
              icon: const Icon(CupertinoIcons.back, color: Colors.white)),
          centerTitle: true,
          title: Text("Cart page",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontFamily: 'Roboto-Regular',
              )),
        ),
        body: Column(
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
                    return Text(
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
                            child: Card(
                              elevation: 5,
                              color: Colors.white,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(
                                      cartModel.productImages[0]),
                                ),
                                title: Text(cartModel.productName),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                        "Price : ${cartModel.productTotalPrice.toString()}"),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            if (cartModel.productQuantity >
                                                1) {
                                              await FirebaseFirestore.instance
                                                  .collection('cart')
                                                  .doc(user!.uid)
                                                  .collection('cartOrders')
                                                  .doc(cartModel.productId)
                                                  .update({
                                                'productQuantity': cartModel
                                                        .productQuantity -
                                                    1,
                                                'productTotalPrice': (double
                                                        .parse(cartModel
                                                            .fullPrice) *
                                                    (cartModel
                                                            .productQuantity -
                                                        1))
                                              });
                                            }
                                          },
                                          child: const CircleAvatar(
                                            radius: 14.0,
                                            backgroundColor: Colors.black,
                                            child: Text('-'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width / 20.0,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            if (cartModel.productQuantity >
                                                0) {
                                              await FirebaseFirestore.instance
                                                  .collection('cart')
                                                  .doc(user!.uid)
                                                  .collection('cartOrders')
                                                  .doc(cartModel.productId)
                                                  .update({
                                                'productQuantity': cartModel
                                                        .productQuantity +
                                                    1,
                                                'productTotalPrice': double
                                                        .parse(cartModel
                                                            .fullPrice) +
                                                    double.parse(cartModel
                                                            .fullPrice) *
                                                        (cartModel
                                                            .productQuantity)
                                              });
                                            }
                                          },
                                          child: CircleAvatar(
                                            radius: 14.0,
                                            backgroundColor: Colors.red,
                                            child: Text('+'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                        "Quantity : ${cartModel.productQuantity}")
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
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  " Total ₹ : ${_productPriceController.totalPrice.value.toStringAsFixed(1)} rs",
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                            duration: Duration(seconds: 3),
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