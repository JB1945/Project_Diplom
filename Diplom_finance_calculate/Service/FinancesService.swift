//
//  FinancesService.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 25.10.23.
//

import Foundation

protocol ServiceObserver: AnyObject {
    func financesDidUpdated(_ finances: Finances)
}

final class FinancesService {

    private var userDefaultsManger: UserDefaultsManager = UserDefaultsManager()
    private var observers: [Weak<ServiceObserver>] = []

    private var finances = Finances()

    init() {
        loadFinances()
    }

    func addObserver(_ observer: ServiceObserver) {
        observers.append(Weak(observer))
        observer.financesDidUpdated(finances)
    }

    func removeObserver(_ observer: ServiceObserver) {
        observers.removeAll(where: { $0.value === observer })
    }

    func canSpend(_ value: Double) -> Bool {
        finances.forSpending.value >= value
    }

    func updateFinances(with value: Double) {
        guard canSpend(value) else { return }

        finances.forSpending.value -= value
        finances.allCoast.value += value
        finances.spentInPeriod.value += value

        financesDidUpdated()
    }

    func setStatistic(period: Int, limit: Double) {
        finances.monthly.value = limit
        finances.forSpending.value = limit / Double(period)

        financesDidUpdated()
    }

    private func financesDidUpdated() {
        observers.forEach({
            $0.value?.financesDidUpdated(finances)
        })

        saveFinances(finances)
    }

    private func loadFinances() {
        guard
            let data = userDefaultsManger.data(forKey: .finances),
            let finances = try? JSONDecoder().decode(Finances.self, from: data)
        else {
            return
        }

        self.finances = finances
    }

    private func saveFinances(_ finances: Finances) {
        guard let data = try? JSONEncoder().encode(finances) else {
            return
        }
        userDefaultsManger.set(data, forKey: .finances)
    }
}
