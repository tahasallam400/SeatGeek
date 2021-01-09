//
//  Performer.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/6/21.
//

import Foundation

public struct Performer: Codable {
 //   let type: TypeEnum?
    let name: String?
    let image: String?
    let id: Int?
    let images: Images?
    let divisions: [Division]?
    let hasUpcomingEvents: Bool?
    let primary: Bool?
    let stats: PerformerStats?
    let taxonomies: [Taxonomy]?
    let imageAttribution: String?
    let url: String?
    let score: Double?
    let slug: String?
    let homeVenueID: Int?
    let shortName: String?
    let numUpcomingEvents: Int?
    let colors: Colors?
    let imageLicense: String?
    let popularity: Int?
    let homeTeam: Bool?
    let location: Location?
    let awayTeam: Bool?

    enum CodingKeys: String, CodingKey {
        case /*type,*/ name, image, id, images, divisions
        case hasUpcomingEvents = "has_upcoming_events"
        case primary, stats, taxonomies
        case imageAttribution = "image_attribution"
        case url, score, slug
        case homeVenueID = "home_venue_id"
        case shortName = "short_name"
        case numUpcomingEvents = "num_upcoming_events"
        case colors
        case imageLicense = "image_license"
        case popularity
        case homeTeam = "home_team"
        case location
        case awayTeam = "away_team"
    }
}
