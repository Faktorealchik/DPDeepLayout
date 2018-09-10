//
//  DLLayoutConstraint.swift
//  DeepLayout
//
//  Created by Alexandr Nesterov on 9/10/18.
//  Copyright © 2018 Alexandr Nesterov. All rights reserved.
//

import Foundation

@IBDesignable
open class DPLayoutConstraint: NSLayoutConstraint {
    
    @IBInspectable public var inch4_now: CGFloat = 0.0 {
        didSet { applyNow(size: .screen4Inch, constant: inch4_now) }
    }
    @IBInspectable public var inch4_7_now: CGFloat = 0.0 {
        didSet { applyNow(size: .screen4_7Inch, constant: inch4_7_now) }
    }
    @IBInspectable public var inch5_5_now: CGFloat = 0.0 {
        didSet { applyNow(size: .screen5_5Inch, constant: inch5_5_now) }
    }
    @IBInspectable public var inch5_8_now: CGFloat = 0.0 {
        didSet { applyNow(size: .screen5_8Inch, constant: inch5_8_now) }
    }
    
    private func applyNow(size: DPSize, constant newConstant: CGFloat) {
        if size == DPDevice.size() {
            constant = newConstant
            layoutIfNeeded()
        }
    }

    private func layoutIfNeeded() {
        self.firstItem?.layoutIfNeeded()
        self.secondItem?.layoutIfNeeded()
    }
}

