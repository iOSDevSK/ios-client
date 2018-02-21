//
//  DashboardViewController.swift
//  genesisvision-ios
//
//  Created by George Shaginyan on 22.01.18.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class DashboardViewController: BaseViewControllerWithTableView {

    // MARK: - View Model
    var viewModel: DashboardViewModel!

    // MARK: - Variables
     @IBOutlet override var tableView: UITableView! {
        didSet {
            setupTableConfiguration()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    // MARK: - Private methods
    private func setup() {
        setupUI()
    }
    
    private func setupUI() {
        title = viewModel.title
    }
    
    private func setupTableConfiguration() {
        tableView.emptyDataSetDelegate = self
        tableView.emptyDataSetSource = self
    }
}
