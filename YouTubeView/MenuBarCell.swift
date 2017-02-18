//
//  MenuBarCell.swift
//  YouTubeView
//
//  Created by LIFX Laptop on 18/2/17.
//  Copyright © 2017 LIFX. All rights reserved.
//

import UIKit

class MenuBarCell: BaseCell {
    
    let imageView: UIImageView = {
        let image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override var isHighlighted: Bool {
        didSet {
            print("Selected")
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            print("Selected")
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override func addSubViews() {
        super.addSubViews()
        addSubview(imageView)
        addConstraintsToView(constraints: "H:[v0(28)]", views: imageView)
        addConstraintsToView(constraints: "V:[v0(28)]", views: imageView)
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
