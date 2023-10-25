//
//  HomePresenter.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 26.09.23.
//

import UIKit

protocol HomePresenter {
    func viewDidLoad()
}

class HomePresenterImp: HomePresenter {
    weak var view: HomeController?

    private let userDefaultsManager = UserDefaultsManager()

    let service: FinancesService

    init(service: FinancesService) {
        self.service = service
    }

    deinit {
        service.removeObserver(self)
    }

    func viewDidLoad() {
        service.addObserver(self)

        loadImage()
    }
}

extension HomePresenterImp: ServiceObserver {
    func financesDidUpdated(_ finances: Finances) {
        let forSpendingValue = finances.forSpending.value
        view?.forSpendingUpdated(String(forSpendingValue))
    }
}

private extension HomePresenterImp {
    func loadImage() {
        guard
            let data = userDefaultsManager.data(forKey: .homeImage)
        else {
            return
        }

        let image = UIImage(data: data)
        view?.imageLoaded(image)
    }
}
