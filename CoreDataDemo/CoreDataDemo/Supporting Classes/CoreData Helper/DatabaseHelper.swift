//
//  DatabaseHelper.swift
//  CoreDataDemo
//
//  Created by netset on 20/08/21.
//




import Foundation
import UIKit
import CoreData

class DatabaseHelper {
    
    // MARK: - Initialisation
    static let shared = DatabaseHelper()
    
    
    func getContext() -> NSManagedObjectContext? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.persistentContainer.viewContext
    }
    
    
    // MARK: Save File Folder Structure
    func saveStudentRecord(with info: StudentInfo, completion:@escaping() -> Void) {
        if let contextObj = getContext() {
            let entityName = NSEntityDescription.insertNewObject(forEntityName: EntitesName.students, into: contextObj) as? Students
            entityName?.name = info.name
            entityName?.age = info.age
            entityName?.rollNo = info.rollNo 
            do {
                try contextObj.save()
                completion()
            } catch let error as NSError {
                print( error.localizedDescription)
            }
        }
    }
    
    
    
    func updateStudentInfo(with info: StudentInfo , completion:@escaping() -> Void) {
        let fetchRequest = NSFetchRequest<Students>(entityName: EntitesName.students)
        let rollNo = info.rollNo ?? ""
        let predicate =  NSPredicate(format: "rollNo == %@", rollNo)
        fetchRequest.predicate = predicate
        do {
            let result = try getContext()?.fetch(fetchRequest)
            if result?.count ?? 0 > 0 {
                result?[0].name = info.name
                result?[0].age = info.age
                do {
                    try getContext()?.save()
                    print("Object Saved")
                    completion()
                } catch let error as NSError {
                    print( error.localizedDescription)
                }
            }
            
            
        } catch let error as NSError {
            print( error.localizedDescription)
        }
    }
    
    
    
    
    
    func checkIfRollNoExist (rollNo: String) -> Bool {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: EntitesName.students)
        let predicate =  NSPredicate(format: "rollNo == %@", rollNo)
        fetchRequest.predicate = predicate
        do {
            let result = try getContext()?.fetch(fetchRequest)
            return result?.count ?? 0 > 0
            
        } catch let error as NSError {
            print( error.localizedDescription)
            return false
        }
        
    }
    
    
    func deleteStudentRecord(with rollNo: String, completion:@escaping() -> Void) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: EntitesName.students)
        let predicate =  NSPredicate(format: "rollNo == %@", rollNo)
        fetchRequest.predicate = predicate
        
        do {
            if  let result = try getContext()?.fetch(fetchRequest) {
                for object in result {
                    getContext()?.delete(object)
                }
                
                do {
                    try getContext()?.save()
                } catch {
                    debugPrint(error.localizedDescription)
                }
                print("Objects Deleted")
                completion()
            }
            
            
        } catch let error as NSError {
            print( error.localizedDescription)
        }
    }
    
    
    
    
    func fetchStudentsRecords(completion:@escaping([Students]) -> Void) {
        let fetchRequest = NSFetchRequest<Students>(entityName: EntitesName.students)
        do {
            let result = try getContext()?.fetch(fetchRequest)
            if result?.count ?? 0 > 0 {
                completion(result ?? [])
            }
            
            
        } catch let error as NSError {
            print( error.localizedDescription)
        }
    }
    
}

struct EntitesName {
    static let  students = "Students"
}

struct StudentInfo {
    var name: String?
    var age: String?
    var rollNo: String?
}
