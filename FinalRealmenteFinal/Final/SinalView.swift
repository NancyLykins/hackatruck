//
//  SinalView.swift
//  Final
//
//  Created by Turma01-10 on 27/05/24.
//

import SwiftUI

struct SinalView: View {
    @State private var showingAlert = false
    @State private var medindo: Bool = false
    @State private var cor = Color.green
    @State private var medir: String = "Começar"
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.darkerblue,
                                                       Color.blue2,Color.royal ]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("Intensidade                     valor %")
                    .frame(width: 300, height: 75)
                    .background(Color.white)
                    .fontWeight(.bold)
                    .padding(1)
                Text("Ruído de sinal              valor dBm")
                    .frame(width: 300, height: 75)
                    .background(Color.white)
                    .fontWeight(.bold)
                    .padding(1)
                Text("Download                  valor Mbps")
                    .frame(width: 300, height: 75)
                    .background(Color.white)
                    .fontWeight(.bold)
                    .padding(1)
                Text("Upload                        valor Mbps")
                    .frame(width: 300, height: 75)
                    .background(Color.white)
                    .fontWeight(.bold)
                    .padding(1)
                Spacer()
                Button("\(medir)") {
                    medindo = !medindo
                    if(medindo == false){
                        cor = Color.green
                        medir = "Começar"
                    }
                    else if(medindo == true){
                        cor = Color.red
                        medir = "Parar"
                    }
                }
                .frame(width: 160, height: 70)
                .background(Color(cor))
                .foregroundColor(.white)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .cornerRadius(10)
                Spacer()
            }
        }
    }
}

#Preview {
    SinalView()
}
