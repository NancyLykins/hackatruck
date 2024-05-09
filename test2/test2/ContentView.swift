import SwiftUI

struct ContentView: View {
    @State private var nome: String = ""
    @State private var showingAlert: Bool = false
    @State private var opt: Int = 0
    var body: some View {
        ZStack{
            Image("kalilinux")
                .opacity(0.2)
            Spacer()
            VStack(){
                VStack{
                    Text("Bem vindo, \(nome)")
                        .padding()
                    TextField("Insira seu nome" , text: $nome)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                VStack{
                    Image("logo")
                        .resizable()
                        .frame(width: 200, height: 100)
                        .shadow(radius: 20)
                    Image("truck")
                        .resizable()
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .frame(width: 200, height: 100)
                        .fixedSize()
                }
                Spacer()
                Button("Entrar"){
                    showingAlert = true
                    if(nome.count > 3){
                        opt = 1
                    }
                }
                .frame(width: 150, height: 50)
                .background(Color.green)
                .cornerRadius(10.0)
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 10.0)
                .alert(isPresented: $showingAlert){
                    switch opt{
                        case 1:
                            return Alert(title: Text("Uma mensagem importante"), message: Text("Bem vindo(a) \(nome)"), dismissButton: .default(Text("Ok")))
                        default:
                            return Alert(title: Text("Digite seu nome e usuário"), message: Text("Nome de usuário inálido ou incorreto"), dismissButton: .default(Text("Ok")))
                    }
                }

            }
        }
    }
}

#Preview {
    ContentView()
}
