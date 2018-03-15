//
//  ItemModel.swift
//  poloniex
//
//  Created by mac on 14/03/2018.
//  Copyright © 2018 home. All rights reserved.
//

import Foundation
import SwiftyJSON

class ItemModel {
    var key: String?
    var id: Int?
    var last: Double = 0
    var lowestAsk: Double = 0
    var highestBid: Double = 0
    var percentChange: Double = 0
    var baseVolume: Double = 0
    var quoteVolume: Double = 0
    var isFrozen: Bool? = false
    var high24hr: Double = 0
    var low24hr: Double = 0

    required init?(withKey: String, json: JSON) {
        guard
            !withKey.isEmpty,
            let id = json["id"].int
            else { return nil }
            
        key = withKey
        self.id = id
        last = json["last"].doubleValue
        lowestAsk = json["lowestAsk"].doubleValue
        highestBid = json["highestBid"].doubleValue
        percentChange = json["percentChange"].doubleValue
        baseVolume = json["baseVolume"].doubleValue
        quoteVolume = json["quoteVolume"].doubleValue
        isFrozen = json["isFrozen"].boolValue
        high24hr = json["high24hr"].doubleValue
        low24hr = json["low24hr"].doubleValue
    }
    
    func getFieldsForPrint() -> (String?, String?, String?, String?) { // (key, lastStr, highestBidStr, percentChangeStr)
        var lastStr: String?
        if last != 0 {
            lastStr = String(format: "%.8f", last)
        }
        
        var highestBidStr: String?
        if highestBid != 0 {
            highestBidStr = String(format: "%f.8", highestBid)
        }
        
        var percentChangeStr: String?
        if percentChange != 0 {
            percentChangeStr = String(format: "%f.8", percentChange)
        }
        return (key, lastStr, highestBidStr, percentChangeStr)
    }
}
