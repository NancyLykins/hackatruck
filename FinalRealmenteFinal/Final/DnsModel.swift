import Foundation

struct Domain: Codable, Hashable{
    var _id: String?
    var _rev: String?
    var ip: String?
    var domain: String?
}

struct Records: Decodable, Hashable{
    var name: String
    var type: String
    var data: String
}

struct API: Decodable, Hashable{
    var response: DnsRecords
}
struct DnsRecords: Decodable, Hashable{
    var records: [Records]
}

class DnsService: ObservableObject {
    @Published var data: [Records] = []
    @Published var res: [Domain] = []
    @Published var ip: String = ""
    @Published var infos: Domain = Domain(ip: "0.0.0.0", domain: "exemple.com")
    let apiKey = "9aa0cffa158b692a135432824587a43d9afcfd54"
    //9aa0cffa158b692a135432824587a43d9afcfd54
    let baseURL = "api.viewdns.info/dnsrecord/"
    
    public func saveDns(domain: String){
        translateDns(domain: domain)
    }
    
    func translateDns(domain: String) {
        guard let url = URL(string: "https://\(baseURL)?domain=\(domain)&apikey=\(apiKey)&output=json") else { fatalError("Missing URL") }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(String(describing: error))")
                return
            }
            DispatchQueue.main.async { [self] in
                do {
                    let parsed = try JSONDecoder().decode(API.self, from: data)
                    self.data = parsed.response.records.filter({ $0.type == "A"})
                    postDomain(obj: Domain(_id: nil, _rev: nil, ip: self.data.first!.data, domain: domain))
                } catch {
                    print("Error:", error)
                }
            }
        }
        task.resume()
    }

    func postDomain(obj: Domain) {
        guard let url = URL(string: "http://127.0.0.1:1880/netools") else {return}

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        let encoder = JSONEncoder()
        
        do{
            let data = try JSONEncoder().encode(obj)
            request.httpBody = data
            print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        } catch {
            print("Error")
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Falha na requisição: \(error.localizedDescription)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Erro to send resource")
                return
            }
            if httpResponse.statusCode == 200 {
                print("Success")
            } else {
                print("Error \(httpResponse.statusCode)")
            }
            
        }
        task.resume()
        self.data.removeAll()
    }
    
    func getDns(){
        guard let url = URL(string: "http://127.0.0.1:1880/netools") else { fatalError("Missing URL") }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(String(describing: error))")
                return
            }
            DispatchQueue.main.async { [self] in
                do {
                    let parsed = try JSONDecoder().decode([Domain].self, from: data)
                    self.res = parsed
                } catch {
                    print("Error:", error)
                }
            }
        }
        task.resume()
    }
}
