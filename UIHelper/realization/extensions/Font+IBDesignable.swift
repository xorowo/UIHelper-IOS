//
//  Font+IBDesignable.swift
//  UIHelper
//
//  Created by  Work on 27.04.2023.
//

import UIKit

public extension UITextField {
    
    @IBInspectable var isCustomFont: Bool {
        get { return false }
        set {
            guard newValue, let font = self.font else { return }
            let size = font.pointSize
            self.font = Constant.Font.font(name: font.weightName, ofSize: size)
        }
    }
}

public extension UILabel {
    
    @IBInspectable var isCustomFont: Bool {
        get { return false }
        set {
            guard newValue, let font = self.font else { return }
            let size = font.pointSize
            self.font = Constant.Font.font(name: font.weightName, ofSize: size)
        }
    }
}

public extension UITextView {
    
    @IBInspectable var isCustomFont: Bool {
        get { return false }
        set {
            guard newValue, let font = self.font else { return }
            let size = font.pointSize
            self.font = Constant.Font.font(name: font.weightName, ofSize: size)
        }
    }
    
}

public extension UIButton {
    
    @IBInspectable var isCustomFont: Bool {
        get { return false }
        set {
            guard newValue, let font = titleLabel?.font else { return }
            let size = font.pointSize
            titleLabel?.font = Constant.Font.font(name: font.weightName, ofSize: size)
        }
    }
}

public extension UIFont {
    
    static func custom_regular(_ ofSize: CGFloat) -> UIFont? {
        Constant.Font.font(name: Constant.shared.font.regular, ofSize: ofSize)
    }
    
    static func custom_medium(_ ofSize: CGFloat) -> UIFont? {
        Constant.Font.font(name: Constant.shared.font.medium, ofSize: ofSize)
    }
    
    static func custom_light(_ ofSize: CGFloat) -> UIFont? {
        Constant.Font.font(name: Constant.shared.font.light, ofSize: ofSize)
    }
    
    static func custom_ultraLight(_ ofSize: CGFloat) -> UIFont? {
        Constant.Font.font(name: Constant.shared.font.ultraLight, ofSize: ofSize)
    }
    
    static func custom_bold(_ ofSize: CGFloat) -> UIFont? {
        Constant.Font.font(name: Constant.shared.font.bold, ofSize: ofSize)
    }
    
    static func custom_black(_ ofSize: CGFloat) -> UIFont? {
        Constant.Font.font(name: Constant.shared.font.black, ofSize: ofSize)
    }
    
    static func custom_semibold(_ ofSize: CGFloat) -> UIFont? {
        Constant.Font.font(name: Constant.shared.font.semibold, ofSize: ofSize)
    }
    
    var weightName: String? {
        let key = UIFontDescriptor.AttributeName.init(rawValue: "NSCTFontUIUsageAttribute")
        guard let weightName = self.fontDescriptor.fontAttributes[key] as? String else {
            return nil
        }
        return weightName
        
    }
    
}

