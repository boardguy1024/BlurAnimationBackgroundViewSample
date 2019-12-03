//
//  ViewController.swift
//  BlurAnimationBackGroundViewSample
//
//  Created by park kyung suk on 2019/12/03.
//  Copyright © 2019 park kyung suk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let bgView1 = UIImageView(image: #imageLiteral(resourceName: "image_2"))
    let bgView2 = UIImageView(image: #imageLiteral(resourceName: "image_1"))
    let bgView3 = UIImageView(image: #imageLiteral(resourceName: "image_3"))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.insertSubview(bgView1, at: 0)
        self.view.insertSubview(bgView2, at: 0)
        self.view.insertSubview(bgView3, at: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.bgView1.frame = self.view.frame
        self.bgView2.frame = self.view.frame
        self.bgView3.frame = self.view.frame
        
        fadeOut(imageView: self.bgView1, duration: 3.5)
        fadeOut(imageView: self.bgView2, duration: 5)
    }

    private func fadeIn(imageView: UIImageView, duration: Double) {
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: {
            imageView.alpha = 1
        }) { [weak self] _ in
            self?.fadeOut(imageView: imageView, duration: duration)
        }
       
    }
    
    private func fadeOut(imageView: UIImageView, duration: Double) {
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: {
                  imageView.alpha = 0
              }) { [weak self] _ in
                  self?.fadeIn(imageView: imageView, duration: duration)
              }
    }

}

