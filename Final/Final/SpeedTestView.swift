import SwiftUI
import WebKit


struct SpeedTestView: View {
    var body: some View {
        ZStack{
            Color(.gray)
            SpeedTest()
        }
    }
}


struct SpeedTest: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: "https://fast.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
       
    }
}
