//
//  ViewController.swift
//  YouTubeView
//
//  Created by LIFX Laptop on 22/1/17.
//  Copyright © 2017 LIFX. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
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

