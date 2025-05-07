// import 'package:finance_digest/base/base_screen.dart';
// import 'package:finance_digest/modules/details/web_view_vm.dart';
// import 'package:finance_digest/modules/models/news.dart';
// import 'package:finance_digest/modules/models/web_view.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter/material.dart';

// class WebViewScreen extends StatelessWidget {
//   final News news;
//   const WebViewScreen({super.key, required this.news});

//   @override
//   Widget build(BuildContext context) {
//     return BaseView<WebViewViewModel>(
//       vmBuilder: (context) =>
//           WebViewViewModel(context: context, url: news.url ?? ""),
//       builder: _buildScreen,
//     );
//   }

//   Widget _buildScreen(BuildContext context, WebViewViewModel vm) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//           child: Icon(
//             Icons.close,
//             color: Colors.white,
//             size: 20,
//           ),
//         ),
//         actions: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextButton(
//                 child: const Text(
//                   "Done",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               )
//             ],
//           )
//         ],
//         title: Text(
//           news.source ?? "News",
//         ),
//         backgroundColor: Colors.blue,
//         titleTextStyle: TextStyle(
//             fontSize: 16, color: Colors.white, fontWeight: FontWeight.normal),
//       ),
//       body: WebViewWidget(controller: vm.controller),
//     );
//   }
// }
