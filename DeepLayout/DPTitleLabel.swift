//
//  DPTitleLabel.swift
//  DeepLayout
//
//  Created by Alexandr Nesterov on 9/11/18.
//  Copyright © 2018 Alexandr Nesterov. All rights reserved.
//

@IBDesignable
open class DPTitleLabel: UILabel {
    
    @IBInspectable public var inch4: CGFloat = 0.0 {
        didSet { applyNow(size: .screen4Inch, newSize: inch4) }
    }
    @IBInspectable public var inch4_7: CGFloat = 0.0 {
        didSet { applyNow(size: .screen4_7Inch, newSize: inch4_7) }
    }
    @IBInspectable public var inch5_5: CGFloat = 0.0 {
        didSet { applyNow(size: .screen5_5Inch, newSize: inch5_5) }
    }
    @IBInspectable public var inch5_8: CGFloat = 0.0 {
        didSet { applyNow(size: .screen5_8Inch, newSize: inch5_8) }
    }
    
    private func applyNow(size: DPSize, newSize: CGFloat) {
        if size == DPDevice.size() {
            font = UIFont(name: font.fontName, size: newSize)
            layoutIfNeeded()
        }
    }
}

