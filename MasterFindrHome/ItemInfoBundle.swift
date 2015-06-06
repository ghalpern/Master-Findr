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
        
        var latitude: Double{
            get {
                latitude = 41.8262
                return latitude
            }
            set(newValue) {
                latitude = newValue
            }
        }
        var longitude: Double{
            get {
                longitude = -71.4032
                return longitude
            }
            set(newValue) {
                longitude = newValue
            }
        }

    var description = [String]()
        var who: String! {
            get {
                who = nil
                return who!
            }
            set(newValue) {
                who = newValue
            }
        }
    let timeStamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
    }
}
