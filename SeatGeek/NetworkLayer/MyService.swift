//
//  MyService.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/6/21.
//

import Foundation
import Moya







enum MyService {
    case Events(client_id: String, client_secret: String)
}


extension MyService: TargetType {
    var baseURL: URL { return URL(string: "https://api.seatgeek.com/2")! }
    var path: String {
        switch self {

        case .Events(_, _):
            return "/events"
        }
    }
    var method: Moya.Method {
        switch self {
        case .Events:
            return .get
        }
    }
    var task: Task {
        switch self {
        case let .Events(client_id, client_secret): // Always send parameters as JSON in request body
            return .requestParameters(parameters: ["client_id": client_id, "client_secret": client_secret], encoding: URLEncoding.default)
        }
    }
    var sampleData: Data {
        switch self {

        case .Events(let client_id, let client_secret):
            return "{\"client_id\": \"\(client_id)\", \"client_secret\": \"\(client_secret)\"}".utf8Encoded
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}


private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
