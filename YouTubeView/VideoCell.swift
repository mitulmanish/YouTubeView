//
//  VideoCell.swift
//  YouTubeView
//
//  Created by LIFX Laptop on 12/2/17.
//  Copyright © 2017 LIFX. All rights reserved.
//

import UIKit

class VideoCell: BaseCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "taylor_swift_blank_space")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "taylor_swift_profile")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    var seperator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(hue: 230/255, saturation: 230/255, brightness: 230/255, alpha: 1.0)
        return view
    }()
    
    
    var labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.cyan
        return label
    }()
    
    var descriptionView: UITextView = {
        let description = UITextView()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.backgroundColor = UIColor.brown
        return description
    }()
    
    override func addSubViews() {
        addSubview(thumbnailImageView)
        addSubview(profileImageView)
        addSubview(seperator)
        addSubview(labelView)
        addSubview(descriptionView)
        
        addConstraintsToView(constraints: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsToView(constraints: "H:|-16-[v0(44)]", views: profileImageView)
        addConstraintsToView(constraints: "V:|-16-[v0]-8-[v1(44)]-36-[v2(1)]|", views: thumbnailImageView, profileImageView, seperator)
        addConstraintsToView(constraints: "H:|[v0]|", views: seperator)
        
        //constraints for label view
        addConstraints(
            [NSLayoutConstraint(item: labelView, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1.0, constant: 8.0), NSLayoutConstraint(item: labelView, attribute: .left, relatedBy: .equal, toItem: profileImageView, attribute: .right, multiplier: 1.0, constant: 8.0),
             NSLayoutConstraint(item: labelView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right , multiplier: 1.0, constant: 0), NSLayoutConstraint(item: labelView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 44)
            ])
        
        // constranits for description view
        
        addConstraints([NSLayoutConstraint(item: descriptionView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30),
                        NSLayoutConstraint(item: descriptionView, attribute: .top, relatedBy: .equal, toItem: labelView, attribute: .bottom, multiplier: 1, constant: 4.0),
                        NSLayoutConstraint(item: descriptionView, attribute: .left, relatedBy: .equal, toItem: profileImageView, attribute: .right, multiplier: 1, constant: 8.0),
                        NSLayoutConstraint(item: descriptionView, attribute: .right, relatedBy: .equal, toItem: labelView, attribute: .right, multiplier: 1, constant: 0)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } 
}
