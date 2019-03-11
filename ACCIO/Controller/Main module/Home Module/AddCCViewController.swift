//
//  AddCCViewController.swift
//  ACCIO
//
//  Created by Sarvad shetty on 3/11/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import UIKit
import Stripe
import CreditCardForm

class AddCCViewController: UIViewController, STPPaymentCardTextFieldDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var creditCardView: CreditCardFormView!
    @IBOutlet weak var saveDetailsOutlet: UIButton!
    //back arrow
    @IBOutlet weak var backArrowView: UIImageView!
    
    //MARK: - Variables
    let paymentTextField = STPPaymentCardTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        creditCardView.cardHolderString = "Test user"
        createTextField()
        buttonSetup()
        setupGestureRecog()
    }

    //MARK: - Functions
    func setupGestureRecog(){
        //arrow
        let arrowGesture = UITapGestureRecognizer(target: self, action: #selector(self.arrowTapped))
        backArrowView.isUserInteractionEnabled = true
        backArrowView.addGestureRecognizer(arrowGesture)
    }
    func buttonSetup(){
        saveDetailsOutlet.layer.shadowColor = UIColor.init(51, 1, 54, 0.16).cgColor
        saveDetailsOutlet.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        saveDetailsOutlet.layer.shadowOpacity = 1.0
        saveDetailsOutlet.layer.shadowRadius = 3.0
        saveDetailsOutlet.layer.masksToBounds = false
        saveDetailsOutlet.layer.cornerRadius = 5
    }
    func createTextField() {
        paymentTextField.frame = CGRect(x: 15, y: 199, width: self.view.frame.size.width - 30, height: 44)
        paymentTextField.delegate = self
        paymentTextField.translatesAutoresizingMaskIntoConstraints = false
        paymentTextField.borderWidth = 0
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: paymentTextField.frame.size.height - width, width:  paymentTextField.frame.size.width, height: paymentTextField.frame.size.height)
        border.borderWidth = width
        paymentTextField.layer.addSublayer(border)
        paymentTextField.layer.masksToBounds = true
        
        view.addSubview(paymentTextField)
        
        NSLayoutConstraint.activate([
            paymentTextField.topAnchor.constraint(equalTo: creditCardView.bottomAnchor, constant: 20),
            paymentTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            paymentTextField.widthAnchor.constraint(equalToConstant: self.view.frame.size.width-20),
            paymentTextField.heightAnchor.constraint(equalToConstant: 44)
            ])
    }
    
    func paymentCardTextFieldDidChange(_ textField: STPPaymentCardTextField) {
        creditCardView.paymentCardTextFieldDidChange(cardNumber: textField.cardNumber, expirationYear: textField.expirationYear, expirationMonth: textField.expirationMonth, cvc: textField.cvc)
        
    }
    
    func paymentCardTextFieldDidEndEditingExpiration(_ textField: STPPaymentCardTextField) {
        creditCardView.paymentCardTextFieldDidEndEditingExpiration(expirationYear: textField.expirationYear)
    }
    
    func paymentCardTextFieldDidBeginEditingCVC(_ textField: STPPaymentCardTextField) {
        creditCardView.paymentCardTextFieldDidBeginEditingCVC()
    }
    
    func paymentCardTextFieldDidEndEditingCVC(_ textField: STPPaymentCardTextField) {
        creditCardView.paymentCardTextFieldDidEndEditingCVC()
        print("card no. \(textField.cardNumber)")
        print("exp year. \(textField.expirationYear)")
        print("exp month. \(textField.expirationMonth)")
        print("cvc. \(textField.cvc)")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    //MARK: - IBAction
    @IBAction func saveTapped(_ sender: UIButton) {
    }
    
    //MARK: - Gesture functions
    @objc func arrowTapped(){
        self.dismiss(animated: true, completion: nil)
    }
    

    
}
