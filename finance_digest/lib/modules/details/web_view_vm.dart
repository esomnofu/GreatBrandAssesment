// import 'package:finance_digest/base/base_vm.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter/material.dart';

// class WebViewViewModel extends BaseViewModel {
//   BuildContext context;
//   final String url;
//   WebViewViewModel({required this.context, required this.url});

//   WebViewController controller = WebViewController();

//   @override
//   init() async {
//     launchWithWebView(url);
//   }

//   ////////////////////////////////////
//   ///    LAUNCH WEB VIEW
//   ///////////////////////////////////
//   Future<void> launchWithWebView(String url) async {
//     print("url: $url");
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//             changeLoaderStatus(true);
//             if (progress < 100) {
//               changeLoaderStatus(true);
//             } else {
//               changeLoaderStatus(false);
//             }
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             return NavigationDecision.navigate; // Allow navigation
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(url));
//   }
// }
