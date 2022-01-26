//
//  ProductParams.swift
//  OpenMarket
//
//  Created by 서녕 on 2022/01/09.
//

import Foundation

struct ProductParam: Codable {
    var name: String
    var descriptions: String
    var price: Int
    var currency: Currency
    var discountedPrice: Int
    var stock: Int
    var secret: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case descriptions
        case price
        case currency
        case discountedPrice = "discounted_price"
        case stock
        case secret
    }
    
    init(name: String,
         descriptions: String,
         price: Int,
         currency: Currency,
         discountedPrice: Int,
         stock: Int,
         secret: String) {
        self.name = name
        self.descriptions = descriptions
        self.price = price
        self.currency = currency
        self.discountedPrice = discountedPrice
        self.stock = stock
        self.secret = secret
    }
}
