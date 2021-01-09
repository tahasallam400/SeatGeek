//
//  Venue.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/6/21.
//

import Foundation

public struct Venue: Codable {
    let state, nameV2, postalCode, name: String?
  //  let links: [JSONAny]
    let timezone: String?
    let url: String?
    let score: Double?
    let location: Location?
    let address: String?
    let country: Country?
    let hasUpcomingEvents: Bool?
    let numUpcomingEvents: Int?
    let city, slug, extendedAddress: String?
    let id, popularity: Int?
    let accessMethod: AccessMethod?
    let metroCode, capacity: Int?
    let displayLocation: String?

    enum CodingKeys: String, CodingKey {
        case state
        case nameV2 = "name_v2"
        case postalCode = "postal_code"
        case name/*,links*/, timezone, url, score, location, address, country
        case hasUpcomingEvents = "has_upcoming_events"
        case numUpcomingEvents = "num_upcoming_events"
        case city, slug
        case extendedAddress = "extended_address"
        case id, popularity
        case accessMethod = "access_method"
        case metroCode = "metro_code"
        case capacity
        case displayLocation = "display_location"
    }
}
