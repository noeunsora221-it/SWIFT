import SwiftUI

struct ContentView :View {
    @State private var isAlert : Bool = false
    @State private var result : Int = 0;
    @State private var isAlert1 : Bool = false
    @State private var result_1 :Int = 0;
    var body: some View {
        VStack{
            // Review -> about Color | Frame | background set values and Valable Modifying
            //Review -> Message alert the showing
            Text("Showing the result : \(result)")
            Button("Caculate Plus"){
                result += 10
            }
            Button("Showing ALert"){
                isAlert = true
            }
            Text("Showing the result :\(result)")
            Button("Caculate Minus"){
                Button("Showing Now"){
                    result_1 -= 10
                }
            }.alert("Warning", isPresented: $isAlert){
                Button("OK ! Pls check it!"){}
            }message: {
                Text("Showing the result \(result)")
            }
        }
    }
    
}

#Preview {
    ContentView()
}
