import SwiftUI
import SwiftData
internal import Combine

// Networking connection with api in swift
struct APINetwork : Decodable, Identifiable{
    let id : Int
    let title : String
}

func fetchAPI() async throws -> [APINetwork]{
    // create url api link
    guard let url = URL(string: "https//APINetwork.com") else{
        return []
    }
    let (data, respone) = try await URLSession.shared.data(from: url)
    
    return try JSONDecoder().decode([APINetwork].self, from: data)
}

struct ContentView : View {
    @State private var api : [APINetwork] = []
    var body: some View {
        List(api){
            i in
            Text("\(i.title)")
        }
        .task {
            do{
                api = try await fetchAPI()
            }catch{
                print(error)
            }
        }
    }
}

#Preview {
    ContentView()
}
