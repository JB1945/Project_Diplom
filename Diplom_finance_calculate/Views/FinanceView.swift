//
//  FinanceView.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 30.09.23.
//

import UIKit

class FinanceView: UIView {

    var onTapped: ((Finance) -> Void)?

    private lazy var financeName: UILabel = {
        let fN = UILabel()
        fN.text = finance.name
        fN.textColor = .myTextColor
        fN.font = UIFont.systemFont(ofSize: 20.0)

        return fN
    }()

    private lazy var financeLabel: UILabel = {
        let fL = UILabel()
        fL.text = finance.text
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

    private let finance: Finance

    init(finance: Finance) {
        self.finance = finance
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

        financeLabel.snp.makeConstraints {
            $0.top.equalTo(financeName.snp.bottom).offset(3)
        }
    }
}
