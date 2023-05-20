//
//  BaseNavigationViewController.swift
//  Enouvo
//
//  Created by Minh Quan on 20/05/2023.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isTranslucent = false
        self.navigationBar.titleTextAttributes = (
            [
                kCTFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0),
                kCTForegroundColorAttributeName: UIColor(hex: "212723"),
                NSAttributedString.Key.foregroundColor: UIColor(hex: "212723")
            ] as! [NSAttributedString.Key: Any]
        )
        self.navigationBar.tintColor = UIColor(hex: "212723")
        self.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.backIndicatorImage = UIImage.init(named: Assets.Icon.ic_back.string())
        self.navigationBar.backIndicatorTransitionMaskImage = UIImage.init(named: Assets.Icon.ic_back.string())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

extension UINavigationController {

    public func pushViewController(viewController: UIViewController,
                                   animated: Bool,
                                   completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }

}
