//
//  BaseCell.swift
//  YouTubeView
//
//  Created by LIFX Laptop on 18/2/17.
//  Copyright © 2017 LIFX. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubViews() {
        
    }
}
