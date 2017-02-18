//
//  Extensions.swift
//  YouTubeView
//
//  Created by LIFX Laptop on 12/2/17.
//  Copyright © 2017 LIFX. All rights reserved.
//

import UIKit


extension UIColor {
    class func rgb(red: Float, green: Float, blue: Float) -> UIColor {
        return UIColor(colorLiteralRed: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
}
extension UIView {
    func addConstraintsToView(constraints: String, views: UIView...) {
        var viewDictionary: [String: UIView] = [:]
        for (index,view) in views.enumerated() {
            viewDictionary["v\(index)"] = view
        }
        let constraint = NSLayoutConstraint.constraints(withVisualFormat: constraints, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary)
        addConstraints(constraint)
    }
}

