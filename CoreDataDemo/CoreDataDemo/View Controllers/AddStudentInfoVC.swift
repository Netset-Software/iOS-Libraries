//
//  AddStudentInfoVC.swift
//  CoreDataDemo
//
//  Created by netset on 20/08/21.
//

import UIKit

class AddStudentInfoVC: UIViewController {

    
    @IBOutlet weak var txtFldName: CustomTextField!
    @IBOutlet weak var txtFldAge: CustomTextField!
    @IBOutlet weak var txtFldRoll: CustomTextField!
    @IBOutlet weak var btnSave: UIButton!
    
    
    var isFromEdit = false
    var info: Students?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    
    @IBAction func changed(_ sender: UITextField) {
        
        if isFromEdit {
            btnSave.alpha = (txtFldName.isEmpty  || txtFldAge.isEmpty)  ? 0.5 : 1
            btnSave.isUserInteractionEnabled = (txtFldName.isEmpty  || txtFldAge.isEmpty  ||  txtFldRoll.isEmpty ) ? false : true
            
        }
        
        else  {
            btnSave.alpha = (txtFldName.isEmpty || txtFldAge.isEmpty  ||  txtFldRoll.isEmpty) ? 0.5 : 1
            btnSave.isUserInteractionEnabled = (txtFldName.isEmpty  || txtFldAge.isEmpty  ||  txtFldRoll.isEmpty ) ? false : true
        }
    }
    
    @IBAction func didTappedSave(_ sender: UIButton) {
        if isFromEdit {  // updation
            DatabaseHelper.shared.updateStudentInfo(with: .init(name: txtFldName.text, age: txtFldAge.text, rollNo: txtFldRoll.text)) {
                self.navigationController?.popViewController(animated: true)
            }
        }
        else  {   // insertion
        if DatabaseHelper.shared.checkIfRollNoExist(rollNo: txtFldRoll.text ?? "") {
            Alert.showAlert(message: "This roll no already exist. Please enter unique roll no")
            return
        }
        
        DatabaseHelper.shared.saveStudentRecord(with: .init(name: txtFldName.text ?? "", age: txtFldAge.text ?? "" ,rollNo: txtFldRoll.text ?? "")) {
            self.navigationController?.popViewController(animated: true)
        }
        }
    
    }
}


extension AddStudentInfoVC {
    
    fileprivate func prepareUI() {
      txtFldRoll.isUserInteractionEnabled = isFromEdit ?  false : true
       txtFldRoll.alpha = isFromEdit ?  0.5 : 1
       txtFldRoll.backgroundColor = isFromEdit ? (UIColor.lightGray) : (UIColor.clear)
        txtFldName.text = isFromEdit ? info?.name : ""
        txtFldAge.text = isFromEdit ? info?.age : ""
        txtFldRoll.text = isFromEdit ? info?.rollNo : ""
        
        
    }
    
    
}


extension AddStudentInfoVC : UITextFieldDelegate {
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let customTextField = textField as? CustomTextField {
        if textField == txtFldName {
            if !string.canBeConverted(to: String.Encoding.ascii){
                   return false
               }
            
            if (textField.text?.count == 0 && string == " ") || (textField.text?.last == " " && string == " "){
                    return false
                }
            
            
            return customTextField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        
        
        if textField == txtFldAge ||  textField == txtFldRoll {
            if textField.text?.count == 0 && string == "0" {
                    return false
                }
            
            return customTextField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
            
        }
    
            return customTextField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        } else {
            return false
        }
        
        
    }
    
    
    
    
    
    
}
