//
//  HeaderView.swift
//  SampleCodeConstraints
//
//  Created by sakiyamaK on 2020/03/23.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class HeaderView: UIView {
  @IBOutlet private weak var firstLabel: UILabel!
  @IBOutlet private weak var secondLabel: UILabel!
  @IBOutlet private weak var textView: UITextView!

  func configure(sampleModel: SampleModel) {
    firstLabel.text = sampleModel.userName
    secondLabel.text = sampleModel.displayName
    textView.text = sampleModel.biography
  }
}
