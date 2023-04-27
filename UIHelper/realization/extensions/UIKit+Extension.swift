//
//  UIKit+Extension.swift
//  UIHelper
//
//  Created by  Work on 26.04.2023.
//

import UIKit

public extension UINib {
    
    class func nib<T>(type:T.Type) -> UINib {
        UINib(nibName: String(describing: type), bundle: nil)
    }
    
}

public extension UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        topViewController?.preferredStatusBarStyle ?? .default
    }

    override var prefersStatusBarHidden: Bool {
        visibleViewController?.prefersStatusBarHidden ?? false
    }
    
}
