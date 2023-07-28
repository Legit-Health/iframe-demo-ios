//
//  ContentView.swift
//  Iframe Test
//
//  Created by Gerardo Fernández on 25/7/23.
//

import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    @Binding var path: NavigationPath
    
    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
        var webView: WKWebView?
        var onMessageReceived: (Any) -> Void;
        
        required init(onMessageReceived: @escaping (Any) -> Void) {
            self.onMessageReceived = onMessageReceived
            super.init()
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            self.webView = webView
        }
        
        // receive message from wkwebview
        func userContentController(
            _ userContentController: WKUserContentController,
            didReceive message: WKScriptMessage
        ) {
            print(message.body)
            self.onMessageReceived(message.body);
        }

    }
    
    func onMessageReceived(body: Any) -> Void {
        DispatchQueue.main.async {
            path.append(body as! String)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(onMessageReceived: onMessageReceived)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let coordinator = makeCoordinator()
        let userContentController = WKUserContentController()
        userContentController.add(coordinator, name: "bridge")
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        
        let _wkwebview = WKWebView(frame: .zero, configuration: configuration)
        _wkwebview.navigationDelegate = coordinator
        
        return _wkwebview
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let companyIdentifier = AppConfig.companyIdentifier;
        let request = URLRequest(url: URL(string: "https://iframe.legit.health/?company=&extraData=djdf848rjfdjdfud8f8fd8fd&primary=00c&isResultEnabled=0")!)

        webView.load(request)
        
    }
}

struct ImageSent: View {
    let messageId: String;

    
    var body: some View {
        VStack {
            Text(self.messageId)
                .font(.title)
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow.opacity(0.3))
        .navigationTitle("Image sent")
    }
}


struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                WebView(path: $path)
            }.navigationDestination(for: String.self) { item in
                ImageSent(messageId: item)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
