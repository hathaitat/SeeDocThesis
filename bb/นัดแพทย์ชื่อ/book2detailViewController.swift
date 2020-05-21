//
//  book2detailViewController.swift
//  bb
//
//  Created by hathaitat on 12/3/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Firebase

class book2detailViewController: UIViewController, CalendarCallBack {
    

    @IBOutlet weak var dateLabel: UILabel!
    
    let db = Firestore.firestore()
    var selectedDate = Date()
        
    var continueButton:RoundedWhiteButton!
    var activityView:UIActivityIndicatorView!
        
        
    @IBAction func showCalendar(_ sender: UIButton){
    let CalendarViewController = self.storyboard?.instantiateViewController(withIdentifier: "CalendarViewController2") as! CalendarViewController2
        //ส่งค่าวัน
    CalendarViewController.SS = dayDocSS
    CalendarViewController.Mon = dayDocMon
    CalendarViewController.Tue = dayDocTue
    CalendarViewController.Wed = dayDocWed
    CalendarViewController.Thu = dayDocThu
    CalendarViewController.Fri = dayDocFri
    
    CalendarViewController.modalPresentationStyle = .overCurrentContext
    CalendarViewController.delegate = self
    CalendarViewController.selectedDate = selectedDate
    self.present(CalendarViewController, animated: false, completion: nil)

        }
        
    @IBOutlet weak var nameDocLa: UILabel!
    
        
    @IBOutlet weak var dateBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    
    @IBOutlet weak var addTime1: UIButton!
        
    @IBOutlet weak var addTime2: UIButton!
        
    @IBOutlet weak var addTime3: UIButton!
    @IBOutlet weak var addTime4: UIButton!
    @IBOutlet weak var addTime5: UIButton!
    @IBOutlet weak var topView: UIView!
    
    var doctor111 = ""
    var showdatata = [String]()
    var showdatata2 = [String]()
    var Timeperiod = ""
    var dayPick = ""
    var imageDoc = ""
    var dayDoc = ""
    
    
    var timeDoc = [[String]]()
    var dayDocc = [String]()
    
    //ตัวแปรส่งค่าวันไปแสดงปฏิทิน
    var dayDocSS = ""
    var dayDocMon = ""
    var dayDocTue = ""
    var dayDocWed = ""
    var dayDocThu = ""
    var dayDocFri = ""
        
    var timee:String = ""
    
    //เก็บตัววันที่รวมเพื่อส่งไปอีกหน้า
    var showDayPick = ""
    var timepick = ""
    
    //ตัวแปรรับค่าอาการที่ส่งมา
    var showdataSymptom3 = ""
    var num = "2"
    var numm = "3"
    
