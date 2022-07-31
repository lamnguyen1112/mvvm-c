//
//  UserModel.swift
//  Template
//
//  Created by Lam Nguyen on 5/19/22.
//

import ObjectMapper

struct UserModel: Mappable {
    var identifier: Int!
    var name: String?
    var userName: String?
    var email: String?
    var address: AddressModel?
    var phone: String?
    var website: String?
    var companyName: String?
    var companyCatchPhrase: String?
    var companyBS: String?
    
    // MARK: JSON
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        identifier <- map["id"]
        name <- map["name"]
        userName <- map["userName"]
        email <- map["email"]
        address <- map["address"]
        phone <- map["phone"]
        website <- map["website"]
        companyName <- map["company.name"]
        companyCatchPhrase <- map["company.catchPhrase"]
        companyBS <- map["company.bs"]
    }
}

struct AddressModel: Mappable {
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geoLat: String?
    var geoLong: String?
    
    // MARK: JSON
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        street <- map["street"]
        suite <- map["suite"]
        city <- map["city"]
        zipcode <- map["zipcode"]
        geoLat <- map["geo.lat"]
        geoLong <- map["geo.lng"]
    }
}
