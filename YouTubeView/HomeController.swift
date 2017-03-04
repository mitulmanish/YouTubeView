//
//  ViewController.swift
//  YouTubeView
//
//  Created by LIFX Laptop on 22/1/17.
//  Copyright © 2017 LIFX. All rights reserved.
//

import UIKit
protocol SettingsDelegate {
	func settingButtonTapped(settingsView: SettingsManagerView, view: SettingsCell)
}


class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout, SettingsDelegate {
	
	internal func settingButtonTapped(settingsView: SettingsManagerView, view: SettingsCell) {
		print(view.label.text!)
	}

    var videos: [Video] = {
        
        var channel = Channel()
        channel.name = "KanyeWestArena"
        channel.profileImageName = "kanye_profile"
        
        let blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swift - Blank Space"
        blankSpaceVideo.thumbnailImage = "taylor_swift_blank_space"
        blankSpaceVideo.numberOfViews = 67659876
        blankSpaceVideo.channel = channel
        
        let badBloodVideo = Video()
        badBloodVideo.title = "Taylor Swift - Bad Blood Featuring Kendrick Lamar"
        badBloodVideo.thumbnailImage = "taylor_swift_bad_blood"
        badBloodVideo.numberOfViews = 97654456
        badBloodVideo.channel = channel
        
        return [blankSpaceVideo, badBloodVideo]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        label.text = "Home"
        label.textColor = UIColor.white
        navigationItem.titleView = label
        setUpMenuBar()
        setUpNavigationbar()
    }
    
    let menuBar: MenuBar = {
        let menuBar = MenuBar()
        return menuBar
    }()
    
    private func setUpMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsToView(constraints: "H:|[v0]|", views: menuBar)
        view.addConstraintsToView(constraints: "V:|[v0(50)]", views: menuBar)
        
    }
    
    private func setUpNavigationbar() {
        let searchIcon = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let searchButton = UIBarButtonItem(image: searchIcon, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreIcon = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal)
        let moreButton = UIBarButtonItem(image: moreIcon, style: .plain, target: self, action: #selector(moreButtonPressed))
        navigationItem.rightBarButtonItems = [moreButton, searchButton]
    }
    
    @objc private func handleSearch() {
        print("Search Button pressed")
    }
	
	var settingsView = SettingsManagerView()
	
    @objc private func moreButtonPressed() {
		settingsView = SettingsManagerView()
		settingsView.settingsDelegate = self
		settingsView.moreButtonPressed()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        cell.video = videos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = 104.0 + ((9/16) * (view.bounds.width - 16 - 16))
        return CGSize(width: view.bounds.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

