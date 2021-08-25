//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by netset on 20/08/21.
//

import UIKit

class StudentsRecordsVc: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    var studentsList = [Students]() {
        didSet {
            tblView.reloadData()
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.tableFooterView = UIView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        fetchStudentsRecords()
    }
    
    
}


extension StudentsRecordsVc {
    
    fileprivate func fetchStudentsRecords() {
        self.tblView.showNoDataLabel(message: "No records", arrayCount:  self.studentsList.count)
        DatabaseHelper.shared.fetchStudentsRecords { (studentsRecords) in
            self.studentsList = studentsRecords
            self.tblView.showNoDataLabel(message: "No records", arrayCount:  self.studentsList.count)
            
        }
        
        
    }
    
    
}



extension StudentsRecordsVc : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "StudentsInfoCell") as? StudentsInfoCell
        cell?.studentInfo = studentsList[indexPath.row]
        return cell ?? UITableViewCell() 
    }

    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let edit = UIContextualAction(style: .normal, title: "Edit") { (action, sourceView, completionHandler) in
    
        let targetVc = self.storyboard?.instantiateViewController(identifier: "AddStudentInfoVC") as? AddStudentInfoVC
        targetVc?.isFromEdit = true
        targetVc?.info = self.studentsList[indexPath.row]
        self.navigationController?.pushViewController(targetVc ?? UIViewController(), animated: true)
        
        
      
    }
     
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, sourceView, completionHandler) in
            DatabaseHelper.shared.deleteStudentRecord(with: self.studentsList[indexPath.row].rollNo ?? "") {
                self.studentsList.remove(at: indexPath.row)
                self.tblView.showNoDataLabel(message: "No records", arrayCount:  self.studentsList.count)
            }
            
            
        }
        edit.backgroundColor = .blue
        delete.backgroundColor = .red
    let preventSwipeFullAction = UISwipeActionsConfiguration(actions: [edit,delete ])
    preventSwipeFullAction .performsFirstActionWithFullSwipe = false // set false to disable full swipe action
    return preventSwipeFullAction
    }
    
    
    
}

class StudentsInfoCell: UITableViewCell {
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblRollNo: UILabel!
    
    var studentInfo : Students? {
        didSet {
            lblAge.text =  "Age is \(studentInfo?.age ?? "")"
            lblName.text =  "Name is \(studentInfo?.name ?? "")"
            lblRollNo.text =  "RollNo is \(studentInfo?.rollNo ?? "")"
        }
    }
    
    
}
