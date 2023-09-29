//
//  ExpensesViewController.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 12.09.23.
//

import UIKit
import SnapKit

class ExpensesViewController: UIViewController {

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

        private lazy var monthlyLimit: UILabel = {
            let label = UILabel()
            label.text = "Monthly limit:"

            return label
        }()

        private lazy var monthlyLimitData: UILabel = {
            let label = UILabel()
            label.text = "0"

            return label
        }()

        private lazy var forSpending: UILabel = {
            let label = UILabel()
            label.text = "For spending:"

            return label
        }()

        private lazy var forSpendingData: UILabel = {
            let label = UILabel()
            label.text = "0"

            return label
        }()

        private lazy var spentForPeriod: UILabel = {
            let label = UILabel()
            label.text = "Spent for the period:"

            return label
        }()

        private lazy var spentForPeriodData: UILabel = {
            let label = UILabel()
            label.text = "0"

            return label
        }()

        private lazy var allCosts: UILabel = {
            let label = UILabel()
            label.text = "All costs:"

            return label
        }()

        private lazy var allCostsData: UILabel = {
            let label = UILabel()
            label.text = "0"

            return label
        }()

        private lazy var buttoneZero: UIButton = {
            let button = UIButton()
            button.setTitle("0", for: .normal)

            return button
        }()

        private lazy var buttonOne: UIButton = {
            let button = UIButton()
            button.setTitle("1", for: .normal)

            return button
        }()

        private lazy var buttonTwo: UIButton = {
            let button = UIButton()
            button.setTitle("2", for: .normal)

            return button
        }()

        private lazy var buttonThree: UIButton = {
            let button = UIButton()
            button.setTitle("3", for: .normal)

            return button
        }()

        private lazy var buttonFoure: UIButton = {
            let button = UIButton()
            button.setTitle("4", for: .normal)

            return button
        }()

        private lazy var buttonFive: UIButton = {
            let button = UIButton()
            button.setTitle("5", for: .normal)

            return button
        }()

        private lazy var buttonSix: UIButton = {
            let button = UIButton()
            button.setTitle("6", for: .normal)

            return button
        }()

        private lazy var buttonSeven: UIButton = {
            let button = UIButton()
            button.setTitle("7", for: .normal)

            return button
        }()

        private lazy var buttonEight: UIButton = {
            let button = UIButton()
            button.setTitle("8", for: .normal)

            return button
        }()

        private lazy var buttonNine: UIButton = {
            let button = UIButton()
            button.setTitle("9", for: .normal)

            return button
        }()

        private lazy var buttonRecet: UIButton = {
            let button = UIButton()
            button.setTitle("C", for: .normal)

            return button
        }()

        private lazy var buttonComma: UIButton = {
            let button = UIButton()
            button.setTitle(",", for: .normal)

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

    private lazy var labelStack: UIStackView = {
        let lS = UIStackView()

        return lS
    }()

    private lazy var labelAndImageStack: UIStackView = {
        let liS = UIStackView()

        return liS
    }()

    private lazy var foodLabel: UILabel = {
        let fL = UILabel()
        fL.text = "Food"
        fL.textColor = .myButtonAndOtherColor

        return fL
    }()

    private lazy var cloathesLabel: UILabel = {
        let cL = UILabel()
        cL.text = "Clothes"
        cL.textColor = .myButtonAndOtherColor

        return cL
    }()

    private lazy var phoneLabel: UILabel = {
        let pL = UILabel()
        pL.text = "Phone"
        pL.textColor = .myButtonAndOtherColor

        return pL
    }()

    private lazy var leisureLabel: UILabel = {
        let lL = UILabel()
        lL.text = "Leisure"
        lL.textColor = .myButtonAndOtherColor

        return lL
    }()

    private lazy var healthLabel: UILabel = {
        let hL = UILabel()
        hL.text = "Health"
        hL.textColor = .myButtonAndOtherColor

        return hL
    }()

    private lazy var transportLabel: UILabel = {
        let tL = UILabel()
        tL.text = "Car"
        tL.textColor = .myButtonAndOtherColor

        return tL
    }()

    private lazy var foodImage: UIImageView = {
        let fI = UIImageView()
        fI.image = UIImage(named: "boldFood")
        fI.backgroundColor = .myButtonAndOtherColor
        fI.layer.cornerRadius = 8

        return fI
    }()

    private lazy var clothesImage: UIImageView = {
        let cI = UIImageView()
        cI.image = UIImage(named: "boldClothes")
        cI.backgroundColor = .myButtonAndOtherColor
        cI.layer.cornerRadius = 8

        return cI
    }()

    private lazy var phoneImage: UIImageView = {
        let pI = UIImageView()
        pI.image = UIImage(named: "boldPhone")
        pI.backgroundColor = .myButtonAndOtherColor
        pI.layer.cornerRadius = 8

        return pI
    }()

    private lazy var leisureImage: UIImageView = {
        let lI = UIImageView()
        lI.image = UIImage(named: "boldLeisure")
        lI.backgroundColor = .myButtonAndOtherColor
        lI.tintColor = .myButtonAndOtherColor
        lI.layer.cornerRadius = 8

        return lI
    }()

    private lazy var healthImage: UIImageView = {
        let hI = UIImageView()
        hI.image = UIImage(named: "boldHealth")
        hI.backgroundColor = .myButtonAndOtherColor
        hI.layer.cornerRadius = 8

        return hI
    }()

    private lazy var transportImage: UIImageView = {
        let tI = UIImageView()
        tI.image = UIImage(named: "boldCar")
        tI.backgroundColor = .myButtonAndOtherColor
        tI.layer.cornerRadius = 8

        return tI
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

            [allCostsData,
             spentForPeriodData,
             forSpendingData,
             monthlyLimitData].forEach { label in
                label.textColor = .myButtonAndOtherColor
                label.font = UIFont.systemFont(ofSize: 35)
                label.translatesAutoresizingMaskIntoConstraints = false
            }

            [allCosts,
             spentForPeriod,
             forSpending,
             monthlyLimit].forEach { label in
                label.font = UIFont.systemFont(ofSize: 23)
                label.textColor = .myTextColor
            }

            view.backgroundColor = .myBackgroundColor
            configure()
        }

        func configure() {

            view.addSubview(labelData)
            labelData.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide)
                $0.trailing.leading.equalToSuperview().inset(15)
                $0.height.equalTo(69)
            }

