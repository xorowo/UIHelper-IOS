//
//  Constant.swift
//  UIHelper
//
//  Created by  Work on 27.04.2023.
//

import UIKit

open class Constant {
    
    public static let shared = Constant()
    
    public var font = Font()
    
    public struct Font {
        public var regular = "CTFontRegularUsage"
        public var medium = "CTFontMediumUsage"
        public var light = "CTFontLightUsage"
        public var ultraLight = "CTFontUltraLightUsage"
        public var bold = "CTFontBoldUsage"
        public var black = "CTFontBlackUsage"
        public var semibold = "CTFontDemiUsage"
        
        public static func font(name: String?, ofSize: CGFloat) -> UIFont? {
            guard let name = name else {
                return nil
            }
            return UIFont(name: name, size: ofSize)
        }
    }
    
}
