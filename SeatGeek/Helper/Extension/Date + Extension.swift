//
//  Date + Extension.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/7/21.
//

import Foundation

extension Date {
    func dayNameOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
