//
//  NumpadView.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 11.10.23.
//

import UIKit

protocol NumpadViewDelegate: AnyObject {
    func symbolTapped(_ symbol: NumpadView.Symbol)
}

class NumpadView: UIView {
    enum Symbol {
        case digit(Int)
        case comma
        case clear

        var value: String {
            switch self {
            case .digit(let digit):
                return "\(digit)"
            case .comma:
                return ","
            case .clear:
                return "C"
            }
        }
    }

    weak var delegate: NumpadViewDelegate?

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4.0
        stack.axis = .vertical

        return stack
    }()

    init() {
        super.init(frame: .zero)

        setUp()
        constraints()
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension NumpadView {
    func setUp() {
        addSubview(stackView)
    }

    func constraints() {
        stackView.snp.makeConstraints({ $0.edges.equalToSuperview() })
    }

    func configureLayout() {
        func createRowStackView(for symbols: [Symbol]) -> UIStackView {
            let rowStackView = UIStackView()
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = 4.0

            symbols.map({ symbol -> UIButton in
                let button = UIButton(
                    primaryAction: UIAction(
                        title: symbol.value,
                        handler: { [weak self] _ in
                            self?.delegate?.symbolTapped(symbol)
                        }
                    )
                )
                button.backgroundColor = .myButtonAndOtherColor
                button.tintColor = .myTextColor
                button.layer.cornerRadius = 8
                button.layer.masksToBounds = true
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                button.snp.makeConstraints({
                    $0.height.equalTo(button.snp.width)
                })
                return button
            })
            .forEach({
                rowStackView.addArrangedSubview($0)
            })

            return rowStackView
        }

        let symbols: [[Symbol]] = [
            [.digit(1), .digit(2), .digit(3)],
            [.digit(4), .digit(5), .digit(6)],
            [.digit(7), .digit(8), .digit(9)],
            [.digit(0), .comma, .clear],
        ]

        symbols
            .map({ (symbols: [Symbol]) -> UIStackView in
                createRowStackView(for: symbols)
            })
            .forEach({ (rowStackView: UIStackView) in
                stackView.addArrangedSubview(rowStackView)
            })
    }
}
