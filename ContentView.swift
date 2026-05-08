import SwiftUI
import SwiftData

struct ContentView : View {
    @State private var flipped = false
    var body: some View {
        // image with animation Rotations3DEffect
        NavigationStack{
            AsyncImage(url: URL(string: "https://i.pinimg.com/1200x/ae/3a/55/ae3a55d15d6fbf02b713e80057e8e11b.jpg"))
                .scaledToFit()
                .frame(width: 500,height: 1100)
                .clipped()
                .cornerRadius(30)
                .rotation3DEffect(.degrees(flipped ? 150: 0), axis: (x : 0, y : 1, z : 0))
            
                .animation(.easeInOut, value: flipped)
                
                .onTapGesture {
                    flipped.toggle()
                }
            
                
        }
        
    }
}


#Preview {
    ContentView()
}
