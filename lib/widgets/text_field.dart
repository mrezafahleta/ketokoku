// import 'package:flutter/material.dart';

// class TextInputData extends StatelessWidget {
//   const TextInputData(
//       {Key? key,
//       required this.typeKeyboard,
//       required this.controllerInput,
//       required this.textName})
//       : super(key: key);

//   final String? typeKeyboard;
//   final String? controllerInput;
//   final String? textName;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.grey,
//             blurRadius: 4,
//             offset: Offset(3, 5), // Shadow position
//           ),
//         ],
//       ),
//       width: double.infinity,
//       height: 70,
//       child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.mail),
//             const SizedBox(
//               width: 15,
//             ),
//             Expanded(
//                 child: TextField(
//               keyboardType: TextInputType.${typeKeyboard.toString()},
//               controller: ,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 label: Text(textName.toString()),
//               ),
//             ))
//           ]),
//     );
//   }
// }
