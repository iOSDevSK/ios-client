//
//  WalletViewController.swift
//  genesisvision-ios
//
//  Created by George Shaginyan on 22.01.18.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class WalletViewController: BaseViewControllerWithTableView {

    // MARK: - Variables
    private var filtersBarButtonItem: UIBarButtonItem?
    
    // MARK: - View Model
    var viewModel: WalletControllerViewModel!
    
    // MARK: - Outlets
    @IBOutlet override var tableView: UITableView! {
        didSet {
            setupTableConfiguration()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = viewModel.title
        setupUI()
    }
    
    // MARK: - Private methods
    private func setup() {
        setupUI()
        fetch()
    }
    
    private func setupUI() {
        filtersBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "img_filters_icon"), style: .done, target: self, action: #selector(filtersButtonAction(_:)))
        filtersBarButtonItem?.tintColor = UIColor.Button.primary
        navigationItem.rightBarButtonItem = filtersBarButtonItem
    }
    
    private func setupTableConfiguration() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNibs(for: WalletControllerViewModel.cellModelsForRegistration)
        tableView.registerHeaderNib(for: WalletControllerViewModel.viewModelsForRegistration)
        
        setupPullToRefresh()
    }
    
    override func pullToRefresh() {
        super.pullToRefresh()

        fetchBalance()
        fetchTransactions()
    }

    private func reloadData() {
        refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    override func fetch() {
        showProgressHUD()
        fetchBalance()
        fetchTransactions()
    }
    
    private func fetchBalance() {
        viewModel.fetchBalance { (result) in }
    }
    
    private func fetchTransactions() {
        viewModel.fetchTransactions { [weak self] (result) in
            self?.hideHUD()
            switch result {
            case .success:
                break
            case .failure(let reason):
                print("Error with reason: ")
                print(reason ?? "")
            }
        }
    }
    
    private func fetchMoreTransactions() {
        canFetchMoreResults = false
        self.viewModel.fetchMoreTransactions { [weak self] (result) in
            self?.canFetchMoreResults = true
            switch result {
            case .success:
                break
            case .failure(let reason):
                print("Error with reason: ")
                print(reason ?? "")
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func filtersButtonAction(_ sender: UIButton) {
        viewModel.filters()
    }
}

extension WalletViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard viewModel.numberOfRows(in: indexPath.section) >= indexPath.row else {
            return
        }
        
        viewModel.showDetail(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = viewModel.model(at: indexPath) else {
            return UITableViewCell()
        }
        
        return tableView.dequeueReusableCell(withModel: model, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (viewModel.numberOfRows(in: indexPath.section) - indexPath.row) == Constants.Api.fetchThreshold && canFetchMoreResults {
            fetchMoreTransactions()
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.headerHeight(for: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let title = viewModel.headerTitle(for: section) else {
            return nil
        }
        
        let header = tableView.dequeueReusableHeaderFooterView() as DefaultTableHeaderView
        header.headerLabel.text = title
        
        return header
    }
}

extension WalletViewController: WalletProtocol {
    func didWithdrawn() {
        reloadData()
    }
}

extension WalletViewController: ReloadDataProtocol {
    func didReloadData() {
        reloadData()
    }
}

extension WalletViewController: WalletHeaderTableViewCellProtocol {
    func depositProgramDidPress() {
        viewModel.deposit()
    }
    
    func withdrawProgramDidPress() {
        viewModel.withdraw()
    }
}
