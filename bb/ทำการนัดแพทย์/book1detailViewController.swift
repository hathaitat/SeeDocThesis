//
//  book1detailViewController.swift
//  bb
//
//  Created by hathaitat on 25/2/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Firebase



class book1detailViewController: UIViewController, UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var nameDocPick: UITextView!
    @IBOutlet weak var deptDocPick: UILabel!
    @IBOutlet weak var daytotalDocPick: UILabel!
    @IBOutlet weak var timeDocPicke: UILabel!
    @IBOutlet weak var showSymptom: UITextView!
    @IBOutlet weak var imageDocShow: UIImageView!
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var backview: UIView!
    
    
    @IBOutlet weak var container: UICollectionView!
    @IBOutlet weak var pageIndicator: UIPageControl!
      
      
    
    var nameDoc = ""
    var deptDoc = ""
    var showTimeperiod2 = ""
    var showDayPick2 = ""
    var showDayPickTotal2 = ""
    var symptommm = ""
    var showTimeperiod22 = [String]()
    var imageDoc = ""
    
    //เป็นค่าของอาการที่ส่งมา
    var showdataSymptom4 = ""
    var num2 = ""
    
    
    
    let db = Firestore.firestore()
    var selectedDate = Date()
    var ref: DocumentReference? = nil
    
//    var selected : String?
//    var pickTime = String()
    
    


    
    @IBAction func nextBtn(_ sender: Any) {
  
        if showSymptom.text == ""{
            let alert = UIAlertController(title: "อาการ", message: "กรุณาเพิ่มอาการของท่าน", preferredStyle: .alert)
            let action = UIAlertAction(title: "ตกลง", style: .default, handler: nil)
            alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
        }else{
            let user = Auth.auth().currentUser
            let uid = user?.uid
            print(uid)
            let gg = showSymptom.text
            
            let aa : String = self.showDayPickTotal2
            let aaa : [String] = aa.components(separatedBy: " ")
            var aaaa : String = aaa[2]
            var oo = Int(aaaa)
            print(self.showDayPickTotal2)
            print("oo")

            //delete
            let appendDayDelte = oo!+1
            print(appendDayDelte)
            var str2 = String(appendDayDelte)
            //noti
            var appendDayDelte2 = oo!-1
            var str3 = String(appendDayDelte2)
            
            var aaaaa : String = aaa[1]//แปลงเดือน
            print(aaaaa)
            var total = "\(aaaaa) \(str2)" //ของdeleteAppoint
            var total2 = "\(aaaaa) \(str3)" //ของdeleteAppoint
            
            
            self.ref = self.db.collection("appointment").addDocument(data: [
                "nameDoc": self.nameDoc,
                "dayAppoint": self.showDayPickTotal2,
                "timeAppoint": self.showTimeperiod2,
                "deleteAppoint": total,
                "NotifiAppoint": total2,
                "deptDoc": self.deptDoc,
                "symptom": gg,
                "uid": uid
                            ])
            print("ok2")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "done") as! book1DoneViewController
            vc.nameDeptDone1 = self.deptDoc
            vc.nameDocDone1 = self.nameDoc
            vc.timeDone1 = self.showTimeperiod2
            vc.dayDone1 = self.showDayPickTotal2
            vc.symDone1 = gg!
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func shadow(){
        showSymptom.layer.cornerRadius = 5
        btn1.layer.cornerRadius = 5
        btn2.layer.cornerRadius = 5
        
        btn1.layer.shadowColor = UIColor.gray.cgColor
        btn1.layer.shadowOpacity = 1
        btn1.layer.shadowOffset = .zero
        btn1.layer.shadowRadius = 2
        
        btn2.layer.shadowColor = UIColor.gray.cgColor
        btn2.layer.shadowOpacity = 1
        btn2.layer.shadowOffset = .zero
        btn2.layer.shadowRadius = 2
        
        btnBack.layer.shadowColor = UIColor.gray.cgColor
        btnBack.layer.shadowOpacity = 1
        btnBack.layer.shadowOffset = .zero
        btnBack.layer.shadowRadius = 2
        btnBack.center = CGPoint(x: 365, y: 835)
        

        topView.layer.borderWidth = 1.5
        topView.layer.borderColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1).cgColor
        
        backview.layer.cornerRadius = 5
        backview.layer.shadowColor = UIColor.gray.cgColor
        backview.layer.shadowOpacity = 1
        backview.layer.shadowOffset = .zero
        backview.layer.shadowRadius = 2
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        let refreshAlert = UIAlertController(title: "ยกเลิก", message: "ท่านต้องการยกเลิกการนัดหมายหรือไม่", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "ตกลง", style: .default, handler: { (action: UIAlertAction!) in
              print("Handle Ok logic here")
        
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "backback") as? memuViewController
            self.present(vc!, animated: true)
            
        }))

        refreshAlert.addAction(UIAlertAction(title: "ยกเลิก", style: .cancel, handler: { (action: UIAlertAction!) in
              print("Handle Cancel Logic here")
        }))

        self.present(refreshAlert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func actionBack(_ sender: Any) {
        let refreshAlert = UIAlertController(title: "ยกเลิก", message: "ท่านต้องการยกเลิกการนัดหมายหรือไม่", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "ตกลง", style: .default, handler: { (action: UIAlertAction!) in
              print("Handle Ok logic here")
        
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "backback") as? memuViewController
            self.present(vc!, animated: true)
            
        }))

        refreshAlert.addAction(UIAlertAction(title: "ยกเลิก", style: .cancel, handler: { (action: UIAlertAction!) in
              print("Handle Cancel Logic here")
        }))

        self.present(refreshAlert, animated: true, completion: nil)
    }
    
    
    func imageset(){
  
        imageDocShow.layer.cornerRadius = imageDocShow.frame.size.width / 2
        imageDocShow.clipsToBounds = true
        imageDocShow.backgroundColor = UIColor(red: 254/255, green: 251/255, blue: 249/255, alpha: 1)
//        imageDocShow.backgroundColor = UIColor.tertiarySystemBackground
   
        }
    
    //side
    private let images:[String] = [ "developer", "code" ]
    var titles = [String]()
    var descriptions = [String]()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
      

        print(num2)
        print(showdataSymptom4)
