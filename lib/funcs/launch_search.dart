// import 'package:client/core/styles/typography.dart';
// import 'package:client/widgets/expandable_textfield.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:scrollable/exports.dart';

// import '../widgets/touchable_opacity.dart';
// // import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// void launchSearch(BuildContext context) {
//   showModalBottomSheet(
//       backgroundColor: Colors.transparent,
//       isScrollControlled: true,
//       context: context,
//       builder: (context) {
//         return KeyboardDismiss(
//           child: Scaffold(
//             body: Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.background,
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(10),
//                   topRight: Radius.circular(10),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.symmetric(vertical: 10),
//                       color: Theme.of(context).colorScheme.onSurface,
//                       width: MediaQuery.of(context).size.width / 5,
//                       height: 3,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         TouchableOpacity(
//                           onTap: () => Navigator.pop(context),
//                           child: Container(
//                             color: Colors.transparent, // transparent hitbox trick
//                             padding: const EdgeInsets.all(5),
//                             child: Text(
//                               "<- done",
//                               style: kTitle.copyWith(color: Theme.of(context).colorScheme.secondary),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     ExpandableTextfield(
//                       controller: TextEditingController(),
//                       onChanged: (text) => print(text),
//                       hintText: "Search classes...",
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       });
// }
