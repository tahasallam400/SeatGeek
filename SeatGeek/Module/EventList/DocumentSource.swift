//
//  DocumentSource.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/6/21.
//

import Foundation
public struct DocumentSource: Codable {
    let sourceType: SourceType?
    let generationType: GenerationType?

    enum CodingKeys: String, CodingKey {
        case sourceType = "source_type"
        case generationType = "generation_type"
    }
}
