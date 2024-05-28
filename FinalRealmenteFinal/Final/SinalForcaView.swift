import SwiftUI
import SystemConfiguration.CaptiveNetwork
import CoreFoundation

struct SinalForcaView: View {
    @State private var dBm: Int = 0
    @State private var porcentagemForcaSinal: Int = 0
    @State private var atualizando: Bool = false
    @State private var temporizador: Timer? = nil
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.darkerblue,
                                                       Color.blue2,Color.royal ]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Força do Sinal Wi-Fi")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                
                Text("dBm: \(dBm)").foregroundColor(.white)
                
                Text("Força do Sinal: \(porcentagemForcaSinal)%")
                    .padding(.bottom)
                    .foregroundColor(.white)
                
                HStack {
                    Button(action: {
                        iniciarAtualizacao()
                    }) {
                        Text("Iniciar")
                    }
                    .disabled(atualizando)
                    
                    Button(action: {
                        pararAtualizacao()
                    }) {
                        Text("Parar")
                    }
                    .disabled(!atualizando)
                }
            }
            .padding()
            .onAppear {
                atualizarForcaSinal()
            }
        }
    }
    
        func atualizarForcaSinal() {
            temporizador?.invalidate()
            temporizador = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if atualizando {
                    // Gerar valores fictícios para dBm e porcentagem de força do sinal
                    dBm = -30 - Int.random(in: 0...20) // Valores fictícios entre -30 e -50
                    porcentagemForcaSinal = calcularPorcentagemForcaSinal(dBm)
                }
            }
        }
    
        // Método para iniciar a atualização da força do sinal
        func iniciarAtualizacao() {
            atualizando = true
            atualizarForcaSinal()
        }
    
        // Método para parar a atualização da força do sinal
        func pararAtualizacao() {
            atualizando = false
            temporizador?.invalidate()
        }
    
        // Método para calcular a porcentagem da força do sinal
        func calcularPorcentagemForcaSinal(_ dBm: Int) -> Int {
            // Ajusta a porcentagem com base no dBm
            let percentage = 100 - (dBm + 30) * 2 // Porcentagem diminui linearmente de 100% a 0% conforme dBm aumenta de -30 a -50
            return min(max(percentage, 0), 100)
        }
    }

#Preview {
    SinalForcaView()
}
