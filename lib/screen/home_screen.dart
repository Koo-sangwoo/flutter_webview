import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUrl = Uri.parse('https://blog.codefactory.ai');

class HomeScreen extends StatelessWidget {

  //WebViewController? controller; 3.0코드
  WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted) // js 설정을 여기서함
  ..loadRequest(homeUrl);




  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code Factory'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            controller.loadRequest(homeUrl);
            // 3.0
            /*if(controller == null) {
              return;
            }
            controller!.loadUrl(homeUrl);*/

          },
              icon: Icon(Icons.home))
        ],
      ),
      body: WebViewWidget(
        controller: controller, // 3.0은 controller를 주입해줘야 했지만 4.x는 직접적으로 주입가능
      )
        
        // 3.0 코드
      /*WebView(

        onWebViewCreated: (WebViewController controller){ // 웹이 생성될때 1회만 작동
          this.controller = controller;
        },
        initialUrl: homeUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),*/
    );
  }
}


