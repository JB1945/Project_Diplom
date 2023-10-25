//
//  Extension + Date.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 11.10.23.
//

import UIKit

extension Date {

        var dateString: String {
            let formatter = DateFormatter()
            let dateFormat = "MMM d, h:mm a"
            formatter.dateFormat = dateFormat
            return formatter.string(from: self)
        }
}
