// create a Data Respone API
import Foundation
class DataRespone : Codable{
    let data : [Data]
}

class Data : Codable, Identifiable{
    let id : Int
    let name : String
    let role : String
}
