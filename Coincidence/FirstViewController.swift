//
//  ViewController.swift
//  NamesCompApp
//
//  Created by Глеб on 20.07.2023.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var yourNameTF: UITextField!
    @IBOutlet weak var partnerNameTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVS = segue.destination as? ResultViewController else {return}
        destinationVS.firstName = yourNameTF.text
        destinationVS.secondName = partnerNameTF.text
    }

    @IBAction func resultButtonTapped() {
        guard let firstName = yourNameTF.text, let secondName = partnerNameTF.text else {return}
        if firstName.isEmpty || secondName.isEmpty {
            showAlert(
                title: "Names are missing",
                message: "Please enter both names 🧐"
            )
            return
        }
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    @IBAction func unwindSegueToFirstVC(segue: UIStoryboardSegue){
        yourNameTF.text = ""
        partnerNameTF.text = ""
        
    }
    
}

/*func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    let nextTag = textField.tag + 1
    // Try to find next responder
    let nextResponder = textField.superview?.viewWithTag(nextTag) as UIResponder?

    if nextResponder != nil {
        // Found next responder, so set it
        nextResponder?.becomeFirstResponder()
    } else {
        // Not found, so remove keyboard
        textField.resignFirstResponder()
    }

    return false
}*/

extension FirstViewController {
    private func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension FirstViewController: UITextViewDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == yourNameTF {
            partnerNameTF.becomeFirstResponder()
        } else {
            resultButtonTapped()
        }
        return true
    }
}
