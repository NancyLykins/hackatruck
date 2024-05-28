import Foundation

class PingService {
    
    let apiKey = " 9aa0cffa158b692a135432824587a43d9afcfd54"
    let baseURL = "https://api.viewdns.info/ping/"
    
    func ping(host: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)?host=\(host)&apikey=\(apiKey)&output=json") else {
            completion(.failure(PingError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(PingError.noData))
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let jsonDict = json as? [String: Any],
                   let responseDict = jsonDict["response"] as? [String: Any],
                   let replies = responseDict["replys"] as? [[String: String]] {
                    var pingResults = ""
                    for reply in replies {
                        if let rtt = reply["rtt"] {
                            pingResults += "\(rtt)\n"
                        }
                    }
                    completion(.success(pingResults))
                } else {
                    completion(.failure(PingError.invalidJSON))
                }
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func ifconfigme(){
        var req = URLRequest(url: URL(string: "http://ifconfig.me/")!)
        print(req)
    }
}

enum PingError: Error {
    case invalidURL
    case noData
    case invalidJSON
}
