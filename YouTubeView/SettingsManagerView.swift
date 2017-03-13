//
//  SettingsManager.swift
//  YouTubeView
//
//  Created by LIFX Laptop on 3/3/17.
//  Copyright © 2017 LIFX. All rights reserved.
//

import Foundation
import UIKit

class SettingsContent {
	let name: settingCellType
	let imageName: String
	
	init(name: settingCellType, imageName: String) {
		self.name = name
		self.imageName = imageName
	}
}

enum settingCellType: String {
	case setting = "Settings"
	case termsAndCondition = "Terms and Condition"
	case sendFeedback = "Send Feedback"
	case cancel = "Cancel"
	case help = "Help"
}

class SettingsCell: BaseCell {
	
	var cellSetting: SettingsContent? = nil {
		didSet {
			label.text = cellSetting?.name.rawValue
			iconView.image = UIImage(named: (cellSetting?.imageName)!)?.withRenderingMode(.alwaysOriginal)
		}
	}
	var label: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 13)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = UIColor.lightGray
		return label
	}()
	
	let iconView: UIImageView = {
		var imageView = UIImageView()
		imageView.tintColor = UIColor.darkGray
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
	let cellHeight: CGFloat = 50.0
	
	let cellContentCollection: [SettingsContent] = {
		return [SettingsContent(name: .setting, imageName: "settings"),
		        SettingsContent(name: .termsAndCondition, imageName: "privacy"),
		        SettingsContent(name: .sendFeedback, imageName: "feedback"),
		        SettingsContent(name: .cancel,imageName: "cancel"),
		        SettingsContent(name: .help, imageName: "help")]
	}()
	
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
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SettingsCell
		cell.cellSetting = cellContentCollection[indexPath.item]
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width, height: cellHeight)
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
			let collectionViewFrameHeight: CGFloat = CGFloat(cellContentCollection.count) * cellHeight
			collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: collectionViewFrameHeight)
			let collectionViewHeight: CGFloat = collectionView.frame.height
			let yPosition: CGFloat = window.frame.height - collectionView.frame.height
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
