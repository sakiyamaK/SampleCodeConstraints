//
//  DemoViewController.swift
//  SampleCodeConstraints
//
//  Created by sakiyamaK on 2020/10/02.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit
import SnapKit

//サンプルのモデルの配列
private  func createSampleModels() -> [SampleModel] {
  [SampleModel(userName: "@aaaa", displayName: "ああああ", biography: "あああああああああああああああああああああああああああああああああああああああああああ"),
   SampleModel(userName: "@bbbb", displayName: "いいいいい", biography: "いいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい")
  ]
}

final class DemoViewController: UIViewController {

  @IBOutlet private weak var topContainerView: UIView!
  @IBOutlet private weak var bottomStackView: UIStackView!


  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupTopContainerView()
    self.setupBottomStackView()
  }
}

private extension DemoViewController {

  func setupTopContainerView() {
    let sampleModels = createSampleModels()

    guard
      let headerView1: HeaderView = UINib.init(nibName: "Header", bundle: nil)
        .instantiate(withOwner: nil, options: nil).first as? HeaderView
      else { return }


    self.topContainerView.addSubview(headerView1)
    headerView1.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.5)
    }
    headerView1.configure(sampleModel: sampleModels[0])


    guard
      let headerView2: HeaderView = UINib.init(nibName: "Header", bundle: nil)
        .instantiate(withOwner: nil, options: nil).first as? HeaderView
      else { return }


    self.topContainerView.addSubview(headerView2)
    headerView2.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.trailing.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.5)
    }
    headerView2.configure(sampleModel: sampleModels[1])
  }

  //setupTopContainerViewを実践的に書くならこう
  func setupTopContainerView2() {
    let sampleModels = createSampleModels()

    guard
      let headerView1: HeaderView = UINib.init(nibName: "Header", bundle: nil)
    .instantiate(withOwner: nil, options: nil).first as? HeaderView,
      let headerView2: HeaderView = UINib.init(nibName: "Header", bundle: nil)
      .instantiate(withOwner: nil, options: nil).first as? HeaderView
      else { return }

    self.topContainerView.addSubview(headerView1)
    headerView1.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.5)
    }
    headerView1.configure(sampleModel: sampleModels[0])

    self.topContainerView.addSubview(headerView2)
    headerView2.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.trailing.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.5)
    }
    headerView2.configure(sampleModel: sampleModels[1])
  }

  //そもそも同じviewを並べるならstackviewに入れてしまう方が楽
  func setupBottomStackView() {
    let sampleModels = createSampleModels()

    for sampleModel in sampleModels {
      guard
        let headerView: HeaderView = UINib.init(nibName: "Header", bundle: nil)
          .instantiate(withOwner: nil, options: nil).first as? HeaderView else {
            continue
      }
      //stackviewの中に入れるのはaddSubviewではないので注意
      self.bottomStackView.addArrangedSubview(headerView)

      headerView.configure(sampleModel: sampleModel)
    }
  }
}
