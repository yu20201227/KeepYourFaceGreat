//
//  RegisterViewController.swift
//  keepYourFaceGreat
//
//  Created by Owner on 2021/01/04.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    let userPassCount = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passTextField.delegate = self
        
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.cornerRadius = 5.0
        passTextField.layer.borderWidth = 1.0
        passTextField.layer.cornerRadius = 10.0
    }
    
    @IBAction func didTapRegisterButton(_ sender: UIButton) {
        if emailTextField.text != nil && passTextField.text != nil {
            if (passTextField.text?.count)! > userPassCount {
                Auth.auth().createUser(withEmail: emailTextField.text!, password: passTextField.text!) { (user, error) in
                    if error == nil {
                        Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
                            if error != nil {
                                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                                let rootViewController = storyboard.instantiateViewController(identifier: "main")
                                UIApplication.shared.keyWindow?.rootViewController = rootViewController
                            } else {
                            }
                        })
                    } else {
                        self.alert(title:"エラーが起きました", message:"ログイン失敗", actiontitle:"OK")
                    }
                }
            } else {
                self.alert(title:"エラー", message:"７文字以上です", actiontitle:"OK")
            }
        } else {
            self.alert(title:"エラー", message:"未入力の箇所があります", actiontitle:"OK")
        }
    }
    
    @IBAction func didTapAccessToLogin(_ sender: UIButton) {
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
    
    func alert(title:String, message:String, actiontitle:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actiontitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passTextField.resignFirstResponder()
    }
}
