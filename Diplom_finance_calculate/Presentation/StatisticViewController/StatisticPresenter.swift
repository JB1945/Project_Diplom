//
//  StatisticPresenter.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 26.09.23.
//

import Foundation

protocol StatisticPresenter {
    func viewDidLoad()
}

class StatisticPresenterImp: StatisticPresenter {
    weak var view: StatisticsController?

    let service: FinancesService

    init(service: FinancesService) {
        self.service = service
    }

    deinit {
        service.removeObserver(self)
    }

    func viewDidLoad() {
        service.addObserver(self)
    }

}

extension StatisticPresenterImp: ServiceObserver {
    func financesDidUpdated(_ finances: Finances) {
         let allMoneyInPeriod = finances.spentInPeriod.value + finances.forSpending.value
         var spentPercentsInPeriod: Double
         if allMoneyInPeriod > 0 {
             spentPercentsInPeriod = finances.spentInPeriod.value / allMoneyInPeriod * 100
         } else {
             spentPercentsInPeriod = 0
         }

         let forSpending: Double
         if spentPercentsInPeriod > 100 {
             spentPercentsInPeriod = 100
             forSpending = 0.0
         } else {
             forSpending = 100 - spentPercentsInPeriod
         }

         // Вьюха Circular плохо работает с вариантом: [100, 0] и меняет цвета
         view?.updatePercentages([forSpending, spentPercentsInPeriod].filter({ $0 != 0 }))
     }
}
