//
//  Meta.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/6/21.
//

import Foundation
public struct Meta: Codable {
    let total, took, page, perPage: Int?
    //let geolocation: JSONNull?

    enum CodingKeys: String, CodingKey {
        case total, took, page
        case perPage = "per_page"
        //    case geolocation
    }
}
