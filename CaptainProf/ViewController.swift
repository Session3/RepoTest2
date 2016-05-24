//
//  ViewController.swift
//  CaptainProf
//
//  Created by IOS04 on 23/05/2016.
//  Copyright © 2016 CEDRIC. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Ajout comment
        print("Ok")
        testKit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func testKit(){
        
        let container = CKContainer(identifier: "iCloud.CAII-CLOUD")
        //CKContainer.defaultContainer()
        var publicDB : CKDatabase?
        var curRecord : CKRecord?
        
        publicDB = container.publicCloudDatabase
        
       //let predicate = NSPredicate(format: "nom = %@", "Doe")
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Etudiant", predicate: predicate)
        
        //let predicate = NSPredicate(value: true)
        //let query = CKQuery(recordType: "Etudiant", predicate: predicate)
        publicDB!.performQuery(query, inZoneWithID: nil) { results, error in
            if error != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    print("error loading: \(error)")
                }
            } else {
                
                for record in results! {
                    //let etudiant = Etudiant(record: record , database: publicDB!)
                    //let etudiant = Etudiant(record: record as! CKRecord, database: self.publicDB)
                    print("nom", record.objectForKey("nom") as! String)
                    print("prenom", record.objectForKey("prenom") as! String)
                    
                }
                dispatch_async(dispatch_get_main_queue()) {
                    
                    print("")
                }
            }
        }
        
        
    }

    

        func loadItems() {
            let container = CKContainer(identifier: "iCloud.CAII-CLOUD")
            //CKContainer.defaultContainer()
            var publicDB : CKDatabase?
            var curRecord : CKRecord?
            publicDB = container.publicCloudDatabase
            
            let predicate = NSPredicate(value: true)
            let query = CKQuery(recordType: "Etudiant", predicate: predicate)
            publicDB!.performQuery(query, inZoneWithID: nil) { (results, error) -> Void in
                if error != nil {
                    print(error!.localizedDescription)
                }
                
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    let items = results! as [CKRecord]
                    //self.tableView.reloadData()
                    //print("nom: \(items)")
                    
                    for record in results! {
                        //let etudiant = Etudiant(record: record , database: publicDB!)
                        //let etudiant = Etudiant(record: record as! CKRecord, database: self.publicDB)
                        
                        print("Record %@", record.objectForKey("nom") as! String)
 
                        
                    }

                    
                    
                }
            }
        }

    
}

