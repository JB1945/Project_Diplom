//
//  ViewController.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 9.09.23.
//

import UIKit
import SnapKit

class TabBarController: UITabBarController  {

    private let service = FinancesService()

    override func viewDidLoad() {
        super.viewDidLoad()

        generateTabBar()
        setTabBarAppiarence()
    }

    private func generateTabBar() {
        let homePresenter = HomePresenterImp(service: service)
        let homeViewController = HomeViewController(presenter: homePresenter)
        homePresenter.view = homeViewController

        let expensesPresenter = ExpensivePresenterImp(service: service)
        let expensesViewController = ExpensesViewController(presenter: expensesPresenter)
        expensesPresenter.view = expensesViewController

        let statisticsPresenter = StatisticPresenterImp(service: service)
        let statisticsViewController = StatisticsViewController(presenter: statisticsPresenter)
        statisticsPresenter.view = statisticsViewController

        viewControllers = [
            generateVC(viewController: homeViewController,
                       title: "Home".localizable(),
                       image: UIImage(systemName: "house.fill")),
            generateVC(viewController: expensesViewController,
                       title: "Expenses".localizable(),
                       image: UIImage(systemName: "cart.fill.badge.minus")),
            generateVC(viewController: statisticsViewController,
                       title: "Stats".localizable(),
                       image: UIImage(systemName: "chart.line.uptrend.xyaxis.circle.fill"))
        ]
    }

    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image

        return viewController
    }

    private func setTabBarAppiarence() {
        tabBar.itemPositioning = .centered
        tabBar.tintColor = .myButtonAndOtherColor
        tabBar.unselectedItemTintColor = .darkGray
        tabBar.backgroundColor = .myBackgroundColor
    }
}
