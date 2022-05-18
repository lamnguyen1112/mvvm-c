//
//  User.swift
//  Template
//
//  Created by Lam Nguyen on 5/19/22.
//

import ObjectMapper

struct User: Mappable {
    
//    {
//    "id": 1,
//    "name": "Leanne Graham",
//    "username": "Bret",
//    "email": "Sincere@april.biz",
//    "address": {
//    "street": "Kulas Light",
//    "suite": "Apt. 556",
//    "city": "Gwenborough",
//    "zipcode": "92998-3874",
//    "geo": {
//    "lat": "-37.3159",
//    "lng": "81.1496"
//    }
//    },
//    "phone": "1-770-736-8031 x56442",
//    "website": "hildegard.org",
//    "company": {
//    "name": "Romaguera-Crona",
//    "catchPhrase": "Multi-layered client-server neural-net",
//    "bs": "harness real-time e-markets"
//    }
//    },
//
    var identifier: Int!
    var name: String?
    var userName: String?
    var emai: String?
//    var address:
    var phone: String?
    var website: String?
//    var company:
    
    // MARK: JSON
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        identifier <- map["id"]
        name <- map["name"]
        userName <- map["userName"]
        phone <- map["phone"]
        website <- map["website"]
    }
    
}
