//
//  LoadingViewable.swift
//  MGLoadingView
//
//  Created by Mustafa GUNES on 20.02.2019.
//  Copyright © 2019 Mustafa GUNES. All rights reserved.
//

import UIKit

protocol loadingViewable {
    func startAnimating()
    func stopAnimating()
}

extension loadingViewable where Self: UIViewController {
    func startAnimating() {
        let animateLoading = LoadingView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        view.addSubview(animateLoading)
        view.bringSubview(toFront: animateLoading)
        
        animateLoading.restorationIdentifier = "loadingView"
        animateLoading.center = view.center
        animateLoading.loadingViewMessage = "Loading"
        animateLoading.cornerRadius = 15
        animateLoading.clipsToBounds = true
        animateLoading.startAnimation()
    }
    
    func stopAnimating() {
        for item in view.subviews
            where item.restorationIdentifier == "loadingView" {
                UIView.animate(withDuration: 0.3, animations: {
                    item.alpha = 0
                }) { (_) in
                    item.removeFromSuperview()
                }
        }
    }
}

extension UIView {
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
}
