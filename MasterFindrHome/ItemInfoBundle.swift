//
//  ItemInfoBundle.swift
//  MasterFindrHome
//
//  Created by Eli Motycka on 6/6/15.
//  Copyright (c) 2015 ghalpern. All rights reserved.
//

import Foundation
import MapKit

class ItemInfoBundle: NSObject
{
    override init() {
        
    var latitude: Double = 41.8262
    var longitude: Double = -71.4032
    var description = [String]()
    var who: String! = "eli_motycka@brown.edu"
    let timeStamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
    }
}
