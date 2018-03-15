//
//  NetworkService.swift
//  poloniex
//
//  Created by mac on 14/03/2018.
//  Copyright © 2018 home. All rights reserved.
//
import Alamofire
import SwiftyJSON

class NetworkService {

    static func getTickers(completion: @escaping ([ItemModel]?) -> Void) {
        let URL = APIUrls.getTickers
        
        Alamofire.request(URL).responseJSON(completionHandler: { responseData in
            guard let res = responseData.result.value else {
                completion([])
                return
            }
            let swiftyJson = JSON(res)
            var itemsAll = [ItemModel]()
            for (key, subJson):(String, JSON) in swiftyJson {
                if let item = ItemModel(withKey: key, json: subJson) {
                    itemsAll.append(item)
                }
            }
            completion(itemsAll)
        })
    }
}
