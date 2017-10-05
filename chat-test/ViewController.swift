//
//  ViewController.swift
//  chat-test
//
//  Created by Dai Haneda on 2017/10/03.
//  Copyright © 2017年 Dai Haneda. All rights reserved.
//

import UIKit
import FirebaseCore
import Firebase
import FirebaseDatabase

class ViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var txtViewMessage: UITextView!
  @IBOutlet weak var txtName: UITextField!
  @IBOutlet weak var txtInputMessage: UITextField!

  var dbRef: DatabaseReference!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    txtInputMessage.delegate = self
    dbRef = Database.database().reference()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    let message = ["name": txtName.text!, "message": txtInputMessage.text!]
    dbRef.childByAutoId().setValue(message)
    
    textField.resignFirstResponder()
    txtInputMessage.text = ""
    return true
  }
}

