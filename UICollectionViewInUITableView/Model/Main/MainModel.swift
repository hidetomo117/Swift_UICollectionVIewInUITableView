//
//  MainModel.swift
//  UICollectionViewInUITableView
//
//  Created by 益田英知 on 2019/03/20.
//  Copyright © 2019 Hidetomo Masuda. All rights reserved.
//

import UIKit

class MainModel: NSObject {

    let patternList = ["Pattern 1",
                       "Pattern 2",
                       "Pattern 3",
                       "Pattern 4",
                       "Pattern 5",
                       "Pattern 6",
                       "Pattern 7",
                       "Pattern 8",
                       "Pattern 9"]
    
    func getPatternList() -> Array<String> {
        return patternList
    }
}
