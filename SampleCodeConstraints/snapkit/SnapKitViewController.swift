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
    
    private let headerView: HeaderView = UINib.init(nibName: "Header", bundle: nil).instantiate(withOwner: nil, options: nil).first as! HeaderView
    @IBOutlet weak var headerContainerView: UIView! {
        didSet {
            headerContainerView.addSubview(headerView)
            //これだけで四方向のedgesを親viewに合わせるになっている
            headerView.snp.makeConstraints { $0.edges.equalToSuperview() }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
