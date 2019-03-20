//
//  CustomTableViewCell.swift
//  UICollectionViewInUITableView
//
//  Created by 益田英知 on 2019/03/16.
//  Copyright © 2019 Hidetomo Masuda. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
        
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    let collectionViewNibName = "DetailCollectionViewCell"
    let collectionViewIdentifier = "DetailCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionViewHeight.constant = 20
        collectionView.register(UINib(nibName: collectionViewNibName, bundle: nil),
                                      forCellWithReuseIdentifier: collectionViewIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - UICollectionViewDataSource

extension DetailTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewIdentifier, for: indexPath) as? DetailCollectionViewCell else {
            fatalError()
        }
        
        cell.label.text = "test"
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension DetailTableViewCell: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension DetailTableViewCell: UICollectionViewDelegateFlowLayout {
    
}
