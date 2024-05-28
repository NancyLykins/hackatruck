import Foundation

class DnsService {
    
    let apiKey = "e656579f2b1b6c414fb4bbd646e9ce769863a389"
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
                   let replies = responseDict["replys"] as? [[String: String]],
                   let firstReply = replies.first,
                   let rtt = firstReply["rtt"] {
                    
                    completion(.success(rtt))
                } else {
                    completion(.failure(PingError.invalidJSON))
                }
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

enum DnsError: Error {
    case invalidURL
    case noData
    case invalidJSON
}
