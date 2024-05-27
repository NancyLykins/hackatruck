import SwiftUI

struct PingView: View {
    @State private var host: String = "8.8.8.8"
    @State private var pingResults: String = ""
    @State private var errorMessage: String?
    let pingService = PingService()
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.darkerblue,
                        Color.blue2,Color.royal ]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
            VStack {
                TextField("Enter host", text: $host)
                    .font(.system(size: 30))
                    .multilineTextAlignment(.center)
                    .frame(width: 250, height: 15)
                    .padding()
                    .background(.white)
                    .border(.black)
                ScrollView {
                    Text(pingResults)
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                }
                .padding(.top, 120)
                Button("Ping") {
                    ping()
                }.frame(width: 120, height: 50)
                .background(.white)
                .cornerRadius(10.0)
                .foregroundColor(.black)
                .font(.system(size: 25))
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                
                
            }
            .padding()
        }
    }
    
    private func ping() {
        errorMessage = nil
        pingService.ping(host: host) { result in
            switch result {
            case .success(let results):
                DispatchQueue.main.async {
                    pingResults = results
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    errorMessage = "Error: \(error.localizedDescription)"
                }
            }
        }
    }
}

#Preview {
    PingView()
}
