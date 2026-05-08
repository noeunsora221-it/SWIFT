import SwiftUI
internal import Combine
import Foundation

// create a Todo connect
struct Todo : Decodable, Identifiable{
    let id : Int
    let title : String
}

func fetchData()async throws -> [Todo]{
    // create networking connection with decode
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos?_limit=2")!
    let (data, respone) = try await URLSession.shared.data(from: url) // respone data
    
    // return result
    return try JSONDecoder().decode([Todo].self, from: data)
}
struct ContentView : View {
    @State private var todos : [Todo] = []
    var body: some View {
        List(todos){
            t in Text(t.title)
        }
        .task {
            
            do{
                todos = try await fetchData()
            }catch{
                print(error)
            }
        }
    }
}


#Preview {
    ContentView()
}