//        nameDocPick.text = nameDoc
//        deptDocPick.text = deptDoc
        daytotalDocPick.text = showDayPickTotal2
        timeDocPicke.text = showTimeperiod2
        
        
        
        print(showTimeperiod2)
        print(showDayPick2)
        print(showDayPickTotal2)
        
        getDoctor()
//        getSymptom()
        getSymptom2()
        imageset()
        shadow()
        HideKeyboard()
//        createPick()
//        create()
        
        
       self.pageIndicator.numberOfPages = images.count
        titles = [ nameDoc, nameDoc]
        descriptions = ["แผนกอายุรกรรม", "คุณวุฒิทางการศึกษา\n - มหาวิทยาลัยศรีนครินทรวิโรฒ"]
        

    }
    

    func getDoctor(){
        let data = self.db.collection("doctor")
        data.getDocuments {(snapshot, error) in
        if error == nil && snapshot != nil {
            for document in snapshot!.documents {
                let name = document.get("nameDoc") as! String
                for Dname in name {
                    if name == self.nameDoc{
                        let schedule = document.get("scheduleDoc") as! [String:[String]]
                        for days in schedule {
                            if days.key == self.showDayPick2 {
//                            print(days.value)
                                for timeperiod in days.value{
                                    if timeperiod == self.showTimeperiod2{
                                        print(timeperiod)
                                        self.showTimeperiod22 = [timeperiod]
//                                        self.showTimeperiod22.append(contentsOf: timeperiod.value)
                                        print("ok")
                                        print(self.showTimeperiod22)
                                        let dept = document.get("deptDoc") as! String
                                        self.deptDoc = dept
                                        print(self.deptDoc)
                                        
                                        
                                        let data = self.db.collection("doctor").whereField("nameDoc", isEqualTo: self.nameDoc)
                                        data.getDocuments { (snapshot, error) in
                                            if error == nil && snapshot != nil {
                                                for document in snapshot!.documents {
                                                let imageURL = document.get("imageDoc") as! String
                                                    if imageURL != "" {
                                                        self.imageDoc.append(imageURL)
                                                        let storageRef = Storage.storage().reference(forURL: imageURL)
                                                        self.imageDocShow.sd_setImage(with: storageRef)
                                                        
                                                                           }
                                                                       }
                                                                   }
//                                                                   self.cafetable.reloadData()
                                                               }
                                    }
                                    
                                }
                    }
                }
                    }
                            }
                            }
                        }
        }
    }
    
    func getSymptom(){
        var uid2 = ""
        let user = Auth.auth().currentUser
        var uid = user?.uid
        print(uid)
        uid2.append(contentsOf: uid!)
        print(uid2)
        
        
        let data = self.db.collection("symptomUser")
        data.getDocuments {(snapshot, error) in
        if error == nil && snapshot != nil {
            for document in snapshot!.documents {
                let idUser = document.get("uid") as! String
//                for id in idUser{
                    if idUser == uid2 {
                        let symptomm = document.get("symptom") as! String
                        print(symptomm)
                        self.symptommm = symptomm
                        self.showSymptom.text = self.symptommm
                        
                    }
    }
            
            }
        }
    }
    
    func getSymptom2(){
        if num2 == "2"{
         self.showSymptom.text = showdataSymptom4
            
        }else{
            self.showSymptom.text = self.symptommm
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // How many page will have each section?
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Create cell to show
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pageCell", for: indexPath) as! PageCollectionViewCell
        // Set resources
//        cell.image.image = UIImage(named: self.images[indexPath.row])
        cell.title.text = self.titles[indexPath.row]
        cell.descrip.text = self.descriptions[indexPath.row]
        // Create Animation
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: .transitionFlipFromLeft, animations: {
            cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }, completion: { finished in
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        })
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: collectionView.bounds.size.height)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // How many sections will have CollectionView?
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Avoid space between cells
        return 0
    }
    
    // MARK: Method UIPageControl
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.pageIndicator.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    

        }

    
    


    
