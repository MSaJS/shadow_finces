// import 'package:flutter/material.dart';

// class MyNavBar extends StatefulWidget {
//   const MyNavBar({super.key});

//   @override
//   State<MyNavBar> createState() => _MyNavBarState();
// }

// class _MyNavBarState extends State<MyNavBar> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
//         child: ClipPath(
//           clipper: ArcClipper(),
//           child: Container(
//             padding: const EdgeInsets.only(top: 6),
//             height: 60,
//             width: 200,
//             decoration: BoxDecoration(
//               color: Colors.deepPurple.withOpacity(0.8),
//             ),
//             child: Expanded(
//                 child: Row(
//               children: [
//                 Expanded(child: row),
//               ],
//             )),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ArcClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();

//     path.lineTo(size.width * 0.34, 0);
//     path.cubicTo(
//         size.width * 0.34, 0, size.width * 0.12, 0, size.width * 0.12, 0);
//     path.cubicTo(
//         size.width * 0.05, 0, 0, size.height * 0.22, 0, size.height / 2);
//     path.cubicTo(0, size.height * 0.78, size.width * 0.05, size.height,
//         size.width * 0.12, size.height);
//     path.cubicTo(size.width * 0.12, size.height, size.width * 0.89, size.height,
//         size.width * 0.89, size.height);
//     path.cubicTo(size.width * 0.95, size.height, size.width, size.height * 0.78,
//         size.width, size.height / 2);
//     path.cubicTo(size.width, size.height * 0.22, size.width * 0.95, 0,
//         size.width * 0.89, 0);
//     path.cubicTo(
//         size.width * 0.89, 0, size.width * 0.67, 0, size.width * 0.67, 0);
//     path.cubicTo(size.width * 0.64, 0, size.width * 0.62, size.height * 0.1,
//         size.width * 0.61, size.height * 0.22);
//     path.cubicTo(size.width * 0.6, size.height * 0.45, size.width * 0.56,
//         size.height * 0.68, size.width / 2, size.height * 0.68);
//     path.cubicTo(size.width * 0.44, size.height * 0.68, size.width * 0.41,
//         size.height * 0.45, size.width * 0.39, size.height * 0.22);
//     path.cubicTo(size.width * 0.39, size.height * 0.1, size.width * 0.36, 0,
//         size.width * 0.34, 0);
//     path.cubicTo(
//         size.width * 0.34, 0, size.width * 0.34, 0, size.width * 0.34, 0);

//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper old) => false;
// }
