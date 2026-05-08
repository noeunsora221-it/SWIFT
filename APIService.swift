// API Service in swift

import Foundation

// create a class as APIService
class APIService{
    
    // Fetch data Products
    func fetchProduct() async throws -> [Product]{
        // URL API
        guard let url = URL(string: "https://dummyjson.com/products") else{
            return []
        }
        
        // Respone data
        let (data, respone) = try await URLSession.shared.data(from: url)
        
        // check status code
        if let httpRespone = respone as? HTTPURLResponse{
            print("status code...!", httpRespone.statusCode)
        }
        
        // Decode json
        let result = try JSONDecoder().decode(ProductRespone.self, from: data)
        
        return result.product
    }
}

// create a APIServices
class apiService{
    
    // fetch products
    func fetchData() async throws -> [Product]{
        
        // optional Link URL API
        guard let urls = URL(string: "https://dummyjson1.com/products") else{
            return []
        }
        
        // Respone data
        let (data, respone) = try await URLSession.shared.data(from: urls)
        
        // check status data code
        if let httpRespones = respone as? HTTPURLResponse{
            print("status code...!", httpRespones.statusCode)
            
        }
        
        let results = try JSONDecoder().decode(ProductRespone.self, from: data)
        
        return results.product
    }
}
