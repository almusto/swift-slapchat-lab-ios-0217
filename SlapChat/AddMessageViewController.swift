//
//  AddMessageViewController.swift
//  SlapChat
//
//  Created by Alessandro Musto on 3/15/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class AddMessageViewController: UIViewController {

  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var saveButton: UIButton!

  let store = DataStore.sharedInstance


    override func viewDidLoad() {
        super.viewDidLoad()

    }


    
  @IBAction func onSave(_ sender: UIButton) {
    if let text = textField.text {
      let date = NSDate()
      store.storeMessage(content: text, date: date)
    }
  }



}
