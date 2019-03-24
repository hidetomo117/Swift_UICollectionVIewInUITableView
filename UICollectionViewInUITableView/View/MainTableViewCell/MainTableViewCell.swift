//
//  MainTableVIewCellTableViewCell.swift
//  UICollectionViewInUITableView
//
//  Created by 益田英知 on 2019/03/20.
//  Copyright © 2019 Hidetomo Masuda. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// セルに表示する文字を設定
    func display(with title: String) {
        label.text = title
    }
}
