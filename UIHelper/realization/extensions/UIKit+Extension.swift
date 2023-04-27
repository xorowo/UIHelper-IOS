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

//MARK: Storyboard instance
public extension ViewController {
    
    class func board(name: String, id: String, isPresent: Bool = false) -> ViewController {
        let vc = UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: id) as! Self
        if isPresent {
            vc.modalPresentationStyle = .overFullScreen
        }
        return vc
    }

    class var instance: ViewController! {
        nil
    }

    class func instance(value: Any?) -> ViewController {
        let vc = instance!
        vc.value = value
        return vc
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