    var today = ""
    
    
    //เก็บarrayเวลาเพื่อโชว์ปุ่ม
    var faTime = [String]()
    func alert(){
        let alert = UIAlertController(title: "ไม่มีเวลาทำการ", message: "โปรดเลือกเวลานัดหมายใหม่", preferredStyle: .alert)
        let action = UIAlertAction(title: "ตกลง", style: .default, handler: nil)
            alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
    }
    func alertDay(){
        let alert = UIAlertController(title: "ไม่มีวันทำการ", message: "โปรดเลือกวันนัดหมายใหม่", preferredStyle: .alert)
        let action = UIAlertAction(title: "ตกลง", style: .default, handler: nil)
            alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
     
        
    @IBAction func time1(_ sender: Any) {
        timee = "08.30 - 09.30"
        if addTime1.titleColor(for: .normal) == UIColor.darkGray{
            addTime1.backgroundColor = UIColor(red: 253/255, green: 183/255, blue: 41/255, alpha: 1)
            //เปลี่ยนสีปุ่มเมื่อเลือกอันอื่น
            addTime2.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime3.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime4.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime5.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            timepick = timee
            checkDoc()
            self.setContinueButton(enabled: true)
        }
        
        else if addTime1.titleColor(for: .normal) == UIColor.tertiarySystemGroupedBackground{
            alert()
        }
        else{
        }
        }
        
    @IBAction func time2(_ sender: Any) {
        timee = "09.31 - 10.30"
        if addTime2.titleColor(for: .normal) == UIColor.darkGray{
            addTime2.backgroundColor = UIColor(red: 253/255, green: 183/255, blue: 41/255, alpha: 1)
//            self.addTime2.setTitleColor(.white, for: .normal)
            //เปลี่ยนสีปุ่มเมื่อเลือกอันอื่น
            addTime1.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime3.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime4.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime5.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            timepick = timee
            checkDoc()
            self.setContinueButton(enabled: true)
        }
        else if addTime2.titleColor(for: .normal) == UIColor.tertiarySystemGroupedBackground{
            alert()
        }
        else{
        }
        }

        
    @IBAction func time3(_ sender: Any) {
        timee = "10.31 - 11.30"
        if addTime3.titleColor(for: .normal) == UIColor.darkGray{
            addTime3.backgroundColor = UIColor(red: 253/255, green: 183/255, blue: 41/255, alpha: 1)
            //เปลี่ยนสีปุ่มเมื่อเลือกอันอื่น
            addTime2.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime1.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime4.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime5.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            timepick = timee
            checkDoc()
            self.setContinueButton(enabled: true)
        }
        else if addTime3.titleColor(for: .normal) == UIColor.tertiarySystemGroupedBackground{
            alert()
        }
        else{
        }
        }
        
        
    @IBAction func time4(_ sender: Any) {
        timee = "13.00 - 14.00"
        if addTime4.titleColor(for: .normal) == UIColor.darkGray{
            addTime4.backgroundColor = UIColor(red: 253/255, green: 183/255, blue: 41/255, alpha: 1)
            //เปลี่ยนสีปุ่มเมื่อเลือกอันอื่น
            addTime2.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime3.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime1.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            addTime5.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            timepick = timee
            checkDoc()
            self.setContinueButton(enabled: true)
        }
        else if addTime4.titleColor(for: .normal) == UIColor.tertiarySystemGroupedBackground{
            alert()
        }
        else{
        }
        }
    
    @IBAction func time5(_ sender: Any) {
        timee = "13.00 - 14.00"
    if addTime5.titleColor(for: .normal) == UIColor.darkGray{
        addTime5.backgroundColor = UIColor(red: 253/255, green: 183/255, blue: 41/255, alpha: 1)
        //เปลี่ยนสีปุ่มเมื่อเลือกอันอื่น
        addTime2.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        addTime3.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        addTime1.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        addTime4.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        timepick = timee
        checkDoc()
        self.setContinueButton(enabled: true)
    }
    else if addTime5.titleColor(for: .normal) == UIColor.tertiarySystemGroupedBackground{
        alert()
    }
    else{
    }
    }
    
// หลังได้เลือกวันที่แล้ว
    func didSelectDate(date: Date) {
        selectedDate = date
        dateLabel.isHidden = false
                
        dateLabel.text = date.getTitleDateFC2()
        print(dateLabel.text)
        showDayPick = dateLabel.text!
        let aa : String = dateLabel.text!
        let aaa : [String] = aa.components(separatedBy: ", ")
        var aaaa : String = aaa[0]
        print(aaaa)
//        self.Timeperiod.append(self.timee)
        self.Timeperiod = self.timee
        self.dayPick = aaaa
        


         let data = self.db.collection("doctor")
         data.getDocuments {(snapshot, error) in
             if error == nil && snapshot != nil {
                 for document in snapshot!.documents {
                     let dd = document.get("nameDoc") as! String
                         if self.doctor111 == dd {
                             let schedule = document.get("scheduleDoc") as! [String:[String]]
                             print("ok1")
                             print(self.doctor111)
                             print(schedule)
                             print(schedule.keys)
                            for yy in schedule.keys{
                                if aaaa == yy{
                                    print("เลือกวันถูก")
                                    self.timeDoc.append(contentsOf: schedule.values)
                                    print(self.timeDoc[0])
                                    var oo = self.timeDoc[0]
                                    let string1 = self.timeDoc.joined(separator: [""])
                                    print(string1)
                                    
                                    
                                    for tt in oo{
                                        if tt ==  "08.30 - 09.30"{
                                            self.addTime1.setTitleColor(.darkGray, for: .normal)
                                                }
                                        else if tt ==  "09.31 - 10.30"{
                                            self.addTime2.setTitleColor(.darkGray, for: .normal)
                                                }
                                        else if tt ==  "10.31 - 11.30"{
                                            self.addTime3.setTitleColor(.darkGray, for: .normal)
                                                }
                                        else if tt ==  "13.00 - 14.00"{
                                            self.addTime4.setTitleColor(.darkGray, for: .normal)
                                                }
                                        else if tt ==  "14.01 - 15.00"{
                                            self.addTime5.setTitleColor(.darkGray, for: .normal)
                                                }
                                        else{
                                            self.alertDay()
                                            print("error")
                                        }
                                            }
                                }else{
//                                    self.alertDay()
//                                    print("error")
                                }
                            }
                            
                    }
                }
            }
        }
            }
        
        
        func shadow(){
            addTime1.layer.shadowColor = UIColor.gray.cgColor
            addTime1.layer.shadowOpacity = 1
            addTime1.layer.shadowOffset = .zero
            addTime1.layer.shadowRadius = 2
            
            addTime2.layer.shadowColor = UIColor.gray.cgColor
            addTime2.layer.shadowOpacity = 1
            addTime2.layer.shadowOffset = .zero
            addTime2.layer.shadowRadius = 2
            
            addTime3.layer.shadowColor = UIColor.gray.cgColor
            addTime3.layer.shadowOpacity = 1
            addTime3.layer.shadowOffset = .zero
            addTime3.layer.shadowRadius = 2
            
            addTime4.layer.shadowColor = UIColor.gray.cgColor
            addTime4.layer.shadowOpacity = 1
            addTime4.layer.shadowOffset = .zero
            addTime4.layer.shadowRadius = 2
            
            addTime5.layer.shadowColor = UIColor.gray.cgColor
            addTime5.layer.shadowOpacity = 1
            addTime5.layer.shadowOffset = .zero
            addTime5.layer.shadowRadius = 2
            
            homeBtn.layer.shadowColor = UIColor.gray.cgColor
            homeBtn.layer.shadowOpacity = 1
            homeBtn.layer.shadowOffset = .zero
            homeBtn.layer.shadowRadius = 3
            homeBtn.center = CGPoint(x: 365, y: 836)
            
            dateBtn.layer.shadowColor = UIColor.gray.cgColor
            dateBtn.layer.shadowOpacity = 1
            dateBtn.layer.shadowOffset = .zero
            dateBtn.layer.shadowRadius = 3
            
            topView.layer.borderWidth = 1.5
            topView.layer.borderColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1).cgColor
        }
        
    
    @IBAction func actionBack(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "backback") as! memuViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    func checkDoc(){
            var appendname = [String]()
            let data = self.db.collection("appointment")
            data.getDocuments {(snapshot, error) in
                if error == nil && snapshot != nil {
                    for document in snapshot!.documents {
                        let dayAppoint = document.get("dayAppoint") as! String
                        if self.today == dayAppoint{
                            let nameDoc = document.get("nameDoc") as! String
    //                        var counts: [String: Int] = [:]
                            appendname.append(nameDoc)
                            var count = appendname.count
                            print(appendname.count)
                            print(dayAppoint)
                            
                            if count > 10 {
                                print("ok")
                                let alert = UIAlertController(title: "คิวของแพทย์เต็ม", message: "โปรดเลือกวันเวลานัดหมายใหม่", preferredStyle: .alert)
                                let action = UIAlertAction(title: "ตกลง", style: .default, handler: nil)
                                    alert.addAction(action)
                                self.present(alert, animated: true, completion: nil)
                            }
                            else{
                            }
                        }
                    }
                }
            }
        }
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            dateLabel.isHidden = false
            nameDocLa.text = doctor111
            print(doctor111)
            
