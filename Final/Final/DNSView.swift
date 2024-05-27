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
    Dns(name: "Google", ip: "8.8.8.8", ms: "42.5"),
    Dns(name: "Google", ip: "8.8.8.8", ms: "42.5"),
    Dns(name: "Google", ip: "8.8.8.8", ms: "42.5"),
    Dns(name: "Google", ip: "8.8.8.8", ms: "42.5"),
]

struct DNSView: View {
    @State var host = "8.8.8.8"
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.darkerblue,
                                                       Color.blue2,Color.royal ]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            VStack{
                VStack{
                    HStack{
                        TextField("Enter host", text: $host)
                            .font(.system(size: 30))
                            .multilineTextAlignment(.center)
                            .frame(width: 200, height: 15)
                            .padding()
                            .background(.white)
                            .border(.black)
                        Button{
                            
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
                        Spacer()
                        Text("\(rede.ms)ms").padding()
                    }.frame(width: 300, height: 75)
                        .border(.black)
                        .background(.white)

                }
            }
        }
    }
}

#Preview {
    DNSView()
}
