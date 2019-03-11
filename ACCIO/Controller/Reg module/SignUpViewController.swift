//
//  SignUpViewController.swift
//  ACCIO
//
//  Created by Sarvad shetty on 3/10/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    //MARK: - IBOutlets
    //email part
    @IBOutlet weak var emailTextView: UIView!
    @IBOutlet weak var emailTextField: TextField!
    //username part
    @IBOutlet weak var usernameTextView: UIView!
    @IBOutlet weak var usernameTextfield: TextField!
    //password part
    @IBOutlet weak var passwordTextView: UIView!
    @IBOutlet weak var passwordTextfield: TextField!
    //sign up button
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    
    //othrs
    @IBOutlet weak var loginViewOutlet: UIImageView!
    
    //MARK: - Variables
    var userUID:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textfield
        observeNotification()
        textfieldDelegateSetup()
        textfieldViewSetup()
        setupButtonSetup()
        setupTapGesture()

    }
    
    //MARK: - IBAction
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        if usernameTextfield.text != "" && passwordTextfield.text != "" && emailTextField.text != ""{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextfield.text!) { (user, error) in
                if error != nil{
                    let alert = UIAlertController(title: "Alert", message: "Error registering user", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }else{
                    if let user = user{
                        self.userUID = user.user.uid
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }else{
            let alert = UIAlertController(title: "Alert", message: "Fill in all the fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Re-Enter", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: - Functions
    func setupButtonSetup(){
        signUpButtonOutlet.layer.shadowColor = UIColor.init(51, 1, 54, 0.6).cgColor
        signUpButtonOutlet.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        signUpButtonOutlet.layer.shadowOpacity = 1.0
        signUpButtonOutlet.layer.shadowRadius = 3.0
        signUpButtonOutlet.layer.masksToBounds = false
        signUpButtonOutlet.layer.cornerRadius = 8
    }
    
    func setupTapGesture(){
        let logViewGesture = UITapGestureRecognizer(target: self, action: #selector(self.loginViewTapped))
        loginViewOutlet.isUserInteractionEnabled = true
        loginViewOutlet.addGestureRecognizer(logViewGesture)
    }
    
    //MARK: - Gesture functions
    @objc func loginViewTapped(){
        self.dismiss(animated: true, completion: nil)
    }
}

extension SignUpViewController: UITextFieldDelegate{
    
    //MARK: - Textfield functions
    func textfieldDelegateSetup(){
        emailTextField.delegate = self
        usernameTextfield.delegate = self
        passwordTextfield.delegate = self
    }
    
    func textfieldViewSetup(){
        //for email
        emailTextField.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
        let imageView3 = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView3.contentMode = .scaleAspectFill
        let image3 = UIImage(named: "email")
        imageView3.image = image3
        emailTextField.leftView = imageView3
        emailTextField.leftViewMode = .always
        emailTextField.layoutIfNeeded()
        emailTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        emailTextField.attributedPlaceholder = NSAttributedString(string: "E M A I L  A D D R E S S", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
        emailTextField.layer.cornerRadius = 8
        emailTextField.layer.masksToBounds = false
        //for spacing
        emailTextField.defaultTextAttributes.updateValue(2.0, forKey: NSAttributedString.Key.kern)
        
        //for username textfield
        usernameTextfield.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 23.81, height: 25.36))
        let image = UIImage(named: "profile")
        imageView.image = image
        usernameTextfield.leftView = imageView
        usernameTextfield.leftViewMode = .always
        usernameTextfield.layoutIfNeeded()
        usernameTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        usernameTextfield.attributedPlaceholder = NSAttributedString(string: "U S E R N A M E", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
        usernameTextfield.layer.cornerRadius = 8
        usernameTextfield.layer.masksToBounds = false
        //for spacing
        usernameTextfield.defaultTextAttributes.updateValue(2.0, forKey: NSAttributedString.Key.kern)
        
        //password
        passwordTextfield.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
        let imageView2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        imageView2.contentMode = .scaleAspectFill
        let image2 = UIImage(named: "password")
        imageView2.image = image2
        passwordTextfield.leftView = imageView2
        passwordTextfield.leftViewMode = .always
        passwordTextfield.layoutIfNeeded()
        //to move image 10 pts
        passwordTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        passwordTextfield.attributedPlaceholder = NSAttributedString(string: "P A S S W O R D", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
        passwordTextfield.layer.cornerRadius = 8
        passwordTextfield.layer.masksToBounds = false
        passwordTextfield.defaultTextAttributes.updateValue(2.0, forKey: NSAttributedString.Key.kern)
                
        //corner radius for all view
        usernameTextView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
        usernameTextView.layer.cornerRadius = 8
        usernameTextView.layer.masksToBounds = false
        usernameTextView.layer.shadowRadius = 3.0
        usernameTextView.layer.shadowColor = UIColor.init(51, 1, 54, 0.6).cgColor
        usernameTextView.layer.shadowOffset = CGSize(width: 0, height: 3)
        usernameTextView.layer.shadowOpacity = 1.0
        
        emailTextView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
        emailTextView.layer.cornerRadius = 8
        emailTextView.layer.masksToBounds = false
        emailTextView.layer.shadowRadius = 3.0
        emailTextView.layer.shadowColor = UIColor.init(51, 1, 54, 0.6).cgColor
        emailTextView.layer.shadowOffset = CGSize(width: 0, height: 3)
        emailTextView.layer.shadowOpacity = 1.0
        
        passwordTextView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
        passwordTextView.layer.cornerRadius = 8
        passwordTextView.layer.masksToBounds = false
        passwordTextView.layer.shadowRadius = 3.0
        passwordTextView.layer.shadowColor = UIColor.init(51, 1, 54, 0.6).cgColor
        passwordTextView.layer.shadowOffset = CGSize(width: 0, height: 3)
        passwordTextView.layer.shadowOpacity = 1.0
        
    }

    
    //MARK: - Textfield notification properties
    func observeNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardShow(){
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: -170, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
        
    }
    @objc func keyboardWillHide(){
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == usernameTextfield{
            print("user stuff here")
            //
            usernameTextfield.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
            passwordTextfield.attributedPlaceholder = NSAttributedString(string: "P A S S W O R D", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
            emailTextField.attributedPlaceholder = NSAttributedString(string: "E M A I L  A D D R E S S", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
            //animation
            UIView.animate(withDuration: 0.4) {
                self.usernameTextView.backgroundColor = UIColor.init(254, 130, 80, 1.0)
                self.passwordTextView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
                self.emailTextView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
                //edits
                UIView.animate(withDuration: 0.1, animations: {
                    self.usernameTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(25, 0, 0)
                    self.passwordTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
                    self.emailTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
                },completion:nil)
                
                
            }
        }else if textField == passwordTextfield{
            print("password stuff here")
            //not selected
            usernameTextfield.attributedPlaceholder = NSAttributedString(string: "U S E R N A M E", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
            emailTextField.attributedPlaceholder = NSAttributedString(string: "E M A I L  A D D R E S S", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
            //selected
            passwordTextfield.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
            //animation
            UIView.animate(withDuration: 0.4) {
                //selected
                self.passwordTextView.backgroundColor = UIColor.init(254, 130, 80, 1.0)
                //not selected
                self.usernameTextView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
                self.emailTextView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
                UIView.animate(withDuration: 0.1, animations: {
                    //selected
                    self.passwordTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(25, 0, 0)
                    //not selected
                    self.usernameTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
                    self.emailTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
                },completion:nil)
            }
        }else if textField == emailTextField{
            print("email stuff")
            //not selected
            usernameTextfield.attributedPlaceholder = NSAttributedString(string: "U S E R N A M E", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
            passwordTextfield.attributedPlaceholder = NSAttributedString(string: "P A S S W O R D", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
            //selected
            emailTextField.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
            //animation
            UIView.animate(withDuration: 0.4) {
                //selected
                self.emailTextView.backgroundColor = UIColor.init(254, 130, 80, 1.0)
                //not selected
                self.usernameTextView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
                self.passwordTextView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
                UIView.animate(withDuration: 0.1, animations: {
                    //selected
                    self.emailTextField.layer.sublayerTransform = CATransform3DMakeTranslation(25, 0, 0)
                    //not selected
                    self.usernameTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
                    self.passwordTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
                },completion:nil)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField{
            emailTextField.resignFirstResponder()
            usernameTextfield.becomeFirstResponder()
            emailTextView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
            if emailTextField.text == ""{
                emailTextField.attributedPlaceholder = NSAttributedString(string: "E M A I L  A D D R E S S", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
                self.emailTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
            }
            
        }else if textField == usernameTextfield{
            usernameTextfield.resignFirstResponder()
            passwordTextfield.becomeFirstResponder()
            usernameTextView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
            if usernameTextfield.text == ""{
                usernameTextfield.attributedPlaceholder = NSAttributedString(string: "U S E R N A M E", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
                self.usernameTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
            }
        }else{
            passwordTextView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
            if passwordTextfield.text == ""{
                passwordTextfield.attributedPlaceholder = NSAttributedString(string: "P A S S W O R D", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
                self.passwordTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
            }
            textField.resignFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
        usernameTextView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
        self.usernameTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        passwordTextView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
        self.passwordTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        emailTextView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
        self.emailTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        
        if usernameTextfield.text == ""{
            print("here 1")
            usernameTextfield.attributedPlaceholder = NSAttributedString(string: "U S E R N A M E", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
        }
        if passwordTextfield.text == ""{
            print("herer")
            passwordTextfield.attributedPlaceholder = NSAttributedString(string: "P A S S W O R D", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
        }
        if emailTextField.text == ""{
            emailTextField.attributedPlaceholder = NSAttributedString(string: "E M A I L  A D D R E S S", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
        }
    }

}
