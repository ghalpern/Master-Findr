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
    lazy var latitude = Double()
    lazy var longitude = Double()
    lazy var who = String()
    
    
    override init() {
    var description = [String]()
    let timeStamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
    }
}
