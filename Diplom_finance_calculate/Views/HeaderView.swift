//
//  HeaderView.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 11.10.23.
//

import UIKit

protocol HeaderViewDelegate: AnyObject {
    func updateValue(_ value: String)
    func madeExpense(_ model: DataSourceModel)
    func setlimit()
}

class HeaderView: UIView {

    private enum Constant {
        static let zero = "0"
    }

    weak var delegate: HeaderViewDelegate?

    private var currentValue: String = Constant.zero {
        didSet {
            labelData.text = currentValue
            delegate?.updateValue(currentValue)
        }
    }

    private lazy var containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4.0
        stack.axis = .vertical

        return stack
    }()

    private lazy var categoriesView: CategoriesView = {
        let view = CategoriesView()
        view.delegate = self

        return view
    }()

    private lazy var financesView: FinancesView = {
        let view = FinancesView()
        view.delegate = self

        return view
    }()

    private lazy var numpadView: NumpadView = {
        let view = NumpadView()
        view.delegate = self

        return view
    }()

    private lazy var labelData: UILabel = {
        let label = UILabel()
        label.text = currentValue
        label.font = UIFont.systemFont(ofSize: 50)
        label.textAlignment = .right
        label.textColor = .myTextColor
        label.backgroundColor = .myButtonAndOtherColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true

        return label
    }()

    private lazy var limitButton: UIButton = {
        let button = UIButton(
            primaryAction: UIAction(title: "Set a limit".localizable(), handler: { [weak self] _ in
                self?.delegate?.setlimit()
                self?.currentValue = Constant.zero
            })
        )
        button.backgroundColor = .myButtonAndOtherColor
        button.setTitleColor(.myTextColor, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true

        return button
    }()

    init() {
        super.init(frame: .zero)
        setUp()
        constraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView {
    func configureCategories(_ categories: [Category]) {
        categoriesView.configure(with: categories)
    }

    func configureFinances(_ finances: Finances) {
        financesView.configureFinance(with: finances)
    }

    func canSpendMoney(_ value: Bool) {
        categoriesView.isEnabled = value
    }
}

private extension HeaderView {
    func setUp() {
        addSubview(containerStackView)

        containerStackView.addArrangedSubview(labelData)

        let numpadStackView = UIStackView(
            arrangedSubviews: [
                numpadView,
                limitButton,
                UIView()
            ]
        )
        numpadStackView.axis = .vertical
        numpadStackView.spacing = 8.0

        let centerStackView = UIStackView(
            arrangedSubviews: [
                financesView,
                numpadStackView,
            ]
        )
        centerStackView.axis = .horizontal
        centerStackView.spacing = 4.0

        containerStackView.addArrangedSubview(centerStackView)
        containerStackView.addArrangedSubview(categoriesView)
    }

    func constraints() {
        containerStackView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })

        numpadView.snp.makeConstraints({
            $0.width.equalTo(150.0)
        })
    }
}

extension HeaderView: CategoriesViewDelegate {
    func categoryTapped(_ category: Category) {
        guard
            currentValue != Constant.zero,
            let value = Double(currentValue) else { return }
        let model = DataSourceModel(category: category, sum: value)
        delegate?.madeExpense(model)

        currentValue = Constant.zero
    }
}

extension HeaderView: FinancesViewDelegate {

}

extension HeaderView: NumpadViewDelegate {
    func symbolTapped(_ symbol: NumpadView.Symbol) {
        switch symbol {
        case .digit(let value):
            guard currentValue.count < 12 else { return }

            if currentValue == Constant.zero {
                currentValue = ""
            }
            currentValue += String(value)
        case .comma:
            currentValue += "."
        case .clear:
            currentValue = Constant.zero
        }
    }
}
