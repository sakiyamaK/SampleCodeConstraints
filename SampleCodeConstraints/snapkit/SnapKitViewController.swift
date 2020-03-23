//
//  SnapKitViewController.swift
//  SampleCodeConstraints
//
//  Created by sakiyamaK on 2020/03/23.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit
import SnapKit

class SnapKitViewController: UIViewController {

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

        //これだけで四方向のedgesを親viewに合わせるになっている
        v.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
