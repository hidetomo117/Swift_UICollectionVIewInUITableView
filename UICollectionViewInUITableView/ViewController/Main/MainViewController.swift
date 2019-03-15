//
//  MainViewController.swift
//  UICollectionViewInUITableView
//
//  Created by 益田英知 on 2019/03/16.
//  Copyright © 2019 Hidetomo Masuda. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

}

extension MainViewController {
    
    private func setup() {
        registerTableViewCell()
        setupTableView()
        setupProtocol()
    }
    
    private func registerTableViewCell() {
        let nib = UINib.init(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
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

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// 932号車: 舞子のなんとかセンターで降りる
// https://mobikul.com/manage-collection-view-height-inside-the-table-view-cell-using-swift-4/

extension MainViewController: UITableViewDelegate {
    
}
