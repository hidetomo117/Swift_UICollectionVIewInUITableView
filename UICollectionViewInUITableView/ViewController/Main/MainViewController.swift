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
    
    let tableViewCellNibName = "MainTableViewCell"
    let tableViewCellIdentifier = "MainTableViewCell"
    let detailViewControllerStoryboardName = "Detail"
    let detailViewControllerIdentifier = "DetailViewController"
    let model = MainModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

extension MainViewController {
    
    private func setup() {
        registerTableViewCell()
        setupProtocol()
    }
    
    private func registerTableViewCell() {
        let nib = UINib.init(nibName: tableViewCellNibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: tableViewCellIdentifier)
    }
    
    private func setupProtocol() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

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

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: detailViewControllerStoryboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: detailViewControllerIdentifier)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
