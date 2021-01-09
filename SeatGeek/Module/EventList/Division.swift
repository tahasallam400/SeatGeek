//
//  Division.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/6/21.
//

import Foundation
public struct Division: Codable {
    let taxonomyID: Int?
    let shortName: String?
    let displayName: String?
    let displayType: DisplayType?
    let divisionLevel: Int?
    let slug: String?

    enum CodingKeys: String, CodingKey {
        case taxonomyID = "taxonomy_id"
        case shortName = "short_name"
        case displayName = "display_name"
        case displayType = "display_type"
        case divisionLevel = "division_level"
        case slug
    }
}
