import 'package:flutter/material.dart';

class ShimmerLoaderUtils {
  static Widget lableShimmer() {
    return Container(
      height: 14,
      width: 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.amber,
      ),
    );
  }

  // static Widget contentShimmer() {
  //   return Container(
  //     height: Sizes.s14,
  //     width: Sizes.widthScreen,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(50),
  //       color: AppColor.white,
  //     ),
  //   );
  // }

  // static Widget buildInfoKandang(BuildContext context) {
  //   return Container(
  //     width: Get.width,
  //     padding: EdgeInsets.fromLTRB(Sizes.s24, Sizes.s24, Sizes.s24, Sizes.s35),
  //     decoration: BoxDecoration(
  //       color: AppColor.white,
  //       borderRadius: BorderRadius.circular(12),
  //       boxShadow: [bayangan()],
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         loadingDetailDataFarm(context),
  //       ],
  //     ),
  //   );
  // }

  // static Widget buildReport(BuildContext context) {
  //   return Column(
  //     children: [
  //       Container(
  //         width: Get.width,
  //         padding:
  //             EdgeInsets.fromLTRB(Sizes.s24, Sizes.s12, Sizes.s24, Sizes.s35),
  //         decoration: BoxDecoration(
  //           color: AppColor.white,
  //           borderRadius: const BorderRadius.only(
  //             topLeft: Radius.circular(12),
  //             topRight: Radius.circular(12),
  //           ),
  //           boxShadow: [bayangan()],
  //         ),
  //         child: Shimmer.fromColors(
  //           baseColor: Colors.grey[300]!,
  //           highlightColor: Colors.grey[100]!,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   lableShimmer(),
  //                   Container(
  //                     padding: EdgeInsets.all(Sizes.s12),
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       border: Border.all(color: AppColor.line),
  //                     ),
  //                     child: lableShimmer(),
  //                   )
  //                 ],
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(top: Sizes.s8, bottom: Sizes.s8),
  //                 child: const Divider(
  //                   thickness: 2,
  //                   color: AppColor.line,
  //                 ),
  //               ),
  //               Row(
  //                 children: [
  //                   Expanded(
  //                     child: lableShimmer(),
  //                   ),
  //                   SizedBox(
  //                     width: Sizes.s110,
  //                   ),
  //                   Expanded(
  //                     child: lableShimmer(),
  //                   ),
  //                   // do not delete. this icon is used for keeping
  //                   // the size even
  //                   Icon(
  //                     Icons.arrow_forward_ios,
  //                     size: Sizes.s18,
  //                     color: Colors.transparent,
  //                   ),
  //                 ],
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(top: Sizes.s8, bottom: Sizes.s14),
  //                 child: const Divider(
  //                   thickness: 2,
  //                   color: AppColor.line,
  //                 ),
  //               ),
  //               ListView.separated(
  //                 itemCount: 5,
  //                 shrinkWrap: true,
  //                 physics: const NeverScrollableScrollPhysics(),
  //                 separatorBuilder: (context, index) => SizedBox(
  //                   height: Sizes.s18,
  //                 ),
  //                 itemBuilder: (context, index) {
  //                   return Row(
  //                     children: [
  //                       Expanded(
  //                         child: lableShimmer(),
  //                       ),
  //                       SizedBox(
  //                         width: Sizes.s16,
  //                       ),
  //                       Expanded(
  //                         child: lableShimmer(),
  //                       ),
  //                       Icon(
  //                         Icons.arrow_forward_ios,
  //                         size: Sizes.s18,
  //                       ),
  //                     ],
  //                   );
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       Container(
  //         width: Get.width,
  //         padding:
  //             EdgeInsets.symmetric(horizontal: Sizes.s24, vertical: Sizes.s12),
  //         decoration: BoxDecoration(
  //           color: AppColor.defaultGreyBackground,
  //           borderRadius: const BorderRadius.only(
  //             bottomLeft: Radius.circular(12),
  //             bottomRight: Radius.circular(12),
  //           ),
  //           boxShadow: [bayangan()],
  //         ),
  //         child: Shimmer.fromColors(
  //           baseColor: Colors.grey[300]!,
  //           highlightColor: Colors.grey[100]!,
  //           child: Row(
  //             children: [
  //               lableShimmer(),
  //               Spacer(),
  //               SizedBox(
  //                 width: Sizes.s4,
  //               ),
  //               lableShimmer(),
  //             ],
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  // static Widget loadingDetailDataFarm(BuildContext context) {
  //   return Shimmer.fromColors(
  //       baseColor: Colors.grey[300]!,
  //       highlightColor: Colors.grey[100]!,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             height: Sizes.s20,
  //             width: Sizes.s160,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(50),
  //               color: AppColor.white,
  //             ),
  //           ),
  //           Padding(
  //             padding: EdgeInsets.only(top: Sizes.s8, bottom: Sizes.s14),
  //             child: const Divider(
  //               thickness: 0.5,
  //               color: AppColor.line,
  //             ),
  //           ),
  //           Container(
  //             height: Sizes.s14,
  //             width: Sizes.s130,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(50),
  //               color: AppColor.white,
  //             ),
  //           ),
  //           SizedBox(
  //             height: Sizes.s8,
  //           ),
  //           contentShimmer(),
  //           SizedBox(
  //             height: Sizes.s18,
  //           ),
  //           Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Expanded(
  //                   child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   lableShimmer(),
  //                   SizedBox(
  //                     height: Sizes.s8,
  //                   ),
  //                   contentShimmer(),
  //                 ],
  //               )),
  //               SizedBox(
  //                 width: Sizes.s18,
  //               ),
  //               Expanded(
  //                   child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   lableShimmer(),
  //                   SizedBox(
  //                     height: Sizes.s8,
  //                   ),
  //                   contentShimmer(),
  //                 ],
  //               )),
  //             ],
  //           ),
  //           SizedBox(
  //             height: Sizes.s18,
  //           ),
  //           lableShimmer(),
  //           SizedBox(
  //             height: Sizes.s8,
  //           ),
  //           contentShimmer(),
  //           SizedBox(
  //             height: Sizes.s18,
  //           ),
  //           lableShimmer(),
  //           SizedBox(
  //             height: Sizes.s8,
  //           ),
  //           contentShimmer(),
  //         ],
  //       ));
  // }
}
