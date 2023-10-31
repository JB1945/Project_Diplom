//
//  ExpensesViewController.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 12.09.23.
//

import UIKit
import SnapKit

protocol ExpensiveController: AnyObject {
    func dataSourceDidUpdated()

    func updateFinances(_ finances: Finances)
    func canSpendMoney(_ value: Bool)
}

class ExpensesViewController: UIViewController {

    let presenter: ExpensivePresenter

    private lazy var headerView: HeaderView = {
        let view = HeaderView()
        view.delegate = self
        return view
    }()

    let profileInfoCellReuseIdentifier = "profileInfoCellReuseIdentifier"

    private lazy var tableView: UITableView = {
        let cT = UITableView()
        cT.delegate = self
        cT.dataSource = self
        cT.register(CodeTableViewCell.self, forCellReuseIdentifier: profileInfoCellReuseIdentifier)
        cT.tableFooterView = UIView()
        cT.backgroundColor = .myBackgroundColor
        return cT
    }()

    init(presenter: ExpensivePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .myBackgroundColor

        addSubviews()
        constrains()
        configure()

        presenter.viewDidLoad()
    }
}

// MARK: - ExpensiveController

extension ExpensesViewController: ExpensiveController {
    func dataSourceDidUpdated() {
        tableView.reloadData()
    }

    func updateFinances(_ finances: Finances) {
        headerView.configureFinances(finances)
    }

    func canSpendMoney(_ value: Bool) {
        headerView.canSpendMoney(value)
    }
}

private extension ExpensesViewController {
    func addSubviews() {
        view.addSubview(headerView)
        view.addSubview(tableView)
    }

    func constrains() {
        headerView.snp.makeConstraints({
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        })

        tableView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(8.0)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    func configure() {
        headerView.configureCategories(presenter.categories)
    }
}

extension ExpensesViewController: HeaderViewDelegate {
    func madeExpense(_ model: DataSourceModel) {
        presenter.madeExpense(model)
    }

    func setlimit() {
        let alertController = UIAlertController(title: "Estabished limite:".localizable(), message: "Enter the amount and number of days".localizable(), preferredStyle: .alert)
        let alertInstall = UIAlertAction(title: "Establish".localizable(), style: .default) { action in
            let tfSum = alertController.textFields?[0].text
            let tfDay = alertController.textFields?[1].text

            guard
                let tfSum = tfSum.flatMap({ Double($0) }),
                let tfDay = tfDay.flatMap({ Int($0) }) else {
                return
            }

            self.presenter.setStatistic(period: tfDay, limit: tfSum)
        }

        alertController.addTextField { money in
            money.placeholder = "Summ".localizable()
            money.keyboardType = .asciiCapableNumberPad

        }
        alertController.addTextField { day in
            day.placeholder = "Number of days".localizable()
            day.keyboardType = .asciiCapableNumberPad

        }

        let alertCancel = UIAlertAction(title: "Cancel".localizable(), style: .cancel) { _ in }

        alertController.addAction(alertInstall)
        alertController.addAction(alertCancel)

        present(alertController, animated: true, completion: nil)
    }

    func updateValue(_ value: String) {
        presenter.enteredValue(value)
    }
}

extension ExpensesViewController:
    UITableViewDelegate,
    UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: profileInfoCellReuseIdentifier, for: indexPath) as? CodeTableViewCell else {
            return UITableViewCell()
        }
        let model = presenter.dataSource[indexPath.row]
        cell.configure(image: model.category.image, category: model.category.text, sum: String(model.sum))
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(
            style: .destructive,
            title: "Delete".localizable()
        ) { [weak self] _, _, complete in
            self?.presenter.removeRow(at: indexPath)
            self?.tableView.deleteRows(at: [indexPath], with: .automatic)
            complete(false)
        }

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
}
