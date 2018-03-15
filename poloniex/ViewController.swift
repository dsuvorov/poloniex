//
//  ViewController.swift
//  poloniex
//
//  Created by mac on 14/03/2018.
//  Copyright © 2018 home. All rights reserved.
//
import RxCocoa
import RxSwift
import UIKit

class ViewController: UIViewController {
    fileprivate var tableView: UITableView!
    fileprivate let viewModel = ViewModel()
    fileprivate let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        createReportTable()
        bindReportTable()
    }
    
    func createReportTable() {
        tableView = UITableView()
        tableView.register(TickerCell.self, forCellReuseIdentifier: "TickerCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        view.addConstraint(NSLayoutConstraint(item: tableView,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .top,
                                              multiplier: 1,
                                              constant: 20))
        view.addConstraint(NSLayoutConstraint(item: tableView,
                                              attribute: .bottom,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .bottom,
                                              multiplier: 1,
                                              constant: 0))
        view.addConstraint(NSLayoutConstraint(item: tableView,
                                              attribute: .leading,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .leading,
                                              multiplier: 1,
                                              constant: 0))
        view.addConstraint(NSLayoutConstraint(item: tableView,
                                              attribute: .trailing,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .trailing,
                                              multiplier: 1,
                                              constant: 0))
    }
    
    func bindReportTable() {
        viewModel.dataSource.asObservable()
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items) { tableView, index, item in
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "TickerCell", for: IndexPath(row: index, section: 0)) as? TickerCell else {
                    return UITableViewCell()
                }
                cell.selectionStyle = .none
                let (key, lastStr, highestBidStr, percentChangeStr) = item.getFieldsForPrint()
                cell.setupWith(key: key, last: lastStr, highestBid: highestBidStr, percentChange: percentChangeStr)
       
                return cell
            }.disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

