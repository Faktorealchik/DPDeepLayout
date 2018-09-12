//
//  DLLayoutConstraint.swift
//  DeepLayout
//
//  Created by Alexandr Nesterov on 9/10/18.
//  Copyright © 2018 Alexandr Nesterov. All rights reserved.
//

@IBDesignable
open class DPLayoutConstraint: NSLayoutConstraint {
    
    @IBInspectable public var inch4: CGFloat = 0.0 {
        didSet { applyNow(size: .screen4Inch, constant: inch4) }
    }
    @IBInspectable public var inch4_7: CGFloat = 0.0 {
        didSet { applyNow(size: .screen4_7Inch, constant: inch4_7) }
    }
    @IBInspectable public var inch5_5: CGFloat = 0.0 {
        didSet { applyNow(size: .screen5_5Inch, constant: inch5_5) }
    }
    @IBInspectable public var inch5_8: CGFloat = 0.0 {
        didSet { applyNow(size: .screen5_8Inch, constant: inch5_8) }
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
