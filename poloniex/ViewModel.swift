//
//  ViewModel.swift
//  poloniex
//
//  Created by mac on 15/03/2018.
//  Copyright © 2018 home. All rights reserved.
//

import Foundation
import RxSwift

class ViewModel {
    var dataSource = Variable<[ItemModel]>([])
    private var timer = Timer()

    init() {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(updateTickers), userInfo: nil, repeats: true)
        updateTickers()
    }
    
    @objc
    private func updateTickers() {
        NetworkService.getTickers(completion: { [weak self] items in
            guard let items = items else { return }
            self?.dataSource.value = items
        })
    }
}
