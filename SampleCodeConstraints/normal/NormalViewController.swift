//
//  NormalViewController.swift
//  SampleCodeConstraints
//
//  Created by sakiyamaK on 2020/03/23.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

class NormalViewController: UIViewController {

    @IBOutlet weak var headerBGView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
    }

    private func setupView() {

        guard let v = UINib.init(nibName: "Header", bundle: nil).instantiate(withOwner: nil, options: nil).first as? HeaderView else {
            return
        }

        headerBGView.addSubview(v)

        //AutoLayout以前に使われてたレイアウトの仕組みをAutoLayoutの制約に変換するかどうかを設定するフラグ
        //デフォはtrueになってて、余計な制約が付いてバグるためfalseにする必要がある(なんでAppleはこんなことしたのか
        v.translatesAutoresizingMaskIntoConstraints = false

        //制約をつける
        v.topAnchor.constraint(equalTo: headerBGView.topAnchor).isActive = true
        v.leadingAnchor.constraint(equalTo: headerBGView.leadingAnchor).isActive = true
        v.trailingAnchor.constraint(equalTo: headerBGView.trailingAnchor).isActive = true
        v.bottomAnchor.constraint(equalTo: headerBGView.bottomAnchor).isActive = true

        //こうやって制約をまとめて、最後にactiveにもできる
//        let constraints = [
//            v.topAnchor.constraint(equalTo: headerBGView.topAnchor),
//            v.leadingAnchor.constraint(equalTo: headerBGView.leadingAnchor),
//            v.trailingAnchor.constraint(equalTo: headerBGView.trailingAnchor),
//            v.bottomAnchor.constraint(equalTo: headerBGView.bottomAnchor)
//        ]
//        NSLayoutConstraint.activate(constraints)

    }
}
