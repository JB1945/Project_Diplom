//
//  CategoryButton.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 30.09.23.
//

import UIKit

class CategoryView: UIView {

    var onTapped: ((Category) -> Void)?

    var isEnabled: Bool = true {
        didSet {
            tapRecognizer.isEnabled = isEnabled
            categoryLabel.isEnabled = isEnabled
            categoryImageView.alpha = isEnabled ? 1.0 : 0.7
        }
    }

    private lazy var categoryLabel: UILabel = {
        let cL = UILabel()
        cL.text = category.text
        cL.textAlignment = .center
        cL.textColor = .myTextColor
        cL.font = UIFont.systemFont(ofSize: 14.0)

        return cL
    }()

    private lazy var categoryImageView: UIImageView = {
        let cI = UIImageView()
        cI.image = category.image
        cI.backgroundColor = .myButtonAndOtherColor
        cI.layer.cornerRadius = 8

        return cI
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical

        return stack
    }()

    private lazy var tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))

    private let category: Category

    init(category: Category) {
        self.category = category
        super.init(frame: .zero)

        setUp()
        constraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        addSubview(stackView)
        stackView.addArrangedSubview(categoryImageView)
        stackView.addArrangedSubview(categoryLabel)

        addGestureRecognizer(tapRecognizer)
    }

    private func constraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        categoryImageView.snp.makeConstraints({
            $0.width.equalTo(categoryImageView.snp.height)
        })
    }

    @objc private func tapped(_ sender: UITapGestureRecognizer) {
        onTapped?(category)
    }
}
