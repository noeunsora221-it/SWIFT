import Foundation

// create a productRespone model
struct ProductRespone : Codable{
    let product : [Product]
}

// create a product model
struct Product : Codable, Identifiable{
    let id : Int
    let title : String
    let price : Int
}
