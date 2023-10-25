//
//  StatisticsViewController.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 12.09.23.
//

import UIKit

protocol StatisticsController: AnyObject {
    func updatePercentages(_ array: [Double])
}

class StatisticsViewController: UIViewController, StatisticsController {

    let presenter: StatisticPresenter

    init(presenter: StatisticPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var circular: Circular?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
        view.backgroundColor = .myBackgroundColor
    }

    func updatePercentages(_ array: [Double]) {
        circular?.removeFromSuperview()
        let circular = Circular(percentages: array, colors: [.green, .red])
        circular.animationType = AnimationStyle.animationFan
        circular.showPercentageStyle = PercentageStyle.outward
        circular.lineWidth = 10

        view.addSubview(circular)
        circular.snp.makeConstraints({
            $0.width.height.equalTo(300)
            $0.centerX.centerY.equalToSuperview()
        })

        self.circular = circular
    }
}
