//
//  testView2Controller.swift
//  bb
//
//  Created by hathaitat on 11/4/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit

class testView2Controller: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btnBack: UIButton!
        
    @IBOutlet weak var action11: UIButton! //ส่วนที่1
    @IBOutlet weak var action22: UIButton! //ส่วนที่2
    @IBOutlet weak var action33: UIButton! //ส่วนที่3
    
    @IBOutlet weak var body: UIImageView!
    
    var btn1Center: CGPoint!
    var btn2Center: CGPoint!
    var btn3Center: CGPoint!
    var btn4Center: CGPoint!
    var btn5Center: CGPoint!
        
    var test = ""
        
    @IBOutlet weak var btn11: UIButton!
    @IBOutlet weak var btn22: UIButton!
    @IBOutlet weak var btn33: UIButton!
    @IBOutlet weak var btn333: UIButton!
    @IBOutlet weak var btn44: UIButton!
    @IBOutlet weak var btn55: UIButton!
        
    //ปุ่มที่1
    @IBOutlet weak var image1: UIButton!
    @IBOutlet weak var one: UILabel!
    @IBOutlet weak var text1: UITextView!
        
    //ปุ่มที่2
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var two: UILabel!
    @IBOutlet weak var text2: UITextView!
        
    //ปุ่มที่3
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var three: UILabel!
    @IBOutlet weak var text3: UITextView!
    
    //ปุ่มที่4
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var four: UILabel!
    @IBOutlet weak var text4: UITextView!
    
    //ปุ่มที่5
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var five: UILabel!
    @IBOutlet weak var text5: UITextView!
    
  
    func shadow(){
        btn1.layer.cornerRadius = 7
        btn2.layer.cornerRadius = 7
        btn3.layer.cornerRadius = 7
        btn4.layer.cornerRadius = 7
        btn5.layer.cornerRadius = 7
            
        btnBack.layer.shadowColor = UIColor.gray.cgColor
        btnBack.layer.shadowOpacity = 1
        btnBack.layer.shadowOffset = .zero
        btnBack.layer.shadowRadius = 2
            
        btnBack.center = CGPoint(x: 365, y: 750)
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        shadow()
            
        btn5Center = btn5.center
        btn4Center = btn4.center
        btn3Center = btn3.center
        btn2Center = btn2.center
        btn1Center = btn1.center
            
        btn1.center = action11.center
        btn2.center = action11.center
        btn3.center = action22.center
        btn4.center = action33.center
        btn5.center = action33.center
            
        
        btn1.isHidden = true
        btn2.isHidden = true
        btn3.isHidden = true
            
        btn11.isHidden = true
        btn22.isHidden = true
        btn33.isHidden = true
        btn333.isHidden = true
        btn44.isHidden = true
        btn55.isHidden = true
            
        image2.isHidden = true
        two.isHidden = true
        text2.isHidden = true
        
        image1.isHidden = true
        one.isHidden = true
        text1.isHidden = true
        
        image3.isHidden = true
        three.isHidden = true
        text3.isHidden = true
        
        image4.isHidden = true
        four.isHidden = true
        text4.isHidden = true
            
        image5.isHidden = true
        five.isHidden = true
        text5.isHidden = true
            
        if let navigationController = self.navigationController {
            let navigationBar = navigationController.navigationBar
            let navBorder: UIView = UIView(frame: CGRect(x: 0, y: navigationBar.frame.size.height - 1.5, width: navigationBar.frame.size.width, height: 1.5))
            navBorder.backgroundColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1)
            navBorder.isOpaque = true
        self.navigationController?.navigationBar.addSubview(navBorder)
            }


        }
        
    @IBAction func action3(_ sender: Any) {
        if btn44.isHidden == true{
            btn4.isHidden = false
            btn5.isHidden = false
            btn44.isHidden = false
            btn55.isHidden = false
                
            image4.isHidden = false
            four.isHidden = false
            text4.isHidden = false
                
            image5.isHidden = false
            five.isHidden = false
            text5.isHidden = false
            
            btn1.isHidden = true
            btn2.isHidden = true
            btn22.isHidden = true
            btn11.isHidden = true
        
            image1.isHidden = true
            one.isHidden = true
            text1.isHidden = true
                
            image2.isHidden = true
            two.isHidden = true
            text2.isHidden = true
                
            btn3.isHidden = true
            btn333.isHidden = true
            btn33.isHidden = true
                
            image3.isHidden = true
            three.isHidden = true
            text3.isHidden = true
                
                
            action33.setTitle("", for: .normal)
            action11.setTitle("ส่วนที่ 1", for: .normal)
            action22.setTitle("ส่วนที่ 2", for: .normal)
            
                
            UIView.animate(withDuration: 0.3, animations: {
                self.btn4.center = self.btn4Center
                self.btn5.center = self.btn5Center
                    
                })
            }
            else{
                btn44.isHidden = true
                btn55.isHidden = true
                
                image4.isHidden = true
                four.isHidden = true
                text4.isHidden = true
                
                image5.isHidden = true
                five.isHidden = true
                text5.isHidden = true
                
                btn1.isHidden = true
                btn2.isHidden = true
                btn22.isHidden = true
                btn11.isHidden = true
                
                image1.isHidden = true
                one.isHidden = true
                text1.isHidden = true
                
                image2.isHidden = true
                two.isHidden = true
                text2.isHidden = true
                
                btn3.isHidden = true
                btn333.isHidden = true
                btn33.isHidden = true
                
                image3.isHidden = true
                three.isHidden = true
                text3.isHidden = true
                
                action33.setTitle("ส่วนที่ 3", for: .normal)
                
                
                UIView.animate(withDuration: 1, animations: {
                    self.btn4.center = self.action33.center
                    self.btn5.center = self.action33.center
                    
                })
                
            }
        }
        
        
    @IBAction func action2(_ sender: Any) {
        if btn33.isHidden == true{
            btn3.isHidden = false
            btn333.isHidden = false
            btn33.isHidden = false
                
            image3.isHidden = false
            three.isHidden = false
            text3.isHidden = false
            
            btn1.isHidden = true
            btn2.isHidden = true
            btn22.isHidden = true
            btn11.isHidden = true
                
            image1.isHidden = true
            one.isHidden = true
            text1.isHidden = true
                
            image2.isHidden = true
            two.isHidden = true
            text2.isHidden = true
                
            btn4.isHidden = true
            btn5.isHidden = true
            btn44.isHidden = true
            btn55.isHidden = true
                
            image4.isHidden = true
            four.isHidden = true
            text4.isHidden = true
            
            image5.isHidden = true
            five.isHidden = true
            text5.isHidden = true
                
            action22.setTitle("", for: .normal)
            action11.setTitle("ส่วนที่ 1", for: .normal)
            action33.setTitle("ส่วนที่ 3", for: .normal)
                
            UIView.animate(withDuration: 0.3, animations: {
                self.btn3.center = self.btn3Center
                    
                })
            }
            else{
                btn33.isHidden = true
                btn333.isHidden = true
                
                image3.isHidden = true
                three.isHidden = true
                text3.isHidden = true
                
                btn1.isHidden = true
                btn2.isHidden = true
                btn22.isHidden = true
                btn11.isHidden = true
                
                image1.isHidden = true
                one.isHidden = true
                text1.isHidden = true
                
                image2.isHidden = true
                two.isHidden = true
                text2.isHidden = true
                
                btn4.isHidden = true
                btn5.isHidden = true
                btn44.isHidden = true
                btn55.isHidden = true
                
                image4.isHidden = true
                four.isHidden = true
                text4.isHidden = true
                
                image5.isHidden = true
                five.isHidden = true
                text5.isHidden = true
                
                action22.setTitle("ส่วนที่ 2", for: .normal)
                
                
                UIView.animate(withDuration: 1, animations: {
                    self.btn3.center = self.action22.center
                    
                })
                
            }
        }
    @IBAction func action1(_ sender: UIButton) {
        if btn11.isHidden == true{
            btn1.isHidden = false
            btn2.isHidden = false
                
            btn22.isHidden = false
            btn11.isHidden = false
                
            image1.isHidden = false
            one.isHidden = false
            text1.isHidden = false
                
            image2.isHidden = false
            two.isHidden = false
            text2.isHidden = false
            
            btn3.isHidden = true
            btn333.isHidden = true
            btn33.isHidden = true
                
            image3.isHidden = true
            three.isHidden = true
            text3.isHidden = true
                
            btn4.isHidden = true
            btn5.isHidden = true
            btn44.isHidden = true
            btn55.isHidden = true
                
            image4.isHidden = true
            four.isHidden = true
            text4.isHidden = true
                
            image5.isHidden = true
            five.isHidden = true
            text5.isHidden = true
                
            action11.setTitle("", for: .normal)
            action33.setTitle("ส่วนที่ 3", for: .normal)
            action22.setTitle("ส่วนที่ 2", for: .normal)
                
            UIView.animate(withDuration: 0.3, animations: {
                self.btn1.center = self.btn1Center
                self.btn2.center = self.btn2Center
                   
                })
            }
            else{
                btn11.isHidden = true
                btn22.isHidden = true
                
                image1.isHidden = true
                one.isHidden = true
                text1.isHidden = true
                
                image2.isHidden = true
                two.isHidden = true
                text2.isHidden = true
                
                btn3.isHidden = true
                btn333.isHidden = true
                btn33.isHidden = true
                
                image3.isHidden = true
                three.isHidden = true
                text3.isHidden = true
                
                btn4.isHidden = true
                btn5.isHidden = true
                
                btn44.isHidden = true
                btn55.isHidden = true
                
                image4.isHidden = true
                four.isHidden = true
                text4.isHidden = true
                
                image5.isHidden = true
                five.isHidden = true
                text5.isHidden = true
                
                
                action11.setTitle("ส่วนที่ 1", for: .normal)
                
                
                UIView.animate(withDuration: 1, animations: {
                    self.btn1.center = self.action11.center
                    self.btn2.center = self.action11.center
                                    
                })
                
            }
        }
        
        
    @IBAction func actionBtn1(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "test2") as! test2ViewController
        test = "1"
            vc.test1 = test
            self.present(vc, animated: true, completion: nil)
        }
        
        @IBAction func actionBtn2(_ sender: Any) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "test2") as! test2ViewController
            test = "2"
            vc.test1 = test
            self.present(vc, animated: true, completion: nil)
        }
        
        @IBAction func actionBtn3(_ sender: Any) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "test2") as! test2ViewController
            test = "3"
            vc.test1 = test
            self.present(vc, animated: true, completion: nil)
        }
        
        @IBAction func actionBtn4(_ sender: Any) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "test2") as! test2ViewController
            test = "4"
            vc.test1 = test
            self.present(vc, animated: true, completion: nil)
        }
        
        @IBAction func actionBtn5(_ sender: Any) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "test2") as! test2ViewController
            test = "5"
            vc.test1 = test
            self.present(vc, animated: true, completion: nil)
        }
        
        @IBAction func actionBtn11(_ sender: Any) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "test2") as! test2ViewController
            test = "1"
            vc.test1 = test
            self.present(vc, animated: true, completion: nil)
        }
        
        @IBAction func actionBtn22(_ sender: Any) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "test2") as! test2ViewController
            test = "2"
            vc.test1 = test
            self.present(vc, animated: true, completion: nil)
        }
        
        @IBAction func actionBtn33(_ sender: Any) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "test2") as! test2ViewController
            test = "3"
            vc.test1 = test
            self.present(vc, animated: true, completion: nil)
        }
        
        @IBAction func actionBtn333(_ sender: Any) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "test2") as! test2ViewController
            test = "3"
            vc.test1 = test
            self.present(vc, animated: true, completion: nil)
        }
        
        @IBAction func actionBtn44(_ sender: Any) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "test2") as! test2ViewController
            test = "4"
            vc.test1 = test
            self.present(vc, animated: true, completion: nil)
        }
        
        @IBAction func actionBtn55(_ sender: Any) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "test2") as! test2ViewController
            test = "5"
            vc.test1 = test
            self.present(vc, animated: true, completion: nil)
        }
        
        
        func toggleButton(button: UIButton, onImage: UIImage, offImage: UIImage){
            if button.currentImage == offImage{
                button.setImage(onImage, for: .normal)
            }else{
                button.setImage(offImage, for: .normal)
            }
        }
        
        
        override func viewWillAppear(_ animated: Bool) {
        }
        
    }
