// import 'package:flutter/material.dart';
// import 'package:kikitalk/app/style/readingmode.dart';
//
// class ReadingScreen extends StatelessWidget {
//   const ReadingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Họa Tiết Giấy Hiệu Năng Cao'),
//       ),
//       // Bọc nội dung của bạn bằng widget hiệu năng cao này
//       body: EfficientPaperBackground(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             'Nội dung hiển thị trên nền giấy được tạo một lần và cache lại...' * 200,
//             style: const TextStyle(fontSize: 18, height: 1.6, color: Colors.black87),
//           ),
//         ),
//       ),
//     );
//   }
// }