            let data = self.db.collection("doctor")
            data.getDocuments {(snapshot, error) in
                if error == nil && snapshot != nil {
                    for document in snapshot!.documents {
                        let dd = document.get("nameDoc") as! String
                            if self.doctor111 == dd {
                                let schedule = document.get("scheduleDoc") as! [String:[String]]
                                print("ok1")
                                print(self.doctor111)
                                
                                self.dayDocc.append(contentsOf: schedule.keys)
                                print(self.dayDocc)
                                for dd in self.dayDocc{
                                    if dd == "Sun"{
                                        self.dayDocSS = "SS"
                                    }
                                    else if dd == "Mon"{                                             self.dayDocMon = "Mon"
                                    }
                                    else if dd == "Tue"{
                                        self.dayDocTue = "Tue"
                                    }
                                    else if dd == "Wed"{                                             self.dayDocWed = "Wed"
                                        print(self.dayDocWed)
                                    }
                                    else if dd == "Thu"{
                                        self.dayDocThu = "Thu"
                                        print(self.dayDocThu)
                                    }
                                    else if dd == "Fri"{
                                        self.dayDocFri = "Thu"
                                    }
                                    else if dd == "Sat"{
                                        self.dayDocSS = "SS"
                                    }
                                    else{
                                        }
                                }
                        }
                    }
                }
            }
            
