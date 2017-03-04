//
//  SettingsManager.swift
//  YouTubeView
//
//  Created by LIFX Laptop on 3/3/17.
//  Copyright © 2017 LIFX. All rights reserved.
//

import Foundation
import UIKit

class SettingsManagerView: NSObject {
	
	var collectionView: UICollectionView!
	var backgroundView: UIView?
	
	override init() {
		super.init()
		backgroundView = UIView()
		let layout = UICollectionViewFlowLayout()
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.backgroundColor = UIColor.orange
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc func moreButtonPressed() {
		if let window = UIApplication.shared.keyWindow {
			guard let backgroundView = self.backgroundView else {
				return
			}
			backgroundView.frame = window.frame
			backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
			backgroundView.alpha = 0.0
			backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
			window.addSubview(backgroundView)
			collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 250)
			let collectionViewHeight: CGFloat = 200
			let yPosition: CGFloat = window.frame.height - collectionViewHeight
			window.addSubview(collectionView)
			
			
			UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
				self.backgroundView?.alpha = 1
				self.collectionView.frame = CGRect(x: 0, y: yPosition, width: self.collectionView.frame.width, height: collectionViewHeight)

			}, completion: nil)
			
		}
	}
	
	@objc func handleDismiss() {
		UIView.animate(withDuration: 0.5) { 
			self.backgroundView?.alpha = 0
			if let window = UIApplication.shared.keyWindow {
				self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
			}
			
		}
		
		
	}
	
}
