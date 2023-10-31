//
//  Finance.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 30.09.23.
//

import UIKit

struct Statistic: Codable {
    enum StatisticType: CaseIterable, Codable {
        case monthly
        case forSpending
        case spentInPeriod
        case allCost
    }

    let type: StatisticType
    var value: Double = 0
}

struct Finances: Codable {
    var monthly: Statistic = .init(type: .monthly)
    var forSpending: Statistic = .init(type: .forSpending)
    var spentInPeriod: Statistic = .init(type: .spentInPeriod)
    var allCoast: Statistic = .init(type: .allCost)

    var models: [Statistic] {
        [
            monthly,
            forSpending,
            spentInPeriod,
            allCoast
        ]
    }
}

extension Statistic.StatisticType {

    var name: String {
        switch self {
        case .monthly:
            return "Estabished limite:".localizable()
        case .forSpending:
            return "For spending:".localizable()
        case .spentInPeriod:
            return "Spent for the period:".localizable()
        case .allCost:
            return "All cost:".localizable()
        }
    }
}
