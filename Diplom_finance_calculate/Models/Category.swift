//
//  Category.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 30.09.23.
//

import UIKit

enum Category: CaseIterable, Codable {
    case food, clothes, phone, health, car

    var text: String {
        switch self {
        case .car:
            return "Car".localizable()
        case .food:
            return "Food".localizable()
        case .clothes:
            return "Clothes".localizable()
        case .phone:
            return "Phone".localizable()
        case .health:
            return "Health".localizable()
        }
    }

    var image: UIImage? {
        switch self {
        case .food:
            return UIImage(named: "boldFood")
        case .clothes:
            return UIImage(named: "boldClothes")
        case .phone:
            return UIImage(named: "boldPhone")
        case .health:
            return UIImage(named: "boldHealth")
        case .car:
            return UIImage(named: "boldCar")
        }
    }
}

