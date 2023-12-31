//
//  TopViewController.swift
//  MN5SwiftKit
//
//  Created by Mornin5 on 2023/8/17.
//

import Foundation

#if canImport(UIKit)
import UIKit

extension UIWindow {
    fileprivate class func getTopViewController(_ vc: UIViewController?) -> UIViewController? {
        if let naviC = vc as? UINavigationController {
            return UIWindow.getTopViewController(naviC.visibleViewController)
        } else if let tabC = vc as? UITabBarController {
            return UIWindow.getTopViewController(tabC.selectedViewController)
        } else if let presentC = vc?.presentedViewController {
            return UIWindow.getTopViewController(presentC)
        } else {
            return vc
        }
    }
}

extension UIWindow {
    @objc public static var key: UIWindow? {
        if #available(iOS 15, *) {
            return UIApplication.shared.connectedScenes.compactMap({$0 as? UIWindowScene}).flatMap({$0.windows}).last(where: {$0.isKeyWindow})
        } else {
            return UIApplication.shared.windows.last { $0.isKeyWindow }
        }
    }
}

extension UIApplication {
    @objc public static var topController: UIViewController? {
        get { UIWindow.getTopViewController(UIWindow.key?.rootViewController) }
    }
}

/// get the top level visible UIViewController
public protocol TopViewControllerProtocol {
    var topController: UIViewController? {get}
    static var topController: UIViewController? {get}
}

/// default implement
extension TopViewControllerProtocol {
    public var topController: UIViewController?  {get{UIApplication.topController}}
    public static var topController: UIViewController?  {get{UIApplication.topController}}
}

extension UIViewController: TopViewControllerProtocol {
    @objc public var topController: UIViewController?  {get{UIApplication.topController}}
    @objc public static var topController: UIViewController?  {get{UIApplication.topController}}
}
extension UIView: TopViewControllerProtocol {
    @objc public var topController: UIViewController?  {get{UIApplication.topController}}
    @objc public static var topController: UIViewController?  {get{UIApplication.topController}}
}

#endif


