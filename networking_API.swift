// Review : Try catch Throw for handle error exceptions

import SwiftUI
import Foundation

// Iniatialize to func the error handle
func handleError()->LocalizedError{
    let data = 0;
    // store data
    
    // try catch for handle error exceptions
    // throwing error for not used do catch exceptions
    _ = try? String(from: data.leadingZeroBitCount as! Decoder);
    do{
        _ = try String(from: data.self as! Decoder)
    }catch{
        return "Error message pls try a again...!" as! LocalizedError;
    }
    
    return "The statement will executed and avaible code for throwing error...!" as! LocalizedError;
}

// DataProtocol is the data can that to store for as byte in data it's Different of type data
let text = "Hello world";
let byte = text.data(using: .utf8)!

func printByte<T: DataProtocol>(_ value : T){
    for byte in value{
        print(byte)
    }
}

func responeByte<T : DataProtocol>(_ v : T){
    for i in v{
        print(i)
    }
}

// with jsonString data For API
func APIRespone<T : DataProtocol>(_ respone: T)-> String{
    do{
        _ = try Data(from: respone as! Decoder)
    }catch{
        return "Error exceptions...!";
    }
    return "Check data api networking...!";
}

// Handle Error Exceptions

func handleJson<T : DataProtocol>(_ json : T) async{
    
    // Swift Concurrency
    do{
        _ =  try Data(from : json as! Decoder)
    }catch{
        _ = try? await URLSession.shared.data(for: json as! URLRequest)
    }
}

func APIResponeData<T : DataProtocol>(_ n : T)async -> String{
    _ = try? Data(from: n as! Decoder);
    
    do{
        _ = try await URLSession.shared.data(for: n as! URLRequest)
    }catch {
        return "Error...!";
    }
    return "Error flected...!"
}


func LoadAPI<T : DataProtocol>(_ flect : T){
    _ = try? Data(from : flect as! Decoder);
    
    // load API With data
    _ =  URL(filePath: "https://resouceswift.org", directoryHint: .checkFileSystem)
}

struct ContentView : View {
    var body: some View {
        
    }
}

#Preview {
    ContentView()
}
