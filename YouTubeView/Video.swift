//
//  Video.swift
//  YouTubeView
//
//  Created by LIFX Laptop on 25/2/17.
//  Copyright © 2017 LIFX. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var title: String?
    var thumbnailImage: String?
    var uploadDate: NSDate?
    var numberOfViews: NSNumber?
    var channel: Channel?
    
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
