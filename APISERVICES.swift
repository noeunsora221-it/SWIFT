// Create API Services
import Foundation

class APISERVICES{
    //fetchdata functions
    func fetchData() async throws -> [Data]{
        // url link API -> optinal
        guard let url = URL(string: "https://jsonapiservices.com") else{
            return []
        }
        
        // respone data -> Networking share data
        let (d, respone) = try await URLSession.shared.data(from: url)
        if let httpurlRespone = respone as? HTTPURLResponse{
            print("Respone : \(httpurlRespone.statusCode)")
        }
        
        // Decode Json
        let result = try JSONDecoder().decode(DataRespone.self, from: d)
        
        return result.data
    }

}
