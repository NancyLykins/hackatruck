//
//  ContentView.swift
//  imc
//
//  Created by Turma01-10 on 03/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var bg_color: Color = .white
    @State private var imc_type: String = ""
    @State private var weight: Double = 0
    @State private var height: Double = 0
    var body: some View {
        ZStack{
            Color(bg_color).ignoresSafeArea()
            VStack{
                Text("Calculadora de IMC")
                .font(.system(size: 40))
                Text("Digite sua altura")
                    .padding(.top, 10)
                TextField("Digite seu peso", value: $weight, format: .number)
                    .frame(width: 300, height: 40)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .border(.black)
                    .background(.white)
                Text("Digite sua altura")
                    .padding(.top, 10)
                TextField("Digite sea altura", value: $height, format: .number)
                    .frame(width: 300, height: 40)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .border(.black)
                    .background(.white)
                Button("Calcular"){
                    let imc = weight/pow(height, 2)
                    if(imc < 18.5){
                        bg_color = .green
                        imc_type = "Abaixo do peso"
                    } else if(imc >= 18.5 && imc < 25) {
                        bg_color = .yellow
                        imc_type = "Normal"
                    } else if(imc >= 25 && imc < 30){
                        bg_color = .orange
                        imc_type = "Sobre peso"
                    } else {
                        bg_color = .red
                        imc_type = "Obesidade"
                    }
                }
                .frame(width: 150, height: 50)
                .background(Color.blue)
                .cornerRadius(10.0)
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Spacer()
                Text(imc_type)
                .font(.system(size: 32))
                Spacer()
                Image("tabela-IMC")
                    .resizable()
                    .frame(width: 500, height: 300)
                    .fixedSize()
            }
        }
    }
}

#Preview {
    ContentView()
}
