//
//  SettingsManager.swift
//  YouTubeView
//
//  Created by LIFX Laptop on 3/3/17.
//  Copyright © 2017 LIFX. All rights reserved.
//

import Foundation
import UIKit


class SettingsCell: BaseCell {
	
	let label: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 13)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Try this out"
		label.textColor = UIColor.lightGray
		return label
	}()
	
	let iconView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "settings")
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	
	
	override func addSubViews() {
		super.addSubViews()
		
		addSubview(label)
		addSubview(iconView)
		
		addConstraintsToView(constraints: "H:|-5-[v0(30)]-10-[v1]|", views: iconView, label)
		addConstraintsToView(constraints: "V:|[v0]|", views: label)
		addConstraintsToView(constraints: "V:[v0(30)]", views: iconView)

		addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: label, attribute: .centerY, multiplier: 1, constant: 0))
	}
}


class SettingsManagerView: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	var collectionView: UICollectionView!
	var backgroundView: UIView?
	var settingsDelegate: SettingsDelegate? = nil
	
	override init() {
		super.init()
		backgroundView = UIView()
		let layout = UICollectionViewFlowLayout()
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.register(SettingsCell.self, forCellWithReuseIdentifier: "cell")
		collectionView.backgroundColor = UIColor.white
		collectionView.delegate = self
		collectionView.dataSource = self
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width, height: 50)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let cell = collectionView.cellForItem(at: indexPath) as! SettingsCell
		settingsDelegate?.settingButtonTapped(settingsView: self, view: cell)
		handleDismiss()
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
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0.0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0.0
	}
	
}
