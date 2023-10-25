//
//  CategoryLabel.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 30.09.23.
//

import UIKit

protocol FinancesViewDelegate: AnyObject {

}

class FinancesView: UIView {

    weak var delegate: FinancesViewDelegate?

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually

        return stack
    }()

    init() {
        super.init(frame: .zero)

        setUp()
        constraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureFinance(with finances: Finances) {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }

        for model in finances.models {
            let label = FinanceView(statistic: model)
            stackView.addArrangedSubview(label)
        }
    }

    private func setUp() {
        addSubview(stackView)
    }

    private func constraints() {
        stackView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
    }
}
