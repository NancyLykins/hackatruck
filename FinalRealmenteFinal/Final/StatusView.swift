//
//  ContentView.swift
//  Projeto Netools
//
//  Created by Turma01-8 on 21/05/24.
//

import SwiftUI
import WebKit


struct StatusView: View {
    @State var activeted: Bool = false
    var body: some View {
        ZStack{
            (LinearGradient(gradient: Gradient(colors: [Color.darkerblue,
            Color.blue2,Color.royal ]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
                HStack{
                    VStack(spacing: 10){
                        Spacer()
                        HStack{
                            Spacer()
                            Text("IP")
                            Spacer()
                            Text("192.168.128.12")
                            Spacer()
                        }.frame(width: 300, height: 75)
                            .background(Color.white)
                            .fontWeight(.bold)
                        HStack{
                            Spacer()
                            Text("Gateway")
                            Spacer()
                            Text("192.168.128.1")
                            Spacer()
                        }.frame(width: 300, height: 75)
                            .background(Color.white)
                            .fontWeight(.bold)
                        HStack{
                            Spacer()
                            Text("DNS")
                            Spacer()
                            Text("255.255.255.0")
                            Spacer()
                        }.frame(width: 300, height: 75)
                            .background(Color.white)
                            .fontWeight(.bold)
                        HStack{
                            Spacer()
                            Text("MAC")
                            Spacer()
                            Text("2e:0e:50:fd:ad:8e")
                            Spacer()
                        }.frame(width: 300, height: 75)
                            .background(Color.white)
                            .fontWeight(.bold)
                        HStack{
                            Spacer()
                            Text("IPv6")
                            Spacer()
                            Text("N/A")
                            Spacer()
                        }.frame(width: 300, height: 75)
                            .background(Color.white)
                            .fontWeight(.bold)
                        Spacer()
                        Button("Acessar"){
                            activeted = !activeted
                        }
                        .sheet(isPresented: $activeted){
                            StatusGateway()
                        }
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                        .frame(width: 150, height: 40)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(30)
                    }
                }
        }
        
    }
}

struct StatusGateway: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: "http://192.168.128.1") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
       
    }
}


#Preview {
    StatusView()
}
