import Foundation
internal import Combine

class ProductViewModel : ObservableObject{
    @Published var products : [Product] = []
    @Published var isloading = false
    @Published var iserrormessage = ""
    
    private let apiservice = APIService()
    
    // load products
    func loadProducts() async{
        
        isloading = true
        do{
            products = try await apiservice.fetchProduct()
        }catch{
            iserrormessage = error.localizedDescription
        }
        
        isloading = false
    }
}
