//
//  DetailViewController.swift
//  UICollectionViewInUITableView
//
//  Created by 益田英知 on 2019/03/20.
//  Copyright © 2019 Hidetomo Masuda. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let tableViewCellNibName = "DetailTableViewCell"
    let tableViewCellIdentifier = "DetailTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

extension DetailViewController {
    
    private func setup() {
        registerTableViewCell()
        setupTableView()
        setupProtocol()
    }
    
    private func registerTableViewCell() {
        let nib = UINib.init(nibName: tableViewCellNibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: tableViewCellIdentifier)
    }
    
    private func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    private func setupProtocol() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// https://mobikul.com/manage-collection-view-height-inside-the-table-view-cell-using-swift-4/

extension DetailViewController: UITableViewDelegate {
    
}
