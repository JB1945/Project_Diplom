//
//  Extension + Formatter.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 11.10.23.
//

import UIKit

extension Double {

        var formattedString: String? {
            let number = NumberFormatter()
            number.numberStyle = .decimal
            number.maximumFractionDigits = 2

            return number.string(from: self as NSNumber)
        }
}
