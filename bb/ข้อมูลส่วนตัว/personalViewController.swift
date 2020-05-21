//
//  personalViewController.swift
//  bb
//
//  Created by hathaitat on 7/1/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class personalViewController: UIViewController {

   
    @IBOutlet weak var showImagePer1: UIImageView!
    @IBOutlet weak var showNamePer1: UILabel!
    @IBOutlet weak var showOldPer1: UILabel!
    @IBOutlet weak var showWeightPer1: UILabel!
    @IBOutlet weak var showHightPer1: UILabel!
    @IBOutlet weak var blurImage: UIImageView!
    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var IdP: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    
    func shadow(){
        btn1.layer.shadowColor = UIColor.gray.cgColor
        btn1.layer.shadowOpacity = 1
        btn1.layer.shadowOffset = .zero
        btn1.layer.shadowRadius = 3
        
        btn2.layer.shadowColor = UIColor.gray.cgColor
        btn2.layer.shadowOpacity = 1
        btn2.layer.shadowOffset = .zero
        btn2.layer.shadowRadius = 3
       
        
        homeBtn.layer.shadowColor = UIColor.gray.cgColor
        homeBtn.layer.shadowOpacity = 1
        homeBtn.layer.shadowOffset = .zero
        homeBtn.layer.shadowRadius = 3
        homeBtn.center = CGPoint(x: 365, y: 750)
        
//        blurImage.layer.cornerRadius = 180
        blurImage.layer.cornerRadius = blurImage.frame.height/2
        blurImage.clipsToBounds = true
        
        
        
    }

    @IBAction func backHome(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "backback") as! memuViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recentAccount()
        getdata()
        imageset()
        shadow()
        
        btn1.layer.cornerRadius = 5
        btn2.layer.cornerRadius = 5
        
        if let navigationController = self.navigationController {
            let navigationBar = navigationController.navigationBar
            let navBorder: UIView = UIView(frame: CGRect(x: 0, y: navigationBar.frame.size.height - 1.5, width: navigationBar.frame.size.width, height: 1.5))
            navBorder.backgroundColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1)
            navBorder.isOpaque = true
            self.navigationController?.navigationBar.addSubview(navBorder)
        }
        
    }
    
    func imageset(){
        let lineWidth: CGFloat = 5
        let path = UIBezierPath(polygonIn: showImagePer1.bounds, sides: 6, lineWidth: lineWidth, cornerRadius: 30)

        let mask = CAShapeLayer()
        mask.path            = path.cgPath
        mask.lineWidth       = lineWidth
        mask.strokeColor     = UIColor.clear.cgColor
        mask.fillColor       = UIColor.white.cgColor
        showImagePer1.layer.mask = mask

        let border = CAShapeLayer()
        border.path          = path.cgPath
        border.lineWidth     = lineWidth
        border.strokeColor   = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1).cgColor
        border.fillColor     = UIColor.clear.cgColor
        showImagePer1.layer.addSublayer(border)
//
//        showImagePer1.layer.cornerRadius = showImagePer1.frame.size.width / 2
//        showImagePer1.clipsToBounds = true
    }
    
    func recentAccount(){
        let user = Auth.auth().currentUser
        if let user = user{
        //            IDlabel.text = user.uid
        //            EmailLabel.text = user.email
            showNamePer1.text = user.displayName
            showImagePer1.image = UIImage(data: NSData(contentsOf: user.photoURL!)! as Data)
            
          

            
                }
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
                        let oldd = document.get("old") as! String
                        let weightt = document.get("weight") as! String
                        let hightt = document.get("hight") as! String
                        let idPatient = document.get("idPatient") as! String
                        let idPatientt = "ID: \(idPatient)"
                    
                        self.showOldPer1.text = oldd
                        self.showWeightPer1.text = weightt
                        self.showHightPer1.text = hightt
                        self.IdP.text = idPatientt
                        
                        //ค่าBMI
                        var Hight = Double(hightt)
                        var BmiHight = Double()
                        BmiHight = Double(Hight! / 100)
                        
                        var hBmi = BmiHight * 2
                        var wBmi = Double(weightt)
                        var tt = wBmi! / hBmi
                        print(tt)
                        var bmii = ""
                        
                        
                        if tt >= 30{
                            bmii = "อ้วนมาก"
                            self.bmi.text = bmii
                            print("อ้วนมาก")
                        }
                        else if tt > 25.0 && tt < 29.9 {
                            bmii = "อ้วน"
                            self.bmi.text = bmii
                            print("อ้วน")
                        }
                        else if tt > 23.0 && tt < 24.9 {
                            bmii = "น้ำหนักเกิน"
                            self.bmi.text = bmii
                            print("น้ำหนักเกิน")
                        }
                        else if tt > 18.4 && tt < 22.9 {
                            bmii = "น้ำหนักปกติ(สมส่วน)"
                            self.bmi.text = bmii
                            print("น้ำหนักปกติ(สมส่วน)")
                        }
                        else if tt < 18.4 {
                            bmii = "น้ำหนักต่ำกว่าเกณฑ์"
                            self.bmi.text = bmii
                            print("น้ำหนักต่ำกว่าเกณฑ์")
                        }
//
                }
               
           }
       }
   }
 
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {


    }
}

//รูปprofile หกเหลียม
extension UIBezierPath {
    convenience init(polygonIn rect: CGRect, sides: Int, lineWidth: CGFloat = 1, cornerRadius: CGFloat = 0) {
    self.init()

    let theta = 2 * .pi / CGFloat(sides)
    let offset = cornerRadius * tan(theta / 2)
    let squareWidth = min(rect.width, rect.height)

    var length = squareWidth - lineWidth
    if sides % 4 != 0 {
        length = length * cos(theta / 2) + offset / 2
    }
        let sideLength = length * tan(theta / 2)
        var point = CGPoint(x: rect.midX + sideLength / 2 - offset, y: rect.midY + length / 2)
        var angle = CGFloat.pi

       move(to: point)

       for _ in 0 ..< sides {
           point = CGPoint(x: point.x + (sideLength - offset * 2) * cos(angle), y: point.y + (sideLength - offset * 2) * sin(angle))
           addLine(to: point)

           let center = CGPoint(x: point.x + cornerRadius * cos(angle + .pi / 2), y: point.y + cornerRadius * sin(angle + .pi / 2))
           addArc(withCenter: center, radius: cornerRadius, startAngle: angle - .pi / 2, endAngle: angle + theta - .pi / 2, clockwise: true)

           point = currentPoint
           angle += theta
       }
        close()
        self.lineWidth = lineWidth
        lineJoinStyle = .round
    }

}
