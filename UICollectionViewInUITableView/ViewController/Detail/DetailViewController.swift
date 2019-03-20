//
//  DetailViewController.swift
//  UICollectionViewInUITableView
//
//  Created by 益田英知 on 2019/03/20.
//  Copyright © 2019 Hidetomo Masuda. All rights reserved.
//

import UIKit


/// DetailViewController初期値設定用プロトコル
protocol DetailViewControllerProtocol {
    func setSelectedCellPattern(with cellPattern: CellPattern)
}

final class DetailViewController: UIViewController {

    // MARK: - Property
    
    @IBOutlet weak var tableView: UITableView!
    
    let tableViewCellNibName = "DetailTableViewCell"
    let tableViewCellIdentifier = "DetailTableViewCell"
    var selectedCellPattern = CellPattern(rawValue: 0)
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

// MARK: - Private method

extension DetailViewController {
    
    /// 初期処理
    private func setup() {
        registerTableViewCell()
        setupTableView()
        setupProtocol()
    }
    
    /// UITableVIewCellの登録
    private func registerTableViewCell() {
        let nib = UINib.init(nibName: tableViewCellNibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: tableViewCellIdentifier)
    }
    
    /// tableViewの初期処理
    private func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    /// Protocolの設定
    private func setupProtocol() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as? DetailTableViewCell else {
            fatalError()
        }
 
        // 参考: https://mobikul.com/manage-collection-view-height-inside-the-table-view-cell-using-swift-4/
        cell.frame = tableView.bounds
        cell.layoutIfNeeded()
        cell.collectionView.reloadData()
        cell.collectionViewHeight.constant = cell.collectionView.collectionViewLayout.collectionViewContentSize.height
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITableViewDelegate

extension DetailViewController: UITableViewDelegate {
}

// MARK: - DetailViewControllerProtocol

extension DetailViewController: DetailViewControllerProtocol {
    
    func setSelectedCellPattern(with cellPattern: CellPattern) {
        selectedCellPattern = cellPattern
    }
}
