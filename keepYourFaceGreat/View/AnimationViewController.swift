//
//  AnimationViewController.swift
//  keepYourFaceGreat
//
//  Created by Owner on 2020/12/19.
//

import UIKit
import Lottie

class AnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func startAnimation(){
        let path = Bundle.main.path(forResource: "8683-face-scanning", ofType: "json")
        let animationView = AnimationView()
        animationView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        animationView.animationSpeed = 1.0
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
    }
}
