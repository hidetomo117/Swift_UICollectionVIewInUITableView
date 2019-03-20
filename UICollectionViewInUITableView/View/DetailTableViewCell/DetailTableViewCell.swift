//
//  CustomTableViewCell.swift
//  UICollectionViewInUITableView
//
//  Created by 益田英知 on 2019/03/16.
//  Copyright © 2019 Hidetomo Masuda. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    // MARK: - Property
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    let collectionViewNibName = "DetailCollectionViewCell"
    let collectionViewIdentifier = "DetailCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - Public method

extension DetailTableViewCell {
    
    func dispLay(withCellPattern cellPattern: CellPattern) {
    
        switch cellPattern {
        case .pattern1:
            break
        case .pattern2:
            break
        case .pattern3:
            break
        case .pattern4:
            break
        case .pattern5:
            break
        case .pattern6:
            break
        case .pattern7:
            break
        case .pattern8:
            break
        case .pattern9:
            break
        }
    }
}

// MARK: - Private method

extension DetailTableViewCell {
    
    private func setup() {
        registerCollectionViewCell()
        setupProtocol()
        setupProperty()
    }
    
    private func registerCollectionViewCell() {
        collectionView.register(UINib(nibName: collectionViewNibName, bundle: nil), forCellWithReuseIdentifier: collectionViewIdentifier)
    }
    
    private func setupProtocol() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupProperty() {
        collectionViewHeight.constant = 20
    }
}

// MARK: - UICollectionViewDataSource

extension DetailTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

// MARK: - UICollectionViewDataSource

extension DetailTableViewCell: UICollectionViewDelegateFlowLayout {
    
}
