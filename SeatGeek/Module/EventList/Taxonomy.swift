//
//  Taxonomy.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/6/21.
//

import Foundation
public struct Taxonomy: Codable {
    let id: Int?
  //  let name: TypeEnum?
    let parentID: Int?
    let documentSource: DocumentSource?
    let rank: Int?

    enum CodingKeys: String, CodingKey {
        case id//, name
        case parentID = "parent_id"
        case documentSource = "document_source"
        case rank
    }
}
