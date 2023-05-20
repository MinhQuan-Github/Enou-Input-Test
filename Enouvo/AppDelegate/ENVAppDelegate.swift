//
//  AppDelegate.swift
//  Enouvo
//
//  Created by Minh Quan on 19/05/2023.
//

import UIKit
import IQKeyboardManagerSwift

@main
class ENVAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.configLib()
        self.switchRootViewController(viewController: BaseNavigationViewController(rootViewController: ENVHomeViewController()), animated: true, completion: nil)
        self.window?.makeKeyAndVisible()
        return true
    }

    func configLib() {
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.overrideKeyboardAppearance = true
        IQKeyboardManager.shared.keyboardAppearance = .light
        IQKeyboardManager.shared.enable = true
    }

    func switchRootViewController(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        let appDelegate = UIApplication.shared.delegate as! ENVAppDelegate
        if animated == true {
            UIView.transition(with: (appDelegate.window)!, duration: 0.3, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
                appDelegate.window?.rootViewController = viewController
            }, completion: { _ in
                completion?()
            })
        } else {
            appDelegate.window?.rootViewController = viewController
        }
        appDelegate.window?.makeKeyAndVisible()
    }
    
//    func switchToTabbar() {
//        self.tabbarViewController = BaseTabbarController()
//        let navigationController = BaseNavigationViewController(rootViewController: self.tabbarViewController!)
//        navigationController.navigationBar.isHidden = true
//        self.switchRootViewController(viewController: navigationController, animated: true, completion: nil)
//    }
}

