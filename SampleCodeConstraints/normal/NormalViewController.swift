//
//  NormalViewController.swift
//  SampleCodeConstraints
//
//  Created by sakiyamaK on 2020/03/23.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

class NormalViewController: UIViewController {
    
    private let headerView: HeaderView = UINib(nibName: "Header", bundle: nil).instantiate(withOwner: nil, options: nil).first as! HeaderView
    
    @IBOutlet weak var headerContainerView: UIView! {
        didSet {
                                    
            headerContainerView.addSubview(headerView)
            
            //AutoLayout以前に使われてたレイアウトの仕組みをAutoLayoutの制約に変換するかどうかを設定するフラグ
            //デフォはtrueになってて、余計な制約が付いてバグるためfalseにする必要がある(なんでAppleはこんなことしたのか
            headerView.translatesAutoresizingMaskIntoConstraints = false
            
            //制約をつける
            headerView.topAnchor.constraint(equalTo: headerContainerView.topAnchor).isActive = true
            headerView.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor).isActive = true
            headerView.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor).isActive = true
            headerView.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor).isActive = true
            
            //こうやって制約をまとめて、最後にactiveにもできる
//            let constraints: [NSLayoutConstraint] = [
//                headerView.topAnchor.constraint(equalTo: headerContainerView.topAnchor),
//                headerView.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor),
//                headerView.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor),
//                headerView.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor)
//            ]
//
//            NSLayoutConstraint.activate(constraints)
            
//            NSLayoutConstraint.activate([
//                headerView.topAnchor.constraint(equalTo: headerContainerView.topAnchor),
//                headerView.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor),
//                headerView.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor),
//                headerView.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor)
//            ])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
