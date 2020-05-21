//
//  test11ViewController.swift
//  bb
//
//  Created by hathaitat on 19/1/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import Firebase
import UIKit

class test11ViewController: UIViewController {
    
    var showdata = String()
    var showdata2 = String()
    var bb = ""
    var num = "2"
    
    
    @IBOutlet weak var showData2: UITextView!
    @IBOutlet weak var showdata1: UITextView!
    
    @IBOutlet weak var CircularProgress: CircularProgressView!
    
    @IBOutlet weak var percentText: UITextView!
    
    
    @IBOutlet weak var view1: UIView!
   
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var againBtn: UIButton!
    @IBOutlet weak var docBtn: UIButton!
    @IBOutlet weak var backImg: UIImageView!
    
    
    
    func shadow(){
        view1.layer.cornerRadius = 5
        view2.layer.cornerRadius = 5
        againBtn.layer.cornerRadius = 5
        docBtn.layer.cornerRadius = 5
        
        view1.layer.shadowColor = UIColor.gray.cgColor
        view1.layer.shadowOpacity = 1
        view1.layer.shadowOffset = .zero
        view1.layer.shadowRadius = 3
        
        againBtn.layer.shadowColor = UIColor.gray.cgColor
        againBtn.layer.shadowOpacity = 1
        againBtn.layer.shadowOffset = .zero
        againBtn.layer.shadowRadius = 3
        
        docBtn.layer.shadowColor = UIColor.gray.cgColor
        docBtn.layer.shadowOpacity = 1
        docBtn.layer.shadowOffset = .zero
        docBtn.layer.shadowRadius = 3
        
        view2.layer.shadowColor = UIColor.gray.cgColor
        view2.layer.shadowOpacity = 1
        view2.layer.shadowOffset = .zero
        view2.layer.shadowRadius = 3
        
        backImg.layer.cornerRadius = 7
        backImg.layer.shadowColor = UIColor.gray.cgColor
        backImg.layer.shadowOpacity = 1
        backImg.layer.shadowOffset = .zero
        backImg.layer.shadowRadius = 3
        

        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showdata1.text = showdata
        showData2.text = showdata2
        
        
        circular()
//        createSymptom()
        shadow()
        HideKeyboard()
       
    }
    @objc func animateProgress() {
        if bb == "1"{
            let cP = self.view.viewWithTag(101) as! CircularProgressView
            cP.setProgressWithAnimation(duration: 1.0, value: 0.9)
            percentText.text = "สูง"
            percentText.textColor = UIColor(red: 291.0/255.0, green: 67/255.0, blue: 58/255.0, alpha: 1.0)
            cP.progressColor = UIColor(red: 291.0/255.0, green: 67/255.0, blue: 58/255.0, alpha: 1.0)
        }
        else if bb == "2" {
            let cP = self.view.viewWithTag(101) as! CircularProgressView
            cP.setProgressWithAnimation(duration: 1.0, value: 0.1)
            percentText.text = "ต่ำมาก"
            percentText.textColor = UIColor(red: 108.0/255.0, green: 245.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            cP.progressColor = UIColor(red: 108.0/255.0, green: 245.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }
        else if bb == "3" {
            let cP = self.view.viewWithTag(101) as! CircularProgressView
            cP.setProgressWithAnimation(duration: 1.0, value: 0.3)
            percentText.text = "ต่ำ"
            percentText.textColor = UIColor(red: 77/255, green: 195/255, blue: 240/255, alpha: 1)
            cP.progressColor = UIColor(red: 77/255, green: 195/255, blue: 240/255, alpha: 1)
        }
        else if bb == "4" {
            let cP = self.view.viewWithTag(101) as! CircularProgressView
            cP.setProgressWithAnimation(duration: 1.0, value: 0.6)
            percentText.text = "ปานกลาง"
            percentText.textColor = UIColor(red: 253/255, green: 183/255, blue: 41/255, alpha: 1)
            cP.progressColor = UIColor(red: 253/255, green: 183/255, blue: 41/255, alpha: 1)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func circular(){
         //procese//
        let cp = CircularProgressView(frame: CGRect(x: 10.0, y: 10.0, width: 180.0, height: 180.0))
        cp.trackColor = UIColor(red: 254.0/255.0, green: 251.0/255.0, blue: 249.0/255.0, alpha: 1.0)
//        cp.progressColor = UIColor(red: 185.0/255.0, green: 175.0/255.0, blue: 157.0/255.0, alpha: 1.0)
//        cp.center = CGPoint(x: view.center.x, y: view.frame.height - cp.frame.height - 150)
        cp.center = CGPoint(x: view.center.x, y: 410)

        cp.tag = 101
        self.view.addSubview(cp)
        //              cp.center = self.view.center
                      
        self.perform(#selector(animateProgress), with: nil, afterDelay: 1.0)
     
    }
    
    @IBAction func next(_ sender: Any) {
        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "backbook") as! bookdoctorViewController
        vc1.showdataSymptom = showdata2
        vc1.num2 = num
        self.present(vc1, animated: true, completion: nil)
    }
    
    //เก็บข้อมูลอาการเข้าดาดต้าเบส
    func createSymptom(){
        let db = Firestore.firestore()
                var ref: DocumentReference? = nil
                let user = Auth.auth().currentUser
                let uid = user?.uid
                print(uid)
        
        ref = db.collection("symptomUser").addDocument(data: [
        "uid": uid,
        "symptom": showdata2
                        ])
        print("ok2")
        
        
            
    }

}
