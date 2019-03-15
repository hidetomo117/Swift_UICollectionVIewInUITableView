//
//  CustomTableViewCell.swift
//  UICollectionViewInUITableView
//
//  Created by 益田英知 on 2019/03/16.
//  Copyright © 2019 Hidetomo Masuda. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var customCollectionView: UICollectionView!
    @IBOutlet weak var customCollectionViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customCollectionViewHeight.constant = 20
        customCollectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil),
                                      forCellWithReuseIdentifier: "CustomCollectionViewCell")
        customCollectionView.delegate = self
        customCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - UICollectionViewDataSource

extension CustomTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.label.text = "test"
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CustomTableViewCell: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension CustomTableViewCell: UICollectionViewDelegateFlowLayout {
    
}
