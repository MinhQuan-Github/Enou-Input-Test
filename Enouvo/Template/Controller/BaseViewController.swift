//
//  BaseViewController.swift
//  Enouvo
//
//  Created by Minh Quan on 20/05/2023.
//

import UIKit
import RxSwift
import KRProgressHUD

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {

    var tapToDismissKeyboardGestureRecongnizer: UITapGestureRecognizer?
    var swipeToDismissKeyboardGestureRecongnizer: UISwipeGestureRecognizer?
    let disposeBag = DisposeBag()
    var activeTextField: Any?
    var emptyLabelView: UILabel?
    
    @IBOutlet weak var backButton: UIButton? {
        willSet(newValue) {
            newValue!.setEmptyTitle()
        }
    }
    
    @IBOutlet weak var proButton: UIButton? {
        willSet(newValue) {
            newValue!.roundCorners(amount: newValue!.height / 2)
        }
    }

    var isLandscape = false
    
    // MARK: Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initAction()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func showReview() {
        let alertVC = UIAlertController.init(title: "Write A Review", message: "If you love ImageConverter app, support us a 5-star review 😊!", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction.init(title: "Write A Review", style: .default, handler: { (action) in
            UserDefaults.standard.set(true, forKey: "RATEREVIEW")
            UserDefaults.standard.synchronize()
            
            let urlApp = "itms-apps://itunes.apple.com/us/app/apple-store/" +  "6447600968" + "?mt=8"
            
            let url = URL(string: urlApp)!
            UIApplication.shared.openURL(url)
        }))
        
        alertVC.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func showLostConnection() {
        self.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to the internet")
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{action in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: "Note", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{action in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setTitle(title: TitleString, withUppercase uppercase: Bool = false) {
        self.title = uppercase ? title.string().uppercased() : title.string()
    }
    
    func setTitle(string: String, withUppercase uppercase: Bool = false) {
        self.title = uppercase ? string.uppercased() : string
    }

    func presentVC(with vc: UIViewController, modalPresentationStyle: UIModalPresentationStyle = .overFullScreen, modalTransitionStyle: UIModalTransitionStyle = .crossDissolve) {
        vc.modalTransitionStyle = modalTransitionStyle
        vc.modalPresentationStyle = modalPresentationStyle
        self.present(vc, animated: true, completion: nil)
    }
    
    func setEmptyView(tableView: UITableView!, data: [Any], text: String) {
        if data.isEmpty {
            if self.emptyLabelView == nil {
                self.setEmpty(text: text)
                tableView.addSubview(self.emptyLabelView!)
            }
        } else {
            if self.emptyLabelView != nil {
                self.emptyLabelView?.removeFromSuperview()
                self.emptyLabelView = nil
            }
        }
    }

    func setEmptyView(collectionView: UICollectionView!, data: [Any], text: String) {
        if data.isEmpty {
            if self.emptyLabelView == nil {
                self.setEmpty(text: text)
                collectionView.addSubview(self.emptyLabelView!)
            }
        } else {
            if self.emptyLabelView != nil {
                self.emptyLabelView?.removeFromSuperview()
                self.emptyLabelView = nil
            }
        }
    }
    
    @IBAction func proHandler(_ sender: UIButton) {
//        self.presentVC(with: ICTProViewController())
    }

    func initAction() {
        self.tapToDismissKeyboardGestureRecongnizer = UITapGestureRecognizer(target: self, action: #selector(self.onTapGesture(recognizer:)))
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
    }

    // MARK: Action
    @objc func onTapGesture(recognizer: UITapGestureRecognizer) {
        self.dimissKeyboard()
    }

    func onSwipeGesture(recognizer: UITapGestureRecognizer) {
        self.dimissKeyboard()
    }

    func setEmpty(text: String) {
        self.emptyLabelView = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 20))
        self.emptyLabelView?.textAlignment = .center
        self.emptyLabelView?.font = UIFont.systemFont(ofSize: 13.0)
        self.emptyLabelView?.textColor = UIColor.lightGray
        self.emptyLabelView?.text = text
    }

    // MARK: Validate location

    // MARK: Customize Navigationbar
    func addRighButton(imageName: String, method: Selector) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: imageName)?.image(color: UIColor.gray), for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        btn.addTarget(self, action: method, for: .touchUpInside)
        let item = UIBarButtonItem(customView: btn)

        self.navigationItem.setRightBarButton(item, animated: true)
        return btn
    }

    func addCenterButton(imageName: String, method: Selector) {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: imageName)?.image(color: UIColor.gray), for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        btn.addTarget(self, action: method, for: .touchUpInside)
        self.navigationItem.titleView = btn
    }

    func addRighButtons(values: [(String, Selector)]) {
        var buttons: [UIBarButtonItem]! = []
        values.forEach { (value) in
            let btn = UIButton(type: .custom)
            if value.0.contains("ic_") {
                btn.setImage(UIImage(named: value.0)?.image(color: UIColor.gray), for: .normal)
                btn.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
            } else {
                btn.setTitle(value.0, for: .normal)
                btn.backgroundColor = UIColor.appPrimaryColor
                btn.titleLabel?.textAlignment = .center
                btn.contentHorizontalAlignment = .center
                btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
                btn.setTitleColor(UIColor.white, for: .normal)
                btn.setTitleColor(UIColor.white, for: .highlighted)
                btn.frame = CGRect(x: 0, y: 0, width: 50, height: 28)
                btn.layer.cornerRadius = 5.0
            }
            btn.addTarget(self, action: value.1, for: .touchUpInside)
            let item = UIBarButtonItem(customView: btn)
            buttons.append(item)
        }
        self.navigationItem.setRightBarButtonItems(buttons, animated: true)
    }

    func addLeftButton(text: String, method: Selector) {
        let btn = UIButton(type: .custom)
        btn.setTitle(text, for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.contentHorizontalAlignment = .center
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.white, for: .highlighted)
        btn.frame = CGRect(x: 0, y: 0, width: 50, height: 28)
        btn.addTarget(self, action: method, for: .touchUpInside)
        btn.backgroundColor = UIColor.appPrimaryColor
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 5.0
        let item = UIBarButtonItem(customView: btn)

        self.navigationItem.setLeftBarButton(item, animated: true)
    }

    func addRighButton(text: String, method: Selector, color: UIColor = UIColor.white, width: CGFloat = 50) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setTitle(text, for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.contentHorizontalAlignment = .center
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.setTitleColor(color, for: .normal)
        btn.setTitleColor(color, for: .highlighted)
        btn.frame = CGRect(x: 0, y: 0, width: width, height: 28)
        btn.addTarget(self, action: method, for: .touchUpInside)
        btn.backgroundColor = UIColor.appPrimaryColor
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 5.0
        let item = UIBarButtonItem(customView: btn)
        self.navigationItem.setRightBarButton(item, animated: true)
        return btn
    }

    func addRighCenterButton(text: String, method: Selector, color: UIColor = UIColor.appPrimaryColor) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setTitle(text, for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.contentHorizontalAlignment = .center
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.setTitleColor(color, for: .normal)
        btn.setTitleColor(color, for: .highlighted)
        btn.frame = CGRect(x: 10, y: 0, width: 60, height: 28)
        btn.addTarget(self, action: method, for: .touchUpInside)
        btn.backgroundColor = UIColor.white
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 14
        let item = UIBarButtonItem(customView: btn)
        self.navigationItem.setRightBarButton(item, animated: true)
        return btn
    }

    func addLeftButton(imageName: String, method: Selector) {
        self.navigationItem.setLeftBarButton(nil, animated: false)
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        btn.addTarget(self, action: method, for: .touchUpInside)
        
        let suggestButtonContainer = UIView(frame: btn.frame)
       
        let image = UIImageView(image: UIImage(named: imageName)?.image(color: UIColor.gray))
        image.frame = btn.frame
        image.contentMode = .left
        image.transform = CGAffineTransform(translationX: -4, y: 0)
        
        suggestButtonContainer.addSubview(image)
        suggestButtonContainer.addSubview(btn)
        
        let item = UIBarButtonItem(customView: suggestButtonContainer)
//        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.setLeftBarButton(item, animated: true)
    }

    func presentSubscription() {
        let subscriptionViewController = UIViewController()
        let navigationController = BaseNavigationViewController(rootViewController: subscriptionViewController)
        navigationController.navigationBar.isHidden = true
        navigationController.modalPresentationStyle = .overFullScreen
        navigationController.modalTransitionStyle = .crossDissolve
        
        self.present(navigationController, animated: true, completion: nil)
    }
    
    // MARK: Keyboard Action
    func dimissKeyboard () {
        self.view.endEditing(true)
//        self.pushResetView()
    }
    
    @IBAction func backAction() {
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func isIPad() -> Bool {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return false
        case .pad:
            return true
        default:
            return false
        }
    }

    func getHeightSafeArea() -> CGFloat {
        var bottomSafeArea: CGFloat = 0.0

        let window = UIApplication.shared.keyWindow
        
        if #available(iOS 11.0, *) {
            bottomSafeArea = window?.safeAreaInsets.top ?? 0
        } else {
            bottomSafeArea = bottomLayoutGuide.length
        }
        
        return bottomSafeArea
    }


    func showAlert(message: String, completion: @escaping () -> Void) {
        let alert = UIAlertController(title: "Notification", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{action in
            self.dismiss(animated: true, completion: {
                completion()
            })
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: Loading View
    func showLoadingView() {
        KRProgressHUD.show()
    }

    func hideLoadingView() {
        KRProgressHUD.dismiss()
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        switch UIDevice.current.orientation {
        case .portrait:
            self.isLandscape = false
        case .portraitUpsideDown:
            self.isLandscape = false
        case .landscapeLeft:
            self.isLandscape = true
        case .landscapeRight:
            self.isLandscape = true
        default:
            self.isLandscape = false
        }
    }
}

extension UIViewController {
    func reloadViewFromNib() {
        let parent = view.superview
        view.removeFromSuperview()
        view = nil
        parent?.addSubview(view) // This line causes the view to be reloaded
    }
}
