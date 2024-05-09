import SwiftUI

struct RecivedView: View {
    @State public var nome: String = ""
    @State private var button: Bool = false
    var body: some View {
        ZStack{
            
                Color(.green)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            NavigationStack{
                VStack{
                    TextField("Digite seu nome: ", text: $nome)
                        .multilineTextAlignment(.center)
                    Spacer()
                    Text("Bem vindo(a) \(nome)")
                    Spacer()
                        NavigationLink(destination: ContentView(name: nome)) {
                            Text("Entrar")
                        }
                        .frame(width: 175, height: 50)
                        .background(.purple)
                        .foregroundColor(.black)
                        .cornerRadius(15)
                        .padding(20)
                }
                .frame(width: 300, height: 250)
                .cornerRadius(0)
                .background(.pink)
            }
        }
    }
}

#Preview {
    RecivedView()
}
