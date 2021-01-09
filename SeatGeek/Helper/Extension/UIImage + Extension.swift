//
//  UIImage + Extension.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/7/21.
//

import Foundation
import UIKit

extension UIImageView {

    func makeRounded(_ cornerRadius:CGFloat) {

        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}
