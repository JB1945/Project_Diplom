//
//  Extension + Localized.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 9.09.23.
//

import UIKit

extension String {
    func localizable() -> String {
        NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self)
    }
}
