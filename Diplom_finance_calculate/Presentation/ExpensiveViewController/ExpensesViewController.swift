//
//  ExpensesViewController.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 12.09.23.
//

import UIKit
import SnapKit

class ExpensesViewController: UIViewController, UITableViewDelegate {

    var stillTyping = false
    var categoriesName = ""
    var dateValue = ""

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

    private lazy var labelData: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 50)
        label.textAlignment = .right
        label.textColor = .myTextColor
        label.backgroundColor = .myButtonAndOtherColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true

        return label
    }()


    private lazy var buttoneZero: UIButton = {
        let button = UIButton()
        button.setTitle("0", for: .normal)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)

        return button
    }()

    private lazy var buttonOne: UIButton = {
        let button = UIButton()
        button.setTitle("1", for: .normal)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)

        return button
    }()

    private lazy var buttonTwo: UIButton = {
        let button = UIButton()
        button.setTitle("2", for: .normal)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)

        return button
    }()

    private lazy var buttonThree: UIButton = {
        let button = UIButton()
        button.setTitle("3", for: .normal)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)

        return button
    }()

    private lazy var buttonFoure: UIButton = {
        let button = UIButton()
        button.setTitle("4", for: .normal)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)

        return button
    }()

    private lazy var buttonFive: UIButton = {
        let button = UIButton()
        button.setTitle("5", for: .normal)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)

        return button
    }()

    private lazy var buttonSix: UIButton = {
        let button = UIButton()
        button.setTitle("6", for: .normal)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)

        return button
    }()

    private lazy var buttonSeven: UIButton = {
        let button = UIButton()
        button.setTitle("7", for: .normal)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)

        return button
    }()

    private lazy var buttonEight: UIButton = {
        let button = UIButton()
        button.setTitle("8", for: .normal)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)

        return button
    }()

    private lazy var buttonNine: UIButton = {
        let button = UIButton()
        button.setTitle("9", for: .normal)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)

        return button
    }()

    private lazy var buttonRecet: UIButton = {
        let button = UIButton()
        button.setTitle("C", for: .normal)
        button.addTarget(self, action: #selector(reset), for: .touchUpInside)

        return button
    }()

    private lazy var buttonComma: UIButton = {
        let button = UIButton()
        button.setTitle(",", for: .normal)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)

        return button
    }()

    private lazy var limitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set a limit ", for: .normal)
        button.backgroundColor = .myBackgroundColor
        button.setTitleColor(.myTextColor, for: .normal)

        return button
    }()

    private lazy var calculateStack: UIStackView = {
        let cS =  UIStackView()
        cS.translatesAutoresizingMaskIntoConstraints = false

        return cS
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        [buttonOne,
         buttonTwo,
         buttonThree,
         buttonFoure,
         buttonFive,
         buttonSix,
         buttonSeven,
         buttonEight,
         buttonNine,
         buttonComma,
         buttonRecet,
         buttoneZero].forEach{button in
            button.backgroundColor = .myButtonAndOtherColor
            button.setTitleColor( .myTextColor, for: .normal)
            button.layer.cornerRadius = 10
            button.layer.masksToBounds = true
            button.titleLabel?.font = .systemFont(ofSize: 23)
            button.translatesAutoresizingMaskIntoConstraints = false
        }

        view.backgroundColor = .myBackgroundColor

        addSubviews()
        constrains()
        configure()
        configureFinanceLabel()
    }

    func addSubviews() {
        view.addSubview(labelData)
        view.addSubview(calculateStack)
        calculateStack.addSubview(buttonOne)
        calculateStack.addSubview(buttonTwo)
        calculateStack.addSubview(buttonThree)
        calculateStack.addSubview(buttonFoure)
        calculateStack.addSubview(buttonFive)
        calculateStack.addSubview(buttonSix)
        calculateStack.addSubview(buttonSeven)
        calculateStack.addSubview(buttonEight)
        calculateStack.addSubview(buttonNine)
        calculateStack.addSubview(buttoneZero)
        calculateStack.addSubview(buttonComma)
        calculateStack.addSubview(buttonRecet)
        view.addSubview(limitButton)
        view.addSubview(categoriesView)
        view.addSubview(financesView)

    }

    func constrains() {

        labelData.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.leading.equalToSuperview().inset(15)
            $0.height.equalTo(69)
        }

        calculateStack.snp.makeConstraints {
            $0.height.equalTo(215)
            $0.width.equalTo(156)
            $0.trailing.equalToSuperview().inset(15)
            $0.top.equalTo(labelData.snp.bottom).inset(-5)
        }

        buttonOne.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(50)
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }

        buttonTwo.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(50)
            $0.top.equalToSuperview()
            $0.leading.equalTo(buttonOne.snp.trailing).inset(-3)
        }

        buttonThree.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(50)
            $0.top.equalToSuperview()
            $0.leading.equalTo(buttonTwo.snp.trailing).inset(-3)
        }

        buttonFoure.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(50)
            $0.top.equalTo(buttonOne.snp.bottom).inset(-5)
            $0.leading.equalToSuperview()
        }

        buttonFive.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(50)
            $0.top.equalTo(buttonTwo.snp.bottom).inset(-5)
            $0.leading.equalTo(buttonFoure.snp.trailing).inset(-3)
        }

        buttonSix.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(50)
            $0.top.equalTo(buttonThree.snp.bottom).inset(-5)
            $0.leading.equalTo(buttonFive.snp.trailing).inset(-3)
        }

        buttonSeven.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(50)
            $0.top.equalTo(buttonFoure.snp.bottom).inset(-5)
            $0.leading.equalToSuperview()
        }

        buttonEight.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(50)
            $0.top.equalTo(buttonFive.snp.bottom).inset(-5)
            $0.leading.equalTo(buttonSeven.snp.trailing).inset(-3)
        }

        buttonNine.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(50)
            $0.top.equalTo(buttonSix.snp.bottom).inset(-5)
            $0.leading.equalTo(buttonEight.snp.trailing).inset(-3)
        }

        buttoneZero.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(50)
            $0.top.equalTo(buttonSeven.snp.bottom).inset(-5)
            $0.leading.equalToSuperview()
        }

        buttonComma.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(50)
            $0.top.equalTo(buttonEight.snp.bottom).inset(-5)
            $0.leading.equalTo(buttoneZero.snp.trailing).inset(-3)
        }

        buttonRecet.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(50)
            $0.top.equalTo(buttonNine.snp.bottom).inset(-5)
            $0.leading.equalTo(buttonComma.snp.trailing).inset(-3)
        }

        limitButton.snp.makeConstraints {
            $0.top.equalTo(calculateStack.snp.bottom).inset(-15)
            $0.centerX.equalTo(calculateStack.snp.centerX)
        }

        categoriesView.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(15)
            $0.top.equalTo(limitButton.snp.bottom).offset(15)
        }

        financesView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.top.equalTo(labelData.snp.bottom).offset(5)
        }
    }

    private func configure() {
        let models = [
            Category(text: "Food", image: UIImage(named: "boldCar")),
            Category(text: "Clothes", image: UIImage(named: "boldClothes")),
            Category(text: "Phone", image: UIImage(named: "boldPhone")),
            Category(text: "Health", image: UIImage(named: "boldHealth")),
            Category(text: "Car", image: UIImage(named: "boldCar"))
        ]
        categoriesView.configure(with: models)
    }

    private func configureFinanceLabel() {
        let models = [
            Finance(name:"Monthly limite:", text: "0"),
            Finance(name: "For spending", text: "0"),
            Finance(name: "Spent for the period:", text: "0"),
            Finance(name: "All cost:", text: "0")
        ]
        financesView.configureFinance(with: models)
    }

    @objc private func pressButton(_ button: UIButton) {
        let number = button.currentTitle!

        if stillTyping {
            if labelData.text!.count < 11 {
                labelData.text = (labelData.text ?? "") + number
            }
        } else {
            labelData.text = number
            stillTyping = true
        }
    }

    @objc private func reset(_ button: UIButton) {
        labelData.text = "0"
        stillTyping = false
    }

}

extension ExpensesViewController: CategoriesViewDelegate {
    func categoryTapped(_ category: Category) {
        categoriesName = category.text
        dateValue = labelData.text ?? ""
        stillTyping = false
    }
}

extension ExpensesViewController: FinancesViewDelegate {

}


