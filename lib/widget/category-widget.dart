// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../controller/get-category-data-controller.dart';
// import '../model/categories-model.dart';
//
// class CategoryWidget extends StatefulWidget {
//   const CategoryWidget({super.key});
//
//   @override
//   State<CategoryWidget> createState() => _CategoryWidgetState();
// }
//
// class _CategoryWidgetState extends State<CategoryWidget> {
//   final CategoryDataController _categoryDataController =
//       Get.put(CategoryDataController());
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
//       future: _categoryDataController.getCategoryData(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // Return a loading indicator or placeholder widget
//           return SizedBox(
//               width: 20.w,
//               height: 20.h,
//               child: const Center(child: CircularProgressIndicator()));
//         } else if (snapshot.hasError) {
//           // Handle error
//           return Text('Error: ${snapshot.error}');
//         } else {
//           // Data has been loaded successfully
//           List<QueryDocumentSnapshot<Object?>> data = snapshot.data!;
//           int dataLength = data.length;
//
//           // Rest of your widget tree using the 'data'
//
//           return Container(
//             height: 150,
//             width: Get.width,
//             child: ListView.builder(
//               itemCount: dataLength,
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 final productData = data[index];
//                 CategoriesModel categoryModel = CategoriesModel(
//                     categoryId: productData['categoryId'],
//                     categoryImg: productData['categoryImg'],
//                     categoryName: productData['categoryName'],
//                     createdAt: productData['createdAt'],
//                     updatedAt: productData['updatedAt']);
//                 return Padding(
//                   padding: EdgeInsets.all(8.0.w),
//                   child: GestureDetector(
//                       onTap: () => null,
//                       child: SizedBox(
//                         height: 100.h,
//                         child: Column(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: Colors.black,
//                               radius: 35.r,
//                               child: CachedNetworkImage(
//                                 imageUrl: categoryModel.categoryImg,
//                                 fit: BoxFit.fill,
//                                 width: 45.w,
//                                 placeholder: (context, url) => const ColoredBox(
//                                   color: Colors.white,
//                                   child: Center(
//                                       child: CupertinoActivityIndicator()),
//                                 ),
//                                 errorWidget: (context, url, error) =>
//                                     const Icon(Icons.error),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 8.h,
//                             ),
//                             Flexible(
//                               child: Text(
//                                 categoryModel.categoryName,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: const Color(0xFF494949),
//                                   fontSize: 14.sp,
//                                   fontFamily: 'Roboto-Regular',
//                                   height: 0.h,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       )),
//                 );
//               },
//             ),
//           );
//         }
//       },
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/get-category-data-controller.dart';
import '../model/categories-model.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {

  final CategoryDataController _categoryDataController = Get.put(CategoryDataController());


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
      future: _categoryDataController.getCategoryData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
              width: 20,
              height: 20,
              child: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<QueryDocumentSnapshot<Object?>> data = snapshot.data!;
          int dataLength = data.length;
          return SizedBox(
            height: 120,
            width: size.width,
            child: ListView.builder(
              itemCount: dataLength,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final productData = data[index];
                CategoriesModel categoryModel = CategoriesModel(
                    categoryId: productData['categoryId'],
                    categoryImg: productData['categoryImg'],
                    categoryName: productData['categoryName'],
                    createdAt: productData['createdAt'],
                    updatedAt: productData['updatedAt']);
                return Padding(
                    padding: const EdgeInsets.all(.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl: categoryModel.categoryImg,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => const ColoredBox(
                                        color: Colors.white,
                                        child: Center(
                                          child: CupertinoActivityIndicator(),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) => const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Text(
                                    categoryModel.categoryName,
                                    textAlign: TextAlign.center,
                                    style:
                                    const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,)
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                );
              },
            ),
          );
        }
      },
    );
  }
}
