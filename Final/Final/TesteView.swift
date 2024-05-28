import SwiftUI

struct TesteView: View {
    @State private var pingResults: [String: String] = [:]
    @State private var errorMessage: String?
    let pingService = PingService()
    
    let dnsHosts = [
        "Google": "8.8.8.8",
        "Cloudflare": "1.1.1.1",
        "OpenDNS": "208.67.222.222"
    ]
    
    var body: some View {
        VStack {
            Button("Ping DNS Servers") {
                pingAllDNS()
            }
            .padding()
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            ForEach(dnsHosts.keys.sorted(), id: \.self) { key in
                HStack {
                    Text(key)
                    Spacer()
                    if let result = pingResults[key] {
                        Text(result)
                    } else {
                        Text("...")
                    }
                }
            }
            .padding()
        }
        .padding()
    }
    
    private func pingAllDNS() {
        errorMessage = nil
        pingResults = [:]
        
        for (name, host) in dnsHosts {
            pingService.ping(host: host) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let results):
                        if let firstResult = results.split(separator: "\n").first {
                            pingResults[name] = "(\(host)) \(firstResult)"
                        } else {
                            pingResults[name] = "(\(host)) No response"
                        }
                    case .failure(let error):
                        pingResults[name] = "(Error)"
                        errorMessage = "Error: \(error.localizedDescription)"
                    }
                }
            }
        }
    }
}

#Preview{
    TesteView()
}
