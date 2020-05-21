//
//  book1DoneViewController.swift
//  bb
//
//  Created by hathaitat on 2/3/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Firebase

class book1DoneViewController: UIViewController {
    
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var today: UILabel!
    
    
    @IBOutlet weak var symDone: UITextView!
    @IBOutlet weak var timeDone: UILabel!
    @IBOutlet weak var dayDone: UILabel!
    @IBOutlet weak var nameDeptDone: UILabel!
    @IBOutlet weak var nameDocDone: UILabel!
    @IBOutlet weak var nameUserDone: UILabel!
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var topView: UIView!
    
    var symDone1 = ""
    var timeDone1 = ""
    var dayDone1 = ""
    var nameDeptDone1 = ""
    var nameDocDone1 = ""
    var nameUserDone1 = ""
    
    var today1 = ""
    var selectedDate = Date()
    
    
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    
//    @IBAction func backBook(_ sender: Any) {
////        performSegue(withIdentifier: "backbook", sender: self)
//    }
    
    func shadow(){
        btn1.layer.cornerRadius = 5
        
        btn1.layer.shadowColor = UIColor.gray.cgColor
        btn1.layer.shadowOpacity = 1
        btn1.layer.shadowOffset = .zero
        btn1.layer.shadowRadius = 2
        
        btnBack.layer.shadowColor = UIColor.gray.cgColor
        btnBack.layer.shadowOpacity = 1
        btnBack.layer.shadowOffset = .zero
        btnBack.layer.shadowRadius = 2
        btnBack.center = CGPoint(x: 365, y: 835)
        
        backImg.layer.shadowColor = UIColor.gray.cgColor
        backImg.layer.shadowOpacity = 1
        backImg.layer.shadowOffset = .zero
        backImg.layer.shadowRadius = 2
        
        topView.layer.borderWidth = 1.5
        topView.layer.borderColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1).cgColor

    }
    
    @IBAction func actionBack(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "backback") as! memuViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       today1 = selectedDate.getTitleDateFC()
       today.text = today1
        
        getUser()
        nameDocDone.text = nameDocDone1
        nameDeptDone.text = nameDeptDone1
        dayDone.text = dayDone1
        timeDone.text = timeDone1
        symDone.text = symDone1
        
        shadow()
    }
    
    func getUser(){
        let user = Auth.auth().currentUser
        if let user = user{
            nameUserDone.text = user.displayName
            
                }
            }

   

}
