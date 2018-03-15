//
//  TickerCell.swift
//  poloniex
//
//  Created by mac on 15/03/2018.
//  Copyright © 2018 home. All rights reserved.
//

import UIKit

class TickerCell: UITableViewCell {
    private var keyLabel = UILabel()
    private var lastLabel = UILabel()
    private var highestBidLabel = UILabel()
    private var percentChangeLabel = UILabel()
    private var stackView = UIStackView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: stackView,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .top,
                                              multiplier: 1,
                                              constant: 0))
        self.addConstraint(NSLayoutConstraint(item: stackView,
                                              attribute: .bottom,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .bottom,
                                              multiplier: 1,
                                              constant: 0))
        self.addConstraint(NSLayoutConstraint(item: stackView,
                                              attribute: .leading,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .leading,
                                              multiplier: 1,
                                              constant: 0))
        self.addConstraint(NSLayoutConstraint(item: stackView,
                                              attribute: .trailing,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .trailing,
                                              multiplier: 1,
                                              constant: 0))
        
        stackView.addArrangedSubview(keyLabel)
        stackView.addArrangedSubview(lastLabel)
        stackView.addArrangedSubview(highestBidLabel)
        stackView.addArrangedSubview(percentChangeLabel)
        stackView.spacing = 3
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        keyLabel.adjustsFontSizeToFitWidth = true
        lastLabel.adjustsFontSizeToFitWidth = true
        highestBidLabel.adjustsFontSizeToFitWidth = true
        percentChangeLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupWith(key: String?, last: String?, highestBid: String?, percentChange: String?) {
        keyLabel.text = key
        lastLabel.text = last
        highestBidLabel.text = highestBid
        percentChangeLabel.text = percentChange
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