            today = selectedDate.getTitleDateFC()
            shadow()
            dateBtn.layer.cornerRadius = 5
            addTime1.layer.cornerRadius = 5
            addTime2.layer.cornerRadius = 5
            addTime3.layer.cornerRadius = 5
            addTime4.layer.cornerRadius = 5
            addTime5.layer.cornerRadius = 5
            
            //button continue//
            view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
            
            continueButton = RoundedWhiteButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
            continueButton.setTitleColor(UIColor.white, for: .normal)
            continueButton.setTitle("ต่อไป", for: .normal)
            continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.bold)
            continueButton.center = CGPoint(x: view.center.x, y: view.frame.height - continueButton.frame.height - 24)
            continueButton.highlightedColor = UIColor(white: 1.0, alpha: 1.0)
            continueButton.defaultColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1)
            continueButton.addTarget(self, action: #selector(ee), for: .touchUpInside)
            
            view.addSubview(continueButton)
            setContinueButton(enabled: false)
            
            activityView = UIActivityIndicatorView(style: .gray)
            activityView.color = secondaryColor
            activityView.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
            activityView.center = continueButton.center
        }
        
    //ฟังชั่นที่จะส่งค่าไปอีกหน้านึง
        @objc func ee(){
            print(showdatata)
            let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "book1detailViewController") as! book1detailViewController
            vc1.showTimeperiod2 = timepick
            vc1.nameDoc = doctor111
            vc1.showDayPick2 = dayPick
            vc1.showDayPickTotal2 = showDayPick
            vc1.symptommm = ""
            vc1.showdataSymptom4 = showdataSymptom3
            vc1.num2 = num
//            vc1.numm2 = numm
            self.present(vc1, animated: true, completion: nil)
        }
    
        //button continue//
        override var preferredStatusBarStyle: UIStatusBarStyle {
            get {
                return .lightContent
            }
        }
        
        @IBAction func handleDismissButton(_ sender: Any) {
            ee()
            self.dismiss(animated: false, completion: nil)
        }
        func setContinueButton(enabled:Bool) {
            if enabled {
                continueButton.alpha = 1.0
                continueButton.isEnabled = true
            } else {
                continueButton.alpha = 0.5
                continueButton.isEnabled = false
            }
        }
    }
  

