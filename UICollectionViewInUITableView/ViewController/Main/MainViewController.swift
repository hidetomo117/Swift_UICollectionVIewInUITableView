//
//  MainViewController.swift
//  UICollectionViewInUITableView
//
//  Created by 益田英知 on 2019/03/16.
//  Copyright © 2019 Hidetomo Masuda. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Proprty
    
    @IBOutlet weak var tableView: UITableView!
    
    let tableViewCellNibName = "MainTableViewCell"
    let tableViewCellIdentifier = "MainTableViewCell"
    let detailViewControllerStoryboardName = "Detail"
    let detailViewControllerIdentifier = "DetailViewController"
    let model = MainModel()

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

// MARK: - Private method

extension MainViewController {
    
    /// 初期処理
    private func setup() {
        registerTableViewCell()
        setupProtocol()
    }
    
    /// UITableViewCellの登録
    private func registerTableViewCell() {
        let nib = UINib.init(nibName: tableViewCellNibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: tableViewCellIdentifier)
    }
    
    /// Protocolの設定
    private func setupProtocol() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getPatternList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as? MainTableViewCell else {
            fatalError()
        }

        cell.display(with: model.getPatternList()[indexPath.row])

        return cell
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let selectedCellPattern = CellPattern(rawValue: indexPath.row) else {
            fatalError()
        }

        let storyboard = UIStoryboard(name: detailViewControllerStoryboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: detailViewControllerIdentifier) as! DetailViewController
        vc.setSelectedCellPattern(with: selectedCellPattern)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
