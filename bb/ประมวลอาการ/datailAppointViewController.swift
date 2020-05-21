//
//  datailAppointViewController.swift
//  bb
//
//  Created by hathaitat on 28/2/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Firebase

class datailAppointViewController: UIViewController {
    
   
    
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var namedoc44: UILabel!
    @IBOutlet weak var time44: UILabel!
    @IBOutlet weak var day44: UILabel!
    @IBOutlet weak var dept44: UILabel!
    @IBOutlet weak var symptom44: UITextView!
    @IBOutlet weak var showcancel: UIButton!
    var nameDoc4 = [String]()
    var dept4 = [String]()
    var time4 = [String]()
    var day4 = [String]()
    var symptom4 = [String]()
    var idDoc2 = ""
    
    
    func shadow(){
       
        btnBack.layer.shadowColor = UIColor.gray.cgColor
        btnBack.layer.shadowOpacity = 1
        btnBack.layer.shadowOffset = .zero
        btnBack.layer.shadowRadius = 2
        
        showcancel.layer.shadowColor = UIColor.gray.cgColor
        showcancel.layer.shadowOpacity = 1
        showcancel.layer.shadowOffset = .zero
        showcancel.layer.shadowRadius = 2
        
    }
   
    func delete(){
        let db2 = Firestore.firestore()
        
        db2.collection("appointment").document(idDoc2).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
            }
    }
    
    func getdoc(){
        let db = Firestore.firestore()
        let db2 = Firestore.firestore()
        
        let user = Auth.auth().currentUser
        var uid2 = user?.uid
        
        db.collection("appointment").getDocuments { (snapshot, error) in
        if error == nil && snapshot != nil {
            for document in snapshot!.documents {
                let uid = document.get("uid") as! String
             if uid == uid2{
                let nameDoc = document.get("nameDoc") as! String
                if nameDoc == self.nameDoc4.joined(separator:""){
                    let dayAppoint = document.get("dayAppoint") as! String
                    if dayAppoint == self.day4.joined(separator:""){
                        let timeAppoint = document.get("timeAppoint") as! String
                        if timeAppoint == self.time4.joined(separator:""){
                            let idDoc = document.documentID
                            self.idDoc2 = idDoc
                            print(idDoc)
                            

                        }
                    }
                    
                }
        
                }
            }
            }
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        
        let refreshAlert = UIAlertController(title: "ยกเลิก", message: "ท่านต้องการยกเลิกการนัดหมายหรือไม่", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "ตกลง", style: .default, handler: { (action: UIAlertAction!) in
              print("Handle Ok logic here")
            self.delete()
        
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "backback") as? memuViewController
            self.present(vc!, animated: true)
            
        }))

        refreshAlert.addAction(UIAlertAction(title: "ยกเลิก", style: .cancel, handler: { (action: UIAlertAction!) in
              print("Handle Cancel Logic here")
        }))

        self.present(refreshAlert, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(idDoc2)
        
        if let navigationController = self.navigationController {

           let navigationBar = navigationController.navigationBar
            let navBorder: UIView = UIView(frame: CGRect(x: 0, y: navigationBar.frame.size.height - 1.5, width: navigationBar.frame.size.width, height: 1.5))
           navBorder.backgroundColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1)
        navBorder.isOpaque = true
           self.navigationController?.navigationBar.addSubview(navBorder)
        }
        
        print(nameDoc4)
        
        namedoc44.text = nameDoc4.joined(separator:"")
        dept44.text = dept4.joined(separator:"")
        time44.text = time4.joined(separator:"")
        day44.text = day4.joined(separator:"")
        symptom44.text = symptom4.joined(separator:"")
        
        shadow()
        getdoc()
        
    }
    

}
