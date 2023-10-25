//
//  FinanceView.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 30.09.23.
//

import UIKit

class FinanceView: UIView {

    var onTapped: ((Statistic) -> Void)?

    private lazy var financeName: UILabel = {
        let fN = UILabel()
        fN.text = statistic.type.name
        fN.textColor = .myTextColor
        fN.font = UIFont.systemFont(ofSize: 20.0)

        return fN
    }()

    private lazy var financeLabel: UILabel = {
        let fL = UILabel()
        // set formatter double as String
        fL.text = statistic.value.formattedString
        fL.textColor = .myButtonAndOtherColor
        fL.font = UIFont.systemFont(ofSize: 25.0)

        return fL
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15.0

        return stack
    }()

    private let statistic: Statistic

    init(statistic: Statistic) {
        self.statistic = statistic
        super.init(frame: .zero)

        setUp()
        constraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        addSubview(stackView)
        stackView.addArrangedSubview(financeName)
        stackView.addArrangedSubview(financeLabel)
    }

    private func constraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
