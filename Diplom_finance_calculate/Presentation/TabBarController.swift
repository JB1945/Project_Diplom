//
//  ViewController.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 9.09.23.
//

import UIKit
import SnapKit

class TabBarController: UITabBarController  {

    override func viewDidLoad() {
        super.viewDidLoad()

        generateTabBar()
        setTabBarAppiarence()
    }

//do fon to generate tabBar
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: HomeViewController(),
                       title: "Home",
                       image: UIImage(systemName: "house.fill")),
            generateVC(viewController: ExpensesViewController(),
                       title: "Expenses",
                       image: UIImage(systemName: "cart.fill.badge.minus")),
            generateVC(viewController: RevenuesViewController(),
                       title: "Revenues",
                       image: UIImage(systemName: "cart.fill.badge.plus")),
            generateVC(viewController: StatisticsViewController(),
                       title: "Stats",
                       image: UIImage(systemName: "chart.line.uptrend.xyaxis.circle.fill"))
        ]
    }
//do func for generate VC
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image

        return viewController
    }
    //do func for custom tabBar
    private func setTabBarAppiarence() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let hight = tabBar.bounds.height + positionOnY * 2

        let roundLayer = CAShapeLayer()

        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: hight
            ),
            cornerRadius: hight / 2
        )

        roundLayer.path = bezierPath.cgPath   //?????
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)  //?????

        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        tabBar.tintColor = .myButtonAndOtherColor
        tabBar.unselectedItemTintColor = .myOtherColor
    }

}

