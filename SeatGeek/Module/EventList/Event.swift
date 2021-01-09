//
//  Event.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/6/21.
//

import Foundation

public struct Event: Codable {
//    let type: TypeEnum?
    let id: Int?
    let datetimeUTC: String?
    let venue: Venue?
    let datetimeTbd: Bool?
    let performers: [Performer]?
    let isOpen: Bool?
    //let links: [JSONAny]
    let datetimeLocal: String?
    let timeTbd: Bool
    let shortTitle, visibleUntilUTC: String?
    let stats: EventStats?
    let taxonomies: [Taxonomy]?
    let url: String?
    let score: Double?
    let announceDate, createdAt: String?
    let dateTbd: Bool?
    let title: String?
    let popularity: Double?
    let eventDescription: String?
    let status: Status?
    let accessMethod: AccessMethod?
    //let eventPromotion: JSONNull?
    let announcements: Announcements?
    let conditional: Bool?
   // let enddatetimeUTC: JSONNull?
    //let themes, domainInformation: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case /*type,*/ id
        case datetimeUTC = "datetime_utc"
        case venue
        case datetimeTbd = "datetime_tbd"
        case performers
        case isOpen = "is_open"
      //  case links
        case datetimeLocal = "datetime_local"
        case timeTbd = "time_tbd"
        case shortTitle = "short_title"
        case visibleUntilUTC = "visible_until_utc"
        case stats, taxonomies, url, score
        case announceDate = "announce_date"
        case createdAt = "created_at"
        case dateTbd = "date_tbd"
        case title, popularity
        case eventDescription = "description"
        case status
        case accessMethod = "access_method"
        //case eventPromotion = "event_promotion"
        case announcements, conditional
       // case enddatetimeUTC = "enddatetime_utc"
      //  case themes
       // case domainInformation = "domain_information"
    }
}
