//
//  EventList.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/6/21.
//

import Foundation


public struct EventList:Codable{
    
    let events: [Event]?
    let meta: Meta?
    let inHand: InHand?

    enum CodingKeys: String, CodingKey {
           case events, meta
           case inHand = "in_hand"
    }
}
