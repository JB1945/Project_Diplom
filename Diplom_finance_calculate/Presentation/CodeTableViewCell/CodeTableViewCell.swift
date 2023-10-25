//
//  CodeTableViewCell.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 30.09.23.
//

import UIKit

class CodeTableViewCell: UITableViewCell {

    lazy var imageCategory: UIImageView = {
        let iC = UIImageView()
        iC.contentMode = .scaleAspectFit
        iC.backgroundColor = .myButtonAndOtherColor
        return iC
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()

    lazy var sumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 16.0
        stack.axis = .horizontal

        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUp()
        constraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(imageCategory)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(sumLabel)
    }

    private func constraints() {
        stackView.snp.makeConstraints({
            $0.leading.trailing.equalToSuperview().inset(16.0)
            $0.top.bottom.equalToSuperview().inset(8.0).priority(.init(999))
        })

        imageCategory.snp.makeConstraints {
            $0.height.width.equalTo(30.0).priority(.init(999))
        }

        descriptionLabel.setContentCompressionResistancePriority(.defaultHigh - 1, for: .horizontal)
        descriptionLabel.setContentHuggingPriority(.defaultLow - 1, for: .horizontal)
    }

    func configure(image: UIImage?, category: String, sum: String) {
        imageCategory.image = image
        descriptionLabel.text = category
        sumLabel.text = sum
    }
}
