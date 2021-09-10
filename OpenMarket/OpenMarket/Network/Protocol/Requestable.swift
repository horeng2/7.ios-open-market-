//
//  Requestable.swift
//  OpenMarket
//
//  Created by 박태현 on 2021/09/01.
//

import Foundation

protocol Requestable {
    var url: APIURL { get }
    var method: APIMethod { get }
    var contentType: ContentType { get }
}

protocol RequestableWithoutBody: Requestable {
}

protocol RequestableWithBody: Requestable {
}

protocol RequestableWithJSONBody: RequestableWithBody {
    var json: DELETEItem { get }
}
protocol RequestableWithMultipartBody: RequestableWithBody {
    var parameters: Parameters { get }
    var images: [Media]? { get }
}