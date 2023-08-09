//
//  SecondViewController.swift
//  CallBackClosures
//
//  Created by Kumaran on 09/08/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var saveDataButton: UIButton!
    
    var callBack: ((String) -> Void)?
    var data: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if data != nil {
            dataTextField.text = data
        }
    }
    
    @IBAction func saveDataButtonTapped(_ sender: UIButton) {
        guard let dataString = dataTextField?.text else { return }
        callBack?(dataString)
        navigationController?.popViewController(animated: true)
    }
}
