import SwiftUI
import SystemConfiguration.CaptiveNetwork
import CoreFoundation

struct SinalForcaView: View {
    @State private var dBm: Int = 0
    @State private var porcentagemSinalForca: Int = 0
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
                
                Text("Força do Sinal: \(porcentagemSinalForca)%")
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
                if let interfaces = CNCopySupportedInterfaces() as? [String] {
                    for interface in interfaces {
                        if let informacaoInterface = CNCopyCurrentNetworkInfo(interface as CFString) as NSDictionary? {
                            if let forcaSinal = informacaoInterface["RSSI"] as? NSNumber {
                                dBm = forcaSinal.intValue
                                porcentagemSinalForca = calcularForcaSinal(forcaSinal.intValue)
                                return
                            }
                        }
                    }
                }
                dBm = 0
                porcentagemSinalForca = 0
            }
        }
    }
    
    func iniciarAtualizacao() {
        atualizando = true
        atualizarForcaSinal()
    }
    
    func pararAtualizacao() {
        atualizando = false
        temporizador?.invalidate()
    }
    
    func calcularForcaSinal(_ dBm: Int) -> Int {
        // A força do sinal é tipicamente na faixa de -30 a -100 dBm
        // Você pode precisar ajustar essa faixa com base nos seus requisitos
        let porcentagem = 100 + dBm
        return min(max(porcentagem, 0), 100)
    }
}

#Preview {
    SinalForcaView()
}
