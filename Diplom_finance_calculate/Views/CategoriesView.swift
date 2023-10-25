//
//  CategoriesView.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 30.09.23.
//

import UIKit

protocol CategoriesViewDelegate: AnyObject {
    func categoryTapped(_ category: Category)
}

class CategoriesView: UIView {

    weak var delegate: CategoriesViewDelegate?

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 7.0
        stack.axis = .horizontal

        return stack
    }()

    var isEnabled: Bool = true {
        didSet {
            stackView.arrangedSubviews.forEach({
                guard let category = $0 as? CategoryView else { return }
                category.isEnabled = isEnabled
            })
        }
    }

    init() {
        super.init(frame: .zero)

        setUp()
        constraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with models: [Category]) {
        for model in models {
            let button = CategoryView(category: model)
            button.onTapped = { [weak self] _ in
                self?.delegate?.categoryTapped(model)
            }
            stackView.addArrangedSubview(button)
            stackView.addArrangedSubview(UIView())
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
