// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:gmaster/reg/login.dart';
//
//
// import '../global.dart';
//
// class MySplashScreen extends StatefulWidget {
//   const MySplashScreen({Key? key}) : super(key: key);
//
//   @override
//   _MySplashScreenState createState() => _MySplashScreenState();
// }
//
// class _MySplashScreenState extends State<MySplashScreen> {
//   startTimer() {
//
//     Timer(const Duration(seconds: 3), () async {
//
//         Navigator.push(
//             context, MaterialPageRoute(builder: (c) => login()));
//
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     startTimer();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Container(
//         color: Colors.white,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset("images/logo.png"),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Text(
//                 "GO.",
//                 style: TextStyle(
//                     fontSize: 24,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
