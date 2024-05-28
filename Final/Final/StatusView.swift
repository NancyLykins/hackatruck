//
//  ContentView.swift
//  Projeto Netools
//
//  Created by Turma01-8 on 21/05/24.
//

import SwiftUI

struct StatusView: View {
    var body: some View {
        ZStack{
            (LinearGradient(gradient: Gradient(colors: [Color.darkerblue,
            Color.blue2,Color.royal ]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
                HStack{
                    VStack(spacing: 10){
                        Spacer()
                        Text("IP                    123.456.789.010 ")
                            .frame(width: 300, height: 75)
                            .background(Color.white)
                            .fontWeight(.bold)
                        Text("Gateway           456.789.101.112/13 ")
                            .frame(width: 300, height: 75)
                            .background(Color.white)
                            .fontWeight(.bold)
                        Text("DNS                  111.222.333.444 ")
                            .frame(width: 300, height: 75)
                            .background(Color.white)
                            .fontWeight(.bold)
                        Text("MAC           exemplo")
                            .frame(width: 300, height: 75)
                            .background(Color.white)
                            .fontWeight(.bold)
                        Text("IPv6                 exemplo ")
                            .frame(width: 300, height: 75)
                            .background(Color.white)
                            .fontWeight(.bold)
                        Spacer()
                        Button("Acessar"){
                            
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

#Preview {
    StatusView()
}
