// Review : Networking Connection with API in swift
import SwiftUI

struct ContentView : View {
    // Networking connection from API
    @StateObject private var dv = DataViewModel()
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var ison = false
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("lOGIN Network API")){
                    Toggle("Enable Notification", isOn: $ison)
                    TextField("Enter your email : ", text: $email)
                    TextField("Enter your password :", text: $password)
                }
            }
            
            Form{
                Section(header: Text("SWIFT Network API")){
                    AsyncImage(url: URL(string: "https://i.pinimg.com/736x/f7/9e/0e/f79e0efa0b7e826fd08a4ca01d0a652e.jpg")).frame(width: 200,height: 170)
                }
            }
            Form{
                Section(header: Text("Category")){
                    HStack{
                        Image(systemName: "folder")
                        Text("Flutter")
                    }
                    HStack{
                        Image(systemName: "folder")
                        Text("Swift")
                    }
                    HStack{
                        Image(systemName: "folder")
                        Text("Java")
                    }
                    HStack{
                        Image(systemName: "folder")
                        Text("C++")
                    }
                    HStack{
                        Image(systemName: "folder")
                        Text("Github")
                    }
                    HStack{
                        Image(systemName: "folder")
                        Text("React Native")
                    }
                    HStack{
                        Image(systemName: "folder")
                        Text("Javascript")
                    }
                    
                }
            }
            Group{
                if dv.isLoading{
                    Text("Networking with API ")
                }else if !dv.iserrorMessage.isEmpty{
                    Text(dv.iserrorMessage)
                        .foregroundColor(.red)
                } else{
                    List(dv.data){
                        data in
                        VStack(alignment: .center){
                            Text(data.title).font(.largeTitle)
                            
                            Text(data.price).font(.largeTitle)
                        }
                    }
                }
            }
        }.navigationTitle("Networking API")
            .task {
                await dv.loadData()
            }
    }
}


#Preview {
    ContentView()
}
