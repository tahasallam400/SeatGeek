//
//  PerformerStats.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/6/21.
//

import Foundation
public struct PerformerStats: Codable {
    let eventCount: Int?

    enum CodingKeys: String, CodingKey {
        case eventCount = "event_count"
    }
}
