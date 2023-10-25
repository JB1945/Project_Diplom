//
//  ExpensivePresenter.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 26.09.23.
//

import UIKit

protocol ExpensivePresenter {
    var categories: [Category] { get }
    var dataSource: [DataSourceModel] { get }

    func madeExpense(_ model: DataSourceModel)
    func viewDidLoad()

    func removeRow(at indexPath: IndexPath)
    func setStatistic(period: Int, limit: Double)

    func enteredValue(_ value: String)
}

class ExpensivePresenterImp: ExpensivePresenter {
    weak var view: ExpensiveController?

    var userDefaultsManger: UserDefaultsManager = UserDefaultsManager()
    var categories: [Category] = Category.allCases
    var dataSource = [DataSourceModel]() {
        didSet {
            saveDataSource()
        }
    }

    let service: FinancesService

    init(service: FinancesService) {
        self.service = service
    }

    deinit {
        service.removeObserver(self)
    }

    func viewDidLoad() {
        service.addObserver(self)

        loadDataSourceModel()
    }

    func enteredValue(_ value: String) {
        guard let value = Double(value) else { return }
        let canSpend = service.canSpend(value)
        view?.canSpendMoney(canSpend)
    }

    func madeExpense(_ model: DataSourceModel) {
        let value = model.sum
        guard service.canSpend(value) else { return }

        dataSource.append(model)
        view?.dataSourceDidUpdated()

        service.updateFinances(with: value)
    }

    func removeRow(at indexPath: IndexPath) {
        let model = dataSource[indexPath.row]
        dataSource.remove(at: indexPath.row)

        service.updateFinances(with: -model.sum)
    }

    func setStatistic(period: Int, limit: Double) {
        service.setStatistic(period: period, limit: limit)
    }

    func saveDataSource() {
        guard let data = try? JSONEncoder().encode(dataSource) else {
            return
        }
        userDefaultsManger.set(data, forKey: .dataSource)
    }

    func loadDataSourceModel() {
        guard
            let data = userDefaultsManger.data(forKey: .dataSource),
            let dataSource = try? JSONDecoder().decode([DataSourceModel].self, from: data)
        else {
            return
        }

        self.dataSource = dataSource
    }
}

extension ExpensivePresenterImp: ServiceObserver {
    func financesDidUpdated(_ finances: Finances) {
        view?.updateFinances(finances)
    }
}
