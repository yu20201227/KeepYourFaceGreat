//
//  ViewController.swift
//  keepYourFaceGreat
//
//  Created by Owner on 2020/12/06.
//

import UIKit
import Lottie

class OpeningViewController: UIViewController {
    
    let animationView = AnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()

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

