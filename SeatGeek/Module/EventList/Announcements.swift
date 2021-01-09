//
//  Announcements.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/6/21.
//

import Foundation
public struct Announcements: Codable {
    let checkoutDisclosures: CheckoutDisclosures?

    enum CodingKeys: String, CodingKey {
        case checkoutDisclosures = "checkout_disclosures"
    }
}
