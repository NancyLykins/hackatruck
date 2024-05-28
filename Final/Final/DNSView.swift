//
//  DNSView.swift
//  Final
//
//  Created by Turma01-10 on 24/05/24.
//

import SwiftUI

struct Dns: Identifiable{
    var id = UUID()
    var name: String
    var ip: String
    var ms: String
}

var DnsButtons = [
    Dns(name: "Google", ip: "8.8.8.8", ms: "..."),
    Dns(name: "Cloudflare", ip: "1.1.1.1", ms: "..."),
    Dns(name: "OpenDNS", ip: "08.67.222.222", ms: "..."),
]

struct DNSView: View {
    @State var host = "8.8.8.8"
    @State var hostname = "Default"
    @State var active = false
    @State private var pingResults: [String: String] = [:]
    @State private var errorMessage: String?
    var pingService = PingService()
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.darkerblue,
                                                       Color.blue2,Color.royal ]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            VStack{
                VStack{
                    HStack{
                        TextField("Enter host", text: $host)
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                            .frame(width: 200, height: 15)
                            .padding()
                            .background(.white)
                            .border(.black)
                        Button{
                            active = !active
                        }label: {
                            Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                        }.frame(width: 48, height: 48)
                        .background(.white)
                        .border(.black)
                    }
                }.offset(y: -80)
                ForEach(DnsButtons){ rede in
                    HStack{
                        Text(rede.name).padding()
                        Spacer()
                        VStack{
                            Text(rede.ip)
                        }
                        Text("\(getMs(ip: rede.ip))")
                        Spacer()
                        Text("").padding()
                    }.frame(width: 300, height: 75)
                        .border(.black)
                        .background(.white)
                        .fontWeight(.bold)

                }
            }.sheet(isPresented: $active){
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [Color.darkerblue,
                                                               Color.blue2,Color.royal ]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                    VStack{
                        TextField("Enter host name", text: $hostname)
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                            .frame(width: 220, height: 50)
                            .background(.white)
                            .border(.black)
                            .padding(2)
                        Text(host)
                            .frame(width: 220, height: 50)
                            .background(Color.white)
                            .font(.system(size: 25))
                            .padding()
                        Button("Salvar DNS"){
                            active = !active
                        }
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .frame(width: 200, height: 60)
                        .background(.white)
                        .cornerRadius(10)
                    }
                }
            }
        }
    }
    func getMs(ip: String) -> String{
        var ms: String = "..."
        pingService.ping(host: ip) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    if let firstResult = results.split(separator: "\n").first {
                        ms = String(firstResult)
                    } else {
                        ms = "No response"
                    }
                case .failure(let error):
                    ms = "Error"
                    errorMessage = "Error: \(error.localizedDescription)"
                }
            }
        }
        return ms
    }
    
//    private func pingAllDNS() {
//        errorMessage = nil
//        pingResults = [:]
//        
//        for (name, host) in dnsHosts {
//            pingService.ping(host: host) { result in
//                DispatchQueue.main.async {
//                    switch result {
//                    case .success(let results):
//                        if let firstResult = results.split(separator: "\n").first {
//                            pingResults[name] = "(\(host)) \(firstResult)"
//                        } else {
//                            pingResults[name] = "(\(host)) No response"
//                        }
//                    case .failure(let error):
//                        pingResults[name] = "(Error)"
//                        errorMessage = "Error: \(error.localizedDescription)"
//                    }
//                }
//            }
//        }
//    }
}


#Preview {
    DNSView()
}
