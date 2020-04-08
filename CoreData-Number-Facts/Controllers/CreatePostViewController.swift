//
//  CreatePostViewController.swift
//  CoreData-Number-Facts
//
//  Created by Alex Paul on 4/8/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class CreatePostViewController: UITableViewController {
  
  @IBOutlet weak var postTitleTextField: UITextField!
  @IBOutlet weak var numberFactTextField: UITextField!
  @IBOutlet weak var pickerView: UIPickerView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configurePickerView()
  }
  
  private func configurePickerView() {
    pickerView.dataSource = self
    pickerView.delegate = self
  }
  
  @IBAction func submitButtonPressed(_ sender: UIButton) {
    
  }
}

extension CreatePostViewController: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return 10
  }
}

extension CreatePostViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return "Title"
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    // code here
  }
}
