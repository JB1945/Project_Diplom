//
//  File.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 12.09.23.
//

import UIKit

protocol HomeController: AnyObject {
    func forSpendingUpdated(_ value: String)
    func imageLoaded(_ image: UIImage?)
}

class HomeViewController: UIViewController {

    let presenter: HomePresenter

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 15.0

        return stack
    }()

    private lazy var stackBalance: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5.0

        return stack
    }()

    private lazy var photoSlot: UIImageView = {
        let ps = UIImageView(image: UIImage(systemName: "person.crop.circle.fill.badge.plus"))
        ps.layer.cornerRadius = 35
        ps.layer.masksToBounds = true
        ps.translatesAutoresizingMaskIntoConstraints = false
        ps.tintColor = .myBackgroundColor
        ps.backgroundColor = .myButtonAndOtherColor
        ps.contentMode = .scaleAspectFit
        let gesture = UITapGestureRecognizer(target: self, action: #selector(buttonSheet))
        ps.isUserInteractionEnabled = true
        ps.addGestureRecognizer(gesture)

        return ps
    }()

    @objc private func buttonSheet() {
        let button = ImagePicker()
        button.onSelectImage = { [weak self] image in
            self?.imageLoaded(image)
        }
        self.present(button, animated: true)
    }

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30,
                                       weight: .bold)
        label.text = Date().dateString
        label.textColor = .myTextColor

        return label
    }()

    private lazy var balance: UILabel = {
        let label = UILabel()
        label.text = "For spending:".locolizable()
        label.textColor = .myTextColor
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)

        return label
    }()

    private lazy var balanceData: UILabel = {
        let label = UILabel()
        label.textColor = .myButtonAndOtherColor
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)

        return label
    }()

    init(presenter: HomePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .myBackgroundColor
        setUp()
        constants()

        presenter.viewDidLoad()
    }
}

extension HomeViewController: HomeController {
    func imageLoaded(_ image: UIImage?) {
        photoSlot.image = image
    }

    func forSpendingUpdated(_ value: String) {
        balance.text = "For spending:".locolizable() + " \(value)"
    }
}

private extension HomeViewController {
    func setUp() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(photoSlot)
        view.addSubview(stackBalance)
        stackBalance.addArrangedSubview(balance)
        stackBalance.addArrangedSubview(balanceData)

    }

    func constants() {
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }

        photoSlot.snp.makeConstraints {
            $0.height.width.equalTo(70.0)
        }

        stackBalance.snp.makeConstraints {
            $0.centerX.centerY.equalTo(self.view)
        }
    }
}

