//
//  AccessMethod.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/6/21.
//

import Foundation


public struct AccessMethod: Codable {
    let method: String?
    let createdAt: String?
    let employeeOnly: Bool?

    enum CodingKeys: String, CodingKey {
        case method
        case createdAt = "created_at"
        case employeeOnly = "employee_only"
    }
}