            view.addSubview(calculateStack)
            calculateStack.snp.makeConstraints {
                $0.height.equalTo(215)
                $0.width.equalTo(156)
                $0.trailing.equalToSuperview().inset(15)
                $0.top.equalTo(labelData.snp.bottom).inset(-5)
            }

            calculateStack.addSubview(buttonOne)
            buttonOne.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.width.equalTo(50)
                $0.top.equalToSuperview()
                $0.leading.equalToSuperview()
            }

            calculateStack.addSubview(buttonTwo)
            buttonTwo.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.width.equalTo(50)
                $0.top.equalToSuperview()
                $0.leading.equalTo(buttonOne.snp.trailing).inset(-3)
            }

            calculateStack.addSubview(buttonThree)
            buttonThree.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.width.equalTo(50)
                $0.top.equalToSuperview()
                $0.leading.equalTo(buttonTwo.snp.trailing).inset(-3)
            }

            calculateStack.addSubview(buttonFoure)
            buttonFoure.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.width.equalTo(50)
                $0.top.equalTo(buttonOne.snp.bottom).inset(-5)
                $0.leading.equalToSuperview()
            }

            calculateStack.addSubview(buttonFive)
            buttonFive.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.width.equalTo(50)
                $0.top.equalTo(buttonTwo.snp.bottom).inset(-5)
                $0.leading.equalTo(buttonFoure.snp.trailing).inset(-3)
            }

            calculateStack.addSubview(buttonSix)
            buttonSix.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.width.equalTo(50)
                $0.top.equalTo(buttonThree.snp.bottom).inset(-5)
                $0.leading.equalTo(buttonFive.snp.trailing).inset(-3)
            }

            calculateStack.addSubview(buttonSeven)
            buttonSeven.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.width.equalTo(50)
                $0.top.equalTo(buttonFoure.snp.bottom).inset(-5)
                $0.leading.equalToSuperview()
            }

            calculateStack.addSubview(buttonEight)
            buttonEight.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.width.equalTo(50)
                $0.top.equalTo(buttonFive.snp.bottom).inset(-5)
                $0.leading.equalTo(buttonSeven.snp.trailing).inset(-3)
            }

            calculateStack.addSubview(buttonNine)
            buttonNine.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.width.equalTo(50)
                $0.top.equalTo(buttonSix.snp.bottom).inset(-5)
                $0.leading.equalTo(buttonEight.snp.trailing).inset(-3)
            }

            calculateStack.addSubview(buttoneZero)
            buttoneZero.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.width.equalTo(50)
                $0.top.equalTo(buttonSeven.snp.bottom).inset(-5)
                $0.leading.equalToSuperview()
            }

            calculateStack.addSubview(buttonComma)
            buttonComma.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.width.equalTo(50)
                $0.top.equalTo(buttonEight.snp.bottom).inset(-5)
                $0.leading.equalTo(buttoneZero.snp.trailing).inset(-3)
            }

            calculateStack.addSubview(buttonRecet)
            buttonRecet.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.width.equalTo(50)
                $0.top.equalTo(buttonNine.snp.bottom).inset(-5)
                $0.leading.equalTo(buttonComma.snp.trailing).inset(-3)
            }

            view.addSubview(limitButton)
            limitButton.snp.makeConstraints {
                $0.top.equalTo(calculateStack.snp.bottom).inset(-15)
                $0.centerX.equalTo(calculateStack.snp.centerX)
            }

            view.addSubview(labelStack)
            labelStack.snp.makeConstraints {
                $0.top.equalTo(labelData.snp.bottom).inset(-3)
                $0.leading.equalTo(15)
                $0.height.equalTo(300)
                $0.width.equalTo(225)
            }

            labelStack.addSubview(monthlyLimit)
            monthlyLimit.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.leading.equalToSuperview()
                $0.height.equalTo(37)
            }

            labelStack.addSubview(monthlyLimitData)
            monthlyLimitData.snp.makeConstraints {
                $0.top.equalTo(monthlyLimit.snp.bottom).inset(-1)
                $0.leading.equalToSuperview()
                $0.height.equalTo(37)
            }

            labelStack.addSubview(forSpending)
            forSpending.snp.makeConstraints {
                $0.top.equalTo(monthlyLimitData.snp.bottom).inset(-1)
                $0.leading.equalToSuperview()
                $0.height.equalTo(37)
            }

            labelStack.addSubview(forSpendingData)
            forSpendingData.snp.makeConstraints {
                $0.top.equalTo(forSpending.snp.bottom).inset(-1)
                $0.leading.equalToSuperview()
                $0.height.equalTo(37)
            }

            labelStack.addSubview(spentForPeriod)
            spentForPeriod.snp.makeConstraints {
                $0.top.equalTo(forSpendingData.snp.bottom).inset(-1)
                $0.leading.equalToSuperview()
                $0.height.equalTo(37)
            }

            labelStack.addSubview(spentForPeriodData)
            spentForPeriodData.snp.makeConstraints {
                $0.top.equalTo(spentForPeriod.snp.bottom).inset(-1)
                $0.leading.equalToSuperview()
                $0.height.equalTo(37)
            }

            labelStack.addSubview(allCosts)
            allCosts.snp.makeConstraints {
                $0.top.equalTo(spentForPeriodData.snp.bottom).inset(-1)
                $0.leading.equalToSuperview()
                $0.height.equalTo(37)
            }

            labelStack.addSubview(allCostsData)
            allCostsData.snp.makeConstraints {
                $0.top.equalTo(allCosts.snp.bottom).inset(-1)
                $0.leading.equalToSuperview()
                $0.height.equalTo(37)
            }

            view.addSubview(labelAndImageStack)
            labelAndImageStack.snp.makeConstraints {
                $0.top.equalTo(labelStack.snp.bottom).inset(-15)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(70)
            }

            labelAndImageStack.addSubview(foodImage)
            foodImage.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.top.equalToSuperview().inset(-1)
                $0.width.equalTo(50)
                $0.leading.equalToSuperview().inset(15)
            }

            labelAndImageStack.addSubview(clothesImage)
            clothesImage.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.top.equalToSuperview().inset(-1)
                $0.width.equalTo(50)
                $0.leading.equalTo(foodImage.snp.trailing).inset(-17)
            }

            labelAndImageStack.addSubview(phoneImage)
            phoneImage.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.top.equalToSuperview().inset(-1)
                $0.width.equalTo(50)
                $0.leading.equalTo(clothesImage.snp.trailing).inset(-17)
            }

            labelAndImageStack.addSubview(leisureImage)
            leisureImage.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.top.equalToSuperview().inset(-1)
                $0.width.equalTo(50)
                $0.leading.equalTo(phoneImage.snp.trailing).inset(-17)
            }

            labelAndImageStack.addSubview(healthImage)
            healthImage.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.top.equalToSuperview().inset(-1)
                $0.width.equalTo(50)
                $0.leading.equalTo(leisureImage.snp.trailing).inset(-17)
            }

            labelAndImageStack.addSubview(transportImage)
            transportImage.snp.makeConstraints {
                $0.height.equalTo(50)
                $0.top.equalToSuperview().inset(-1)
                $0.width.equalTo(50)
                $0.trailing.equalToSuperview().inset(15)
            }

            labelAndImageStack.addSubview(foodLabel)
            foodLabel.snp.makeConstraints {
                $0.top.equalTo(foodImage.snp.bottom).inset(-1)
                $0.centerX.equalTo(foodImage.snp.centerX)
            }

            labelAndImageStack.addSubview(cloathesLabel)
            cloathesLabel.snp.makeConstraints {
                $0.top.equalTo(clothesImage.snp.bottom).inset(-1)
                $0.centerX.equalTo(clothesImage.snp.centerX)
            }

            labelAndImageStack.addSubview(phoneLabel)
            phoneLabel.snp.makeConstraints {
                $0.top.equalTo(phoneImage.snp.bottom).inset(-1)
                $0.centerX.equalTo(phoneImage.snp.centerX)
            }

            labelAndImageStack.addSubview(leisureLabel)
            leisureLabel.snp.makeConstraints {
                $0.top.equalTo(leisureImage.snp.bottom).inset(-1)
                $0.centerX.equalTo(leisureImage.snp.centerX)
            }

            labelAndImageStack.addSubview(healthLabel)
            healthLabel.snp.makeConstraints {
                $0.top.equalTo(healthImage.snp.bottom).inset(-1)
                $0.centerX.equalTo(healthImage.snp.centerX)
            }

            labelAndImageStack.addSubview(transportLabel)
            transportLabel.snp.makeConstraints {
                $0.top.equalTo(transportImage.snp.bottom).inset(-1)
                $0.centerX.equalTo(transportImage.snp.centerX)
            }

        }
    }

