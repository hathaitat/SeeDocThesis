//
//  personal2ViewController.swift
//  bb
//
//  Created by hathaitat on 15/2/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class personal2ViewController: UIViewController {

    
    @IBOutlet weak var showWeightPer2: UILabel!
    @IBOutlet weak var showHightPer2: UILabel!
    @IBOutlet weak var showOldPer2: UILabel!
    @IBOutlet weak var showDiseasePer2: UILabel!
    @IBOutlet weak var showBloodPer2: UILabel!
//    @IBOutlet weak var blurImage: UIImageView!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var vieww: UIView!
    
    
//    func blur(){
//        blurImage.image = UIImage(named: "nn.png")
//        let darkBlur = UIBlurEffect(style: .light)
//        let blurView = UIVisualEffectView(effect: darkBlur)
//        blurView.frame = blurImage.bounds
//        blurImage.addSubview(blurView)
//    }
    func shadow(){
        showOldPer2.setCorner(radius: 5)
        showBloodPer2.setCorner(radius: 5)
        showHightPer2.setCorner(radius: 5)
        showWeightPer2.setCorner(radius: 5)
        showDiseasePer2.setCorner(radius: 5)
        
        editBtn.layer.shadowColor = UIColor.gray.cgColor
        editBtn.layer.shadowOpacity = 1
        editBtn.layer.shadowOffset = .zero
        editBtn.layer.shadowRadius = 3
        
        homeBtn.layer.shadowColor = UIColor.gray.cgColor
        homeBtn.layer.shadowOpacity = 1
        homeBtn.layer.shadowOffset = .zero
        homeBtn.layer.shadowRadius = 3
        homeBtn.center = CGPoint(x: 365, y: 750)

        
//        vieww.layer.cornerRadius = 140
    }
    
    @IBAction func backback(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "backback") as! memuViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getdata()
//        blur()
        shadow()
                
    }
                   
    func getdata(){
        let db = Firestore.firestore()
        var ref: DatabaseReference!
        ref = Database.database().reference()
        var userID = Auth.auth().currentUser?.uid
        var idd = String()
        idd.append(userID!)
              
        //
        db.collection("user").getDocuments { (snapshot, error) in
        if error == nil && snapshot != nil {
            print(userID)
            for document in snapshot!.documents {
                let dd = document.get("uid") as! String
                if dd == userID {
                    let documentData = document.data()
                    let weightt = document.get("weight") as! String
                    let hightt = document.get("hight") as! String
                    let oldd = document.get("old") as! String
                    let diseasee = document.get("disease") as! String
                    let bloodd = document.get("blood") as! String
                            
                    self.showWeightPer2.text = weightt
                    self.showHightPer2.text = hightt
                    self.showOldPer2.text = oldd
                    self.showDiseasePer2.text = diseasee
                    self.showBloodPer2.text = bloodd
                                
        //
                        }
                       
                   }
               }
           }
    }
            
            
           
}

