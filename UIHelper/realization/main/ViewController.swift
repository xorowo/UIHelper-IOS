//
//  ViewController.swift
//  UIHelper
//
//  Created by  Work on 27.04.2023.
//

import UIKit

open class ViewController: UIViewController, ControllerProtocol, ControllerKeyboardProtocol {

    override open func viewWillAppear(_ animated: Bool) {
        if isHiddenNavigationBar {
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
        super.viewWillAppear(animated)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        if isHiddenNavigationBar {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
        super.viewWillDisappear(animated)
    }
    
    //MARK: Storyboard instance START
    open class func board(name: String, id: String, isPresent: Bool = false) -> ViewController {
        let vc = UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: id) as! Self
        if isPresent {
            vc.modalPresentationStyle = .overFullScreen
        }
        return vc
    }
    
    open class var instance: ViewController! {
        nil
    }
    
    open class func instance(value: Any?) -> ViewController {
        let vc = instance!
        vc.value = value
        return vc
    }
    //MARK: Storyboard instance END
    
    //MARK: ControllerProtocol START
    open var value: Any?
    open var isHiddenNavigationBar: Bool {
        false
    }
    
    public func push(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction public func dismissNav() {
        dismiss(animated: true)
    }
    
    @IBAction public func comebackNav() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction public func endEditing() {
        view.endEditing(true)
    }
    //MARK: ControllerProtocol END
    
    //MARK: ControllerKeyboardProtocol START
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint?
    var oldBottomValue: CGFloat = 0.0
    
    @objc func keyboardLoyaltyWillShow(notification: NSNotification) {
        guard let bottom = bottomConstraint else { return }
        oldBottomValue = bottom.constant
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            bottom.constant = keyboardFrame.cgRectValue.height
            view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardLoyaltyWillHide(notification: NSNotification) {
        guard let bottom = bottomConstraint else { return }
        bottom.constant = oldBottomValue
        view.layoutIfNeeded()
    }
    
    func keyboardListener() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardLoyaltyWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardLoyaltyWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //MARK: ControllerKeyboardProtocol END

}

//MARK: Default controller operation
protocol ControllerProtocol {
    
    var value: Any? { get set }
    var isHiddenNavigationBar: Bool { get }
    func push(_ vc: UIViewController)
    func dismissNav()
    func comebackNav()
    func endEditing()
    
}

//MARK: Keyboard operation
@objc protocol ControllerKeyboardProtocol {
    
    var bottomConstraint: NSLayoutConstraint? { get }
    var oldBottomValue: CGFloat { get set }
    func keyboardLoyaltyWillShow(notification: NSNotification)
    func keyboardLoyaltyWillHide(notification: NSNotification)
    func keyboardListener()
    
}
