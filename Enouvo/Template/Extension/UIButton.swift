//
//  UIButton.swift
//  Enouvo
//
//  Created by Minh Quan on 20/05/2023.
//

import UIKit

extension UIButton {
    func configImage(image: UIImage) {
        self.setImage(image, for: .normal)
        self.setImage(image, for: .highlighted)
    }
    
    func setEmptyTitle() {
        self.setTitle("", for: .normal)
        self.setTitle("", for: .selected)
    }
}
