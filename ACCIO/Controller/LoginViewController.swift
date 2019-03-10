//
//  LoginViewController.swift
//  ACCIO
//
//  Created by Sarvad shetty on 3/10/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - IBOutlets
    //login textfield
    @IBOutlet weak var loginTextFieldView: UIView!
    @IBOutlet weak var usernameTextfield: UITextField!
    //pass
    @IBOutlet weak var passwordTextFieldView: UIView!
    @IBOutlet weak var passwordTextfield: TextField!
    //LOGIN Button
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //textfield stuff
        textfieldDelegateSetup()
        textfieldViewSetup()
        loginButtonSetup()
    }
    
    //MARK: - Functions
    func loginButtonSetup(){
        loginButtonOutlet.layer.shadowColor = UIColor.init(51, 1, 54, 0.6).cgColor
        loginButtonOutlet.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        loginButtonOutlet.layer.shadowOpacity = 1.0
        loginButtonOutlet.layer.shadowRadius = 3.0
        loginButtonOutlet.layer.masksToBounds = false
        loginButtonOutlet.layer.cornerRadius = 8
    }
    
    //MARK: - IBActions
    @IBAction func loginButtonTapped(_ sender: UIButton) {
    }
    
}

//MARK: - Extensions
extension LoginViewController: UITextFieldDelegate{
    
    //MARK: - Textfield functions
    func textfieldDelegateSetup(){
        usernameTextfield.delegate = self
        passwordTextfield.delegate = self
    }
    
    func textfieldViewSetup(){
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
        loginTextFieldView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
        loginTextFieldView.layer.cornerRadius = 8
        loginTextFieldView.layer.masksToBounds = false
        loginTextFieldView.layer.shadowRadius = 3.0
        loginTextFieldView.layer.shadowColor = UIColor.init(51, 1, 54, 0.6).cgColor
        loginTextFieldView.layer.shadowOffset = CGSize(width: 0, height: 3)
        loginTextFieldView.layer.shadowOpacity = 1.0
        
        passwordTextFieldView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
        passwordTextFieldView.layer.cornerRadius = 8
        passwordTextFieldView.layer.masksToBounds = false
        passwordTextFieldView.layer.shadowRadius = 3.0
        passwordTextFieldView.layer.shadowColor = UIColor.init(51, 1, 54, 0.6).cgColor
        passwordTextFieldView.layer.shadowOffset = CGSize(width: 0, height: 3)
        passwordTextFieldView.layer.shadowOpacity = 1.0
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == usernameTextfield{
            print("user stuff here")
            //
            usernameTextfield.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
            passwordTextfield.attributedPlaceholder = NSAttributedString(string: "P A S S W O R D", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
            
            
            //animation
            UIView.animate(withDuration: 0.4) {
                self.loginTextFieldView.backgroundColor = UIColor.init(254, 130, 80, 1.0)
                self.passwordTextFieldView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
                //edits
                UIView.animate(withDuration: 0.1, animations: {
                    self.usernameTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(25, 0, 0)
                    self.passwordTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
                },completion:nil)
                
                
            }
        }else{
            print("password stuff here")
            //
            usernameTextfield.attributedPlaceholder = NSAttributedString(string: "U S E R N A M E", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
            passwordTextfield.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor:UIColor(51, 1, 54, 0.4)])
            UIView.animate(withDuration: 0.4) {
                self.passwordTextFieldView.backgroundColor = UIColor.init(254, 130, 80, 1.0)
                self.loginTextFieldView.backgroundColor = UIColor.init(238.0, 238.0, 238.0, 1.0)
                UIView.animate(withDuration: 0.1, animations: {
                    self.passwordTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(25, 0, 0)
                    self.usernameTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
                },completion:nil)
            }
        }
    }
}
