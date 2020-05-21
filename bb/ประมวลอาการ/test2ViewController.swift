//
//  test2ViewController.swift
//  bb
//
//  Created by hathaitat on 11/4/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import ApiAI
import AVFoundation

class test2ViewController: UIViewController {

    var gg:String=""
        var result = String()
        var result2 = [String]()
        
        let pp = "ท่านมี"
        let oo = "หรือไม่"
        var aa = ""
        
        var sendMessageText = ""
        var sendMessage1Text = ""
        
        var test1 = ""
        
        @IBOutlet weak var messageField: UITextField!

        @IBOutlet weak var chipResponse: UITextView!
        @IBOutlet weak var text1BntShow: UIButton!
    //    @IBOutlet weak var viewShow: UIView!
        
        @IBOutlet weak var imageHid: UIImageView!
        @IBOutlet weak var btn1Hid: UIButton!
        @IBOutlet weak var btn2Hid: UIButton!
        @IBOutlet weak var infoHid: UILabel!
        
        @IBOutlet weak var startBtn: UIButton!
        @IBOutlet weak var noBtn: UIButton!
        @IBOutlet weak var yesBtn: UIButton!
        @IBOutlet weak var homeBtn: UIButton!
        @IBOutlet weak var top: UIView!
        @IBOutlet weak var viewback: UIView!
        @IBOutlet weak var cirView: UIImageView!
        
        @IBOutlet weak var text1: UILabel!
        @IBOutlet weak var text2: UILabel!
        
        @IBOutlet weak var again: UIButton!
       
        
        //ฟังชั่นเปลี่ยนข้อความและพื้นหลัง
        func changAll(){
            if test1 == "1"{
                text1.text = "อาการหมายเลข 1"
                text2.text = "ช่วงกลางท้อง"
                viewback.layer.cornerRadius = 5
                viewback.backgroundColor = UIColor(red: 253/255, green: 183/255, blue: 41/255, alpha: 1)
            }
            else if test1 == "2"{
                text1.text = "อาการหมายเลข 2"
                text2.text = "ช่วงใต้ชายโครงด้านขวา"
                viewback.layer.cornerRadius = 5
                viewback.backgroundColor = UIColor(red: 121/255, green: 203/255, blue: 189/255, alpha: 1)
            }
            else if test1 == "3"{
                text1.text = "อาการหมายเลข 3"
                text2.text = "ช่วงท้องน้อยด้านซ้ายหรือขวา"
                viewback.layer.cornerRadius = 5
                viewback.backgroundColor = UIColor(red: 77/255, green: 195/255, blue: 240/255, alpha: 1)
            }
            else if test1 == "4"{
                text1.text = "อาการหมายเลข 4"
                text2.text = "ช่วงรอบสะดือ"
                viewback.layer.cornerRadius = 5
                viewback.backgroundColor = UIColor(red: 238/255, green: 72/255, blue: 133/255, alpha: 1)
            }
            else if test1 == "5"{
                text1.text = "อาการหมายเลข 5"
                text2.text = "ช่วงท้องน้อย"
                viewback.layer.cornerRadius = 5
                viewback.backgroundColor = UIColor(red: 246/255, green: 135/255, blue: 63/255, alpha: 1)
            }
        }
        
        @IBAction func btnAgain(_ sender: Any) {
            result2.removeAll()
            if test1 == "1"{
                startt()
            }
            else if test1 == "2"{
                startt2()
            }
            else if test1 == "3"{
                startt3()
            }
            else if test1 == "4"{
                startt4()
            }
            else if test1 == "5"{
                startt5()
            }
        }
        
        //ปุ่มเริ่มคำถาม
        @IBAction func text1Bnt(_ sender: Any) {
            if (text1BntShow.isHidden == true){
                text1BntShow.isHidden = false
                
            }else{
                text1BntShow.isHidden = true
            }
            chipResponse.isHidden = false
            btn1Hid.isHidden = false
            btn2Hid.isHidden = false
            infoHid.isHidden = false
            again.isHidden = false
            if test1 == "1"{
                startt()
            }
            else if test1 == "2"{
                startt2()
            }
            else if test1 == "3"{
                startt3()
            }
            else if test1 == "4"{
                startt4()
            }
            else if test1 == "5"{
                startt5()
            }
            

        }
        
        
        //ปุ่มตอบใช่
        @IBAction func sendMessage(_ sender: UIButton) {
            sendMessageText = "ใช่"
            if test1 == "1"{
                yess()
            }
            else if test1 == "2"{
                yess2()
            }
            else if test1 == "3"{
                yess3()
            }
            else if test1 == "4"{
                yess4()
            }
            else if test1 == "5"{
                yess5()
            }
            
            }
            
            
        //ปุ่มตอบไม่
        @IBAction func sendMessage1(_ sender: UIButton) {
            sendMessage1Text = "ไม่"
            if test1 == "1"{
                noo()
            }
            else if test1 == "2"{
                noo2()
            }
            else if test1 == "3"{
                noo3()
            }
            else if test1 == "4"{
                noo4()
            }
            else if test1 == "5"{
                noo5()
            }
            
        }
        
        
        
        //function เริ่มต้น ปุ่มกดเริ่มต้น
    func startt(){
            
            let configuration = AIDefaultConfiguration()
            configuration.clientAccessToken = "c803492f3d8c47f893c3afa4869442ec"
            
            let apiai = ApiAI.shared()
            apiai?.configuration = configuration

            let request = ApiAI.shared().textRequest()
            if let text1Bnt: String = "เริ่มคำถาม"{
                request?.query = text1Bnt
                print(text1Bnt)
                }
                else {
                }
            request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
            if let textResponse = response.result.fulfillment.speech {
                var tt = self.pp + textResponse + self.oo
                print(tt)
                self.speechAndText(text: tt)
                    
    //            self.speechAndText(text: textResponse)
                print(textResponse)
                self.result2.append(textResponse)
                }
                }, failure: { (request, error) in
                print(error!)
                })
                ApiAI.shared().enqueue(request)
            //      print(result)
        }
        
        //ตับถุงน้ำดี//
        func startt2(){
                
                let configuration = AIDefaultConfiguration()
                configuration.clientAccessToken = "9119bd77e52244abbcbad6213b3719fa"
                
                let apiai = ApiAI.shared()
                apiai?.configuration = configuration

                let request = ApiAI.shared().textRequest()
                if let text1Bnt: String = "เริ่มคำถาม"{
                    request?.query = text1Bnt
                    print(text1Bnt)
                    }
                    else {
                    }
                request?.setMappedCompletionBlockSuccess({ (request, response) in
                let response = response as! AIResponse
                if let textResponse = response.result.fulfillment.speech {
                    var tt = self.pp + textResponse + self.oo
                    print(tt)
                    self.speechAndText(text: tt)
                    print(textResponse)
                    self.result2.append(textResponse)
                    }
                    }, failure: { (request, error) in
                    print(error!)
                    })
                    ApiAI.shared().enqueue(request)
            }
        
        //ไต//
        func startt3(){
                
                let configuration = AIDefaultConfiguration()
                configuration.clientAccessToken = "5750bce7d09f4ce3a3d8906d7e49618e"
                
                let apiai = ApiAI.shared()
                apiai?.configuration = configuration

                let request = ApiAI.shared().textRequest()
                if let text1Bnt: String = "เริ่มคำถาม"{
                    request?.query = text1Bnt
                    print(text1Bnt)
                    }
                    else {
                    }
                request?.setMappedCompletionBlockSuccess({ (request, response) in
                let response = response as! AIResponse
                if let textResponse = response.result.fulfillment.speech {
                    var tt = self.pp + textResponse + self.oo
                    print(tt)
                    self.speechAndText(text: tt)
                    print(textResponse)
                    self.result2.append(textResponse)
                    }
                    }, failure: { (request, error) in
                    print(error!)
                    })
                    ApiAI.shared().enqueue(request)
            }
        
        
        //ลำไส้//
        func startt4(){
                
                let configuration = AIDefaultConfiguration()
                configuration.clientAccessToken = "010d039c624746759f3083801ae527d0"
                
                let apiai = ApiAI.shared()
                apiai?.configuration = configuration

                let request = ApiAI.shared().textRequest()
                if let text1Bnt: String = "เริ่มคำถาม"{
                    request?.query = text1Bnt
                    print(text1Bnt)
                    }
                    else {
                    }
                request?.setMappedCompletionBlockSuccess({ (request, response) in
                let response = response as! AIResponse
                if let textResponse = response.result.fulfillment.speech {
                    var tt = self.pp + textResponse + self.oo
                    print(tt)
                    self.speechAndText(text: tt)
                    print(textResponse)
                    self.result2.append(textResponse)
                    }
                    }, failure: { (request, error) in
                    print(error!)
                    })
                    ApiAI.shared().enqueue(request)
            }
        
        //กระเพาะปัสสาวะ เปลี่ยนโทเค้น//
        func startt5(){
                
                let configuration = AIDefaultConfiguration()
                configuration.clientAccessToken = "055a84106bdd4f9e9320e9ab4486d01c"
                
                let apiai = ApiAI.shared()
                apiai?.configuration = configuration

                let request = ApiAI.shared().textRequest()
                if let text1Bnt: String = "เริ่มคำถาม"{
                    request?.query = text1Bnt
                    print(text1Bnt)
                    }
                    else {
                    }
                request?.setMappedCompletionBlockSuccess({ (request, response) in
                let response = response as! AIResponse
                if let textResponse = response.result.fulfillment.speech {
                    var tt = self.pp + textResponse + self.oo
                    print(tt)
                    self.speechAndText(text: tt)
                    print(textResponse)
                    self.result2.append(textResponse)
                    }
                    }, failure: { (request, error) in
                    print(error!)
                    })
                    ApiAI.shared().enqueue(request)
            }
        
        // "1" = 90% //
        // "2" = 10% //
        // "3" = 30% //
        // "4" = 60%
        
        //function ที่ตอบใช่////////////////////////////////////
        //กระเพาะ//
    func yess(){
        let configuration = AIDefaultConfiguration()
        configuration.clientAccessToken = "c803492f3d8c47f893c3afa4869442ec"

        let apiai = ApiAI.shared()
        apiai?.configuration = configuration

        let request = ApiAI.shared().textRequest()
            if sendMessageText == "ใช่"{
                request?.query = sendMessageText
                print(sendMessageText)
            }else {
                return
            }
            request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
            if let textResponse = response.result.fulfillment.speech {
                var tt = self.pp + textResponse + self.oo
                print(tt)
                self.speechAndText(text: tt)
                            
                    // อาการ
                self.result2.append(textResponse)
                print(self.result2)
                                
                if textResponse == "ประมวลผล...." {
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.result = "โรคพยาธิตืดหมู"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                        }
                    else if textResponse == "ประมวลผล......" {
                        self.result = "โรคติดเชื้อเอชไพโลไร"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                            vc.showdata = self.result
                            vc.showdata2 = joined
                            vc.bb = self.aa
                            self.present(vc, animated: true, completion: nil)
                        }
                    else if textResponse == "ประมวลผล.........." {
                        self.result = "โรคกรดไหลย้อน"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                        }
                    else if textResponse == "ประมวลผล......." {
                        self.result = "โรคกระเพาะอาหารอักเสบ, อาหารไม่ย่อย(ธาตุพิการ)"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                        }
                    else if textResponse == "ประมวลผล........" {
                        self.result = "อาหารไม่ย่อย(ธาตุพิการ), โรคกระเพาะอาหารอักเสบ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                        }
                                    }
                                }, failure: { (request, error) in
                                    print(error!)
                                })
                                    ApiAI.shared().enqueue(request)
    //                                print(result)
                                                                
        }
        
        //function ที่ตอบใช่ หมายเลข2//////////////////////////////////// ยังไม่แก้
        //ตับ ถุงน้ำดี//
        func yess2(){
            let configuration = AIDefaultConfiguration()
            configuration.clientAccessToken = "9119bd77e52244abbcbad6213b3719fa"

            let apiai = ApiAI.shared()
            apiai?.configuration = configuration

            let request = ApiAI.shared().textRequest()
                if sendMessageText == "ใช่"{
                    request?.query = sendMessageText
                    print(sendMessageText)
                }else {
                            return
                }

                request?.setMappedCompletionBlockSuccess({ (request, response) in
                let response = response as! AIResponse
                if let textResponse = response.result.fulfillment.speech {
                    var tt = self.pp + textResponse + self.oo
                    print(tt)
                    self.speechAndText(text: tt)
                                
                        // อาการ
                self.result2.append(textResponse)
                print(self.result2)
                                    
                if textResponse == "ประมวลผล1" {
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.result = "โรคติ่งเนื้อในถุงน้ำดี"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                    }
                else if textResponse == "ประมวลผล2" {
                    self.result = "โรคไวรัสตับอักเสบ บี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล3" {
                        self.result = "โรคไวรัสตับอักเสบ บี"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล4" {
                        self.result = "โรคไวรัสตับอักเสบ เอ, ภาวะตับโต, ภาวะม้ามตับโต"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล5" {
                        self.result = "โรคไวรัสตับอักเสบ เอ, ภาวะตับโต, ภาวะม้ามตับโต, โรคโพรงเลือดดำที่ตับอุดตัน"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล6" {
                        self.result = "โรคโพรงเลือดดำที่ตับอุดตัน"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล7" {
                        self.result = "โรคไขมันพอกตับ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล8" {
                        self.result = "โรคไขมันพอกตับ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล9" {
                        self.result = "โรคไขมันพอกตับ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล10" {
                        self.result = "โรคไขมันพอกตับ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล11" {
                        self.result = "โรคไขมันพอกตับ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล12" {
                        self.result = "โรคไขมันพอกตับ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล13" {
                        self.result = "โรคไขมันพอกตับ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล14" {
                        self.result = "โรคนิ่วในถุงน้ำดี"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล15" {
                        self.result = "โรคตับอัเสบ หรือพิษตับ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล16" {
                        self.result = "โรคตับอัเสบ หรือพิษตับ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล17" {
                        self.result = "โรคผีที่ตับ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล18" {
                        self.result = "โรคผีที่ตับ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล19" {
                        self.result = "โรคตับแข็ง, โรคตับวาย หรือตับล้มเหลว"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล20" {
                        self.result = "โรคตับแข็ง, โรคตับวาย หรือตับล้มเหลว"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล21" {
                        self.result = "โรคตับแข็ง, โรคตับวาย หรือตับล้มเหลว"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล22" {
                        self.result = "โรคไวรัสตับอักเสบ ซี, โรคไวรัสตับอักเสบ ดี, โรคไวรัสตับอักเสบ อี"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล23" {
                        self.result = "โรคไวรัสตับอักเสบ ซี, โรคไวรัสตับอักเสบ ดี"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล24" {
                        self.result = "โรคไวรัสตับอักเสบ ซี"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล25" {
                        self.result = "โรคดีซ่าน"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล26" {
                        self.result = "โรคไวรัสตับอักเสบ อี"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล27" {
                        self.result = "โรคไวรัสตับอักเสบ อี"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "3"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล28" {
                        self.result = "โรคไวรัสตับอักเสบ อี"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "3"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล29" {
                        self.result = "โรคไวรัสตับอักเสบ อี"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "3"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล30" {
                        self.result = "แพ้ยาแอสไพริน, ภาวะน้ำตาลในเลือดต่ำ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล31" {
                        self.result = "โรคตับอ่อน, โรคตับอ่่อนอักเสบ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล32" {
                        self.result = "โรคตับอ่่อนอักเสบเฉียบพลัน"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล33" {
                        self.result = "โรคตับอ่่อนอักเสบเรื้อรัง"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล34" {
                        self.result = "เลือดเป็นกรดจากคีโตนของโรคเบาหวาน"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "3"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                        
                        
                        
                                        }
                                    }, failure: { (request, error) in
                                        print(error!)
                                    })
                                        ApiAI.shared().enqueue(request)
        //                                print(result)
                                                                    
                                    }
        
        //function ที่ตอบใช่ หมายเลข3//////////////////////////////////// ยังไม่แก้
        //ไต//
        func yess3(){
                let configuration = AIDefaultConfiguration()
                configuration.clientAccessToken = "5750bce7d09f4ce3a3d8906d7e49618e"

                let apiai = ApiAI.shared()
                apiai?.configuration = configuration

                let request = ApiAI.shared().textRequest()
                    if sendMessageText == "ใช่"{
                        request?.query = sendMessageText
                        print(sendMessageText)
                        }else {
                                return
                        }

                    request?.setMappedCompletionBlockSuccess({ (request, response) in
                    let response = response as! AIResponse
                    if let textResponse = response.result.fulfillment.speech {
                        var tt = self.pp + textResponse + self.oo
                        print(tt)
                        self.speechAndText(text: tt)
                                    
                        // อาการ
                        self.result2.append(textResponse)
                        print(self.result2)
                                    
                        if textResponse == "ประมวลผล11" {
                            self.chipResponse.text = "ประมวลผลอาการ"
                            self.result = "โรคไตเรื้องรัง"
                            self.aa = "1"
                            self.result2.removeLast()
                            let joined = self.result2.joined(separator: ", ")
                            let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                            vc.showdata = self.result
                            vc.showdata2 = joined
                            vc.bb = self.aa
                            self.present(vc, animated: true, completion: nil)
                                }
                        else if textResponse == "ประมวลผล13" {
                            self.result = "โรคภาวะไตวาย"
                            self.chipResponse.text = "ประมวลผลอาการ"
                            self.aa = "1"
                            self.result2.removeLast()
                            let joined = self.result2.joined(separator: ", ")
                            let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                            vc.showdata = self.result
                            vc.showdata2 = joined
                            vc.bb = self.aa
                            self.present(vc, animated: true, completion: nil)
                        }
                        else if textResponse == "ประมวลผล22" {
                            self.result = "โรคนิ่วในไตและท่อไต"
                            self.chipResponse.text = "ประมวลผลอาการ"
                            self.aa = "1"
                            self.result2.removeLast()
                            let joined = self.result2.joined(separator: ", ")
                            let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                            vc.showdata = self.result
                            vc.showdata2 = joined
                            vc.bb = self.aa
                            self.present(vc, animated: true, completion: nil)
                            }
                        else if textResponse == "ประมวลผล16" {
                            self.result = "โรคนิ่วในไตและท่อไต"
                            self.chipResponse.text = "ประมวลผลอาการ"
                            self.aa = "1"
                            self.result2.removeLast()
                            let joined = self.result2.joined(separator: ", ")
                            let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                            vc.showdata = self.result
                            vc.showdata2 = joined
                            vc.bb = self.aa
                            self.present(vc, animated: true, completion: nil)
                            }
                        else if textResponse == "ประมวลผล15" {
                            self.result = "โรคนิ่วในไตและท่อไต"
                            self.chipResponse.text = "ประมวลผลอาการ"
                            self.aa = "1"
                            self.result2.removeLast()
                            let joined = self.result2.joined(separator: ", ")
                            let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                            vc.showdata = self.result
                            vc.showdata2 = joined
                            vc.bb = self.aa
                            self.present(vc, animated: true, completion: nil)
                            }
                        else if textResponse == "ประมวลผล19" {
                        self.result = "โรคกรวยไตอักเสบ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                        }
                        else if textResponse == "ประมวลผล18" {
                        self.result = "โรคกรวยไตอักเสบ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                        }
                                        }
                                    }, failure: { (request, error) in
                                        print(error!)
                                    })
                                        ApiAI.shared().enqueue(request)
        //                                print(result)
                                                                    
                                    }
        
        
        //function ที่ตอบใช่ หมายเลข4
        //ลำไส้//
        func yess4(){
            let configuration = AIDefaultConfiguration()
            configuration.clientAccessToken = "010d039c624746759f3083801ae527d0"

            let apiai = ApiAI.shared()
            apiai?.configuration = configuration

            let request = ApiAI.shared().textRequest()
            if sendMessageText == "ใช่"{
                request?.query = sendMessageText
                print(sendMessageText)
            }else {
                return
            }

            request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
            if let textResponse = response.result.fulfillment.speech {
                var tt = self.pp + textResponse + self.oo
                print(tt)
                self.speechAndText(text: tt)
                                    
            // อาการ
            self.result2.append(textResponse)
            print(self.result2)
                                    
            if textResponse == "ประมวลผล" {
                self.chipResponse.text = "ประมวลผลอาการ"
                self.result = "ท้องผูก, ท้องเสีย, โรคลำไส้ใหญ่อักเสบ"
                self.aa = "3"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
            else if textResponse == "ประมวลผล......." {
                self.result = "ท้องเสีย, โรคลำไส้ใหญ่อักเสบ"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "3"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
            else if textResponse == "ประมวลผล....." {
                self.result = "โรคโพลิพลำไส้ใหญ่"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "1"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
            else if textResponse == "ประมวลผล..." {
                self.result = "ท้องผูก"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "1"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
            else if textResponse == "ประมวลผล.........." {
                self.result = "อาหารเป็นพิษ, พยาธิตืดปลา"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "4"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
            else if textResponse == "ประมวลผล..........." {
                self.result = "อาหารเป็นพิษ"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "4"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
            else if textResponse == "ประมวลผล................" {
                self.result = "อาหารเป็นพิษ, ท้องเสีย, โรคลำไส้อักเสบ, โรคบิด"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "1"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
            else if textResponse == "ประมวลผล.............." {
                self.result = "อาหารเป็นพิษ, ท้องเสีย, โรคลำไส้อักเสบ, โรคบิด"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "1"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
                
                }
                
            }, failure: { (request, error) in
                print(error!)
                
            })
            ApiAI.shared().enqueue(request)
                                                                    
                                    }
        
        
        //function ที่ตอบใช่ หมายเลข5
        //กระเพาะปัสสาวะ//
        func yess5(){
            let configuration = AIDefaultConfiguration()
            configuration.clientAccessToken = "055a84106bdd4f9e9320e9ab4486d01c"

            let apiai = ApiAI.shared()
            apiai?.configuration = configuration

            let request = ApiAI.shared().textRequest()
            if sendMessageText == "ใช่"{
                request?.query = sendMessageText
                print(sendMessageText)
            }else {
                return
            }

            request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
            if let textResponse = response.result.fulfillment.speech {
                var tt = self.pp + textResponse + self.oo
                print(tt)
                self.speechAndText(text: tt)
                                    
            // อาการ
            self.result2.append(textResponse)
            print(self.result2)
                                    
            if textResponse == "ประมวลผล13" {
                self.chipResponse.text = "ประมวลผลอาการ"
                self.result = "โรคกระเพาะปัสสาวะอักเสบ, โรคกระเพาะปัสสาวะอักเสบเรื้อรังไม่ติดเชื้อ, โรคติดเชื้อระบบทางเดินปัสสาวะ, นิ่วในกระเพาะปัสสาวะ"
                self.aa = "3"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
            else if textResponse == "ประมวลผล14" {
                self.result = "โรคกระเพาะปัสสาวะอักเสบเรื้อรังไม่ติดเชื้อ"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "1"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
            else if textResponse == "ประมวลผล15" {
                self.result = "โรคกระเพาะปัสสาวะอักเสบ, โรคติดเชื้อระบบทางเดินปัสสาวะ, นิ่วในกระเพาะปัสสาวะ"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "1"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
            else if textResponse == "ประมวลผล16" {
                self.result = "โรคติดเชื้อระบบทางเดินปัสสาวะ"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "1"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
            else if textResponse == "ประมวลผล17" {
                self.result = "โรคกระเพาะปัสสาวะอักเสบ"
                self.chipResponse.text = "ประมวลผลอาการ"
                self.aa = "1"
                self.result2.removeLast()
                let joined = self.result2.joined(separator: ", ")
               let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                vc.showdata = self.result
                vc.showdata2 = joined
                vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
                
                }
                
            }, failure: { (request, error) in
                print(error!)
                
            })
            ApiAI.shared().enqueue(request)
                                                                    
                                    }
        
        
        
        //function ที่ตอบ ไม่
        //กระเพาะ หมายเลข1//
            func noo(){
            let configuration = AIDefaultConfiguration()
            configuration.clientAccessToken = "c803492f3d8c47f893c3afa4869442ec"
                    
            let apiai = ApiAI.shared()
            apiai?.configuration = configuration
                    
            let request = ApiAI.shared().textRequest()
                        
            if let sendMessage1: String = "ไม่"{
                request?.query = sendMessage1
                print(sendMessage1)
                }else {
                    return
                }
                        
                    
            request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
            if let textResponse = response.result.fulfillment.speech {
                var tt = self.pp + textResponse + self.oo
                print(tt)
                self.speechAndText(text: tt)
    //           print(textResponse)
                self.result2.append(textResponse)
    //            result2.append(textResponse)
                if textResponse == "ประมวลผล" {
                    self.result = "โรคที่เกี่ยวข้องกับกระเพาะอาหาร"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "2"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
    //             vc.showdata1.text = "giggg"
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                    }
                else if textResponse == "ประมวลผล." {
                    self.result = "โรคกรดไหลย้อน, โรคติดเชื้อเอชไพโลไร, โรคพยาธิตืดหมู"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "3"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                    }
                else if textResponse == "ประมวลผล.." {
                    self.result = "โรคติดเชื้อเอชไพโลไร, โรคพยาธิตืดหมู"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "4"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล.." {
                    self.result = "โรคพยาธิตืดหมู, โรคติดเชื้อเอชไพโลไร"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "4"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                                //             vc.showdata1.text = "giggg"
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล...." {
                    self.result = "โรคพยาธิตืดหมู"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                                //             vc.showdata1.text = "giggg"
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล....." {
                    self.result = "โรคติดเชื้อเอชไพโลไร, โรคพยาธิตืดหมู"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "3"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                                //             vc.showdata1.text = "giggg"
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล......" {
                    self.result = "โรคติดเชื้อเอชไพโลไร"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                                //             vc.showdata1.text = "giggg"
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล........" {
                    self.result = "อาหารไม่ย่อย ธาตุพิการ, โรคกระเพาะอาหารอักเสบ"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "4"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                                //             vc.showdata1.text = "giggg"
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล......." {
                    self.result = "โรคกระเพาะอาหารอักเสบ, อาหารไม่ย่อย ธาตุพิการ"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "4"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                                //             vc.showdata1.text = "giggg"
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล........." {
                    self.result = "โรคกรดไหลย้อน, โรคติดเชื้อเอชไพโลไร"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "4"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                                //             vc.showdata1.text = "giggg"
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล.........." {
                    self.result = "โรคกรดไหลย้อน"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                                //             vc.showdata1.text = "giggg"
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                     
                            }
                }, failure: { (request, error) in
                    print(error!)
                })
                        
                ApiAI.shared().enqueue(request)
    //                     messageField.text = ""
                
            print(result)
            
            }
        
        
        //ตับ ถุงน้ำดี หมายเลข2//  ยังไม่แก้
        func noo2(){
            let configuration = AIDefaultConfiguration()
            configuration.clientAccessToken = "9119bd77e52244abbcbad6213b3719fa"
                        
            let apiai = ApiAI.shared()
            apiai?.configuration = configuration
                        
            let request = ApiAI.shared().textRequest()
                            
            if let sendMessage1: String = "ไม่"{
                request?.query = sendMessage1
                print(sendMessage1)
            }else {
                    return
                    }
                            
                        
            request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
            if let textResponse = response.result.fulfillment.speech {
                var tt = self.pp + textResponse + self.oo
                print(tt)
                self.speechAndText(text: tt)
                self.result2.append(textResponse)
        //            result2.append(textResponse)
                if textResponse == "ประมวลผล35" {
                    self.result = "โรคที่เกี่ยวข้องกับตับหรือถุงน้ำดี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "2"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
        //            vc.showdata1.text = "giggg"
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                        }
                    else if textResponse == "ประมวลผล79" {
                    self.result = "โรคดีซ่าน"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "4"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล26" {
                        self.result = "โรคที่เกี่ยวข้องกับตับ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
                                                       //             vc.showdata1.text = "giggg"
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                else if textResponse == "ประมวลผล36" {
                    self.result = "โรคไวระสตับอักเสบ, โรคไวรัสตับอักเสบ เอ, โรคไวรัสตับอักเสบ บี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "4"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                    }
                else if textResponse == "ประมวลผล37" {
                    self.result = "โรคไวระสตับอักเสบ, โรคไวรัสตับอักเสบ เอ, โรคไวรัสตับอักเสบ บี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล38" {
                    self.result = "โรคไวรัสตับอักเสบ บี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล39" {
                    self.result = "โพรงเลือดดำที่ตับอุดตัน"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "4"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล40" {
                    self.result = "โรคไขมันพอกตับ"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล41" {
                    self.result = "โรคที่เกี่ยวข้องกับตับหรือถุงน้ำดี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "2"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล42" {
                    self.result = "โรคที่เกี่ยวข้องกับตับหรือถุงน้ำดี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "2"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล43" {
                    self.result = "โรคนิ่วในถุงน้ำดี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "3"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                   let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล44" {
                    self.result = "โรคติ่งเนื้อในถุงน้ำดี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "4"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล45" {
                    self.result = "โรคตับอักเสบ หรือตับพิษ"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล46" {
                    self.result = "โรคที่เกี่ยวข้องกับตับหรือถุงน้ำดี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "3"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล47" {
                    self.result = "โรคที่เกี่ยวข้องกับตับหรือถุงน้ำดี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "4"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล48" {
                    self.result = "โรคที่เกี่ยวข้องกับตับหรือถุงน้ำดี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "2"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล49" {
                    self.result = "โรคที่เกี่ยวข้องกับตับหรือถุงน้ำดี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "2"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล50" {
                    self.result = "โรคตับวาย หรือตัยล้มเหลว"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "3"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล51" {
                    self.result = "โรคตับวาย หรือตัยล้มเหลว"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล53" {
                    self.result = "โรคตับแข็ง, โรคตับวาย หรือตัยล้มเหลว"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล54" {
                    self.result = "โรคตับแข็ง, โรคตับวาย หรือตัยล้มเหลว"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล55" {
                    self.result = "โรคที่เกี่ยวข้องกับตับ หรือถุงน้ำดี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "4"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล56" {
                    self.result = "โรคที่เกี่ยวข้องกับตับ หรือถุงน้ำดี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "3"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล57" {
                    self.result = "โรคที่เกี่ยวข้องกับตับ หรือถุงน้ำดี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "3"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล58" {
                    self.result = "โรคที่เกี่ยวข้องกับตับ หรือถุงน้ำดี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "2"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล59" {
                    self.result = "โรคที่เกี่ยวข้องกับตับ หรือถุงน้ำดี"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "3"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                   let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล60" {
                    self.result = "โรคตับอ่อน ,โรคตับอ่อนอักเสบ, โรคตับอ่อนอักเสบเฉียบพลัน,โรคตับอ่อนอักเสบเรื้อรัง"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "4"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล61" {
                 self.result = "โรคที่เกี่ยวข้องกับตับ หรือถุงน้ำดี"
                 self.chipResponse.text = "ประมวลผลอาการ"
                 self.aa = "2"
                 self.result2.removeLast()
                 let joined = self.result2.joined(separator: ", ")
                let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                 vc.showdata = self.result
                 vc.showdata2 = joined
                 vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล62" {
                 self.result = "แพ้ยาแอสไพริน, ภาวะน้ำตาลในเลือดต่ำ"
                 self.chipResponse.text = "ประมวลผลอาการ"
                 self.aa = "1"
                 self.result2.removeLast()
                 let joined = self.result2.joined(separator: ", ")
                 let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                 vc.showdata = self.result
                 vc.showdata2 = joined
                 vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล63" {
                 self.result = "โรคเบาหวาน"
                 self.chipResponse.text = "ประมวลผลอาการ"
                 self.aa = "2"
                 self.result2.removeLast()
                 let joined = self.result2.joined(separator: ", ")
                 let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                 vc.showdata = self.result
                 vc.showdata2 = joined
                 vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล64" {
                 self.result = "โรคเบาหวาน"
                 self.chipResponse.text = "ประมวลผลอาการ"
                 self.aa = "3"
                 self.result2.removeLast()
                 let joined = self.result2.joined(separator: ", ")
                 let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                 vc.showdata = self.result
                 vc.showdata2 = joined
                 vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล65" {
                 self.result = "โรคเบาหวาน"
                 self.chipResponse.text = "ประมวลผลอาการ"
                 self.aa = "4"
                 self.result2.removeLast()
                 let joined = self.result2.joined(separator: ", ")
                 let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                 vc.showdata = self.result
                 vc.showdata2 = joined
                 vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล66" {
                    self.result = "โรคตับอ่อน, โรคตับอ่อนอักเสบ"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล67" {
                    self.result = "โรคตับอ่อน, โรคตับอ่อนอักเสบ"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล68" {
                    self.result = "โรคตับอ่อนอักเสบเฉียบพลัน"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล69" {
                    self.result = "โรคตับอ่อนอักเสบเฉียบพลัน, โรคตับอ่อนอักเสบเรื้อรัง"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "4"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล70" {
                    self.result = "โรคตับอ่อนอักเสบเรื้อรัง"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล71" {
                    self.result = "โรคตับอ่อนอักเสบเรื้อรัง"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                   let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล72" {
                    self.result = "โรคเบาหวาน"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล73" {
                    self.result = "โรคเบาหวาน"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                   let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล74" {
                    self.result = "โรคเบาหวาน"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                  let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล75" {
                    self.result = "โรคเบาหวาน"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล76" {
                    self.result = "โรคเบาหวาน"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล77" {
                    self.result = "เลือดเป็นกรดจากคีโตนโรคเบาหวาน"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "3"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล78" {
                    self.result = "เลือดเป็นกรดจากคีโตนโรคเบาหวาน"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "4"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                self.present(vc, animated: true, completion: nil)
                }
                   
                         
                                }
                    }, failure: { (request, error) in
                        print(error!)
                    })
                            
                    ApiAI.shared().enqueue(request)
        //                     messageField.text = ""
                    
                
                print(result)
                
                }
        
        
        //ไต หมายเลข3//  ยังไม่แก้
        func noo3(){
            let configuration = AIDefaultConfiguration()
            configuration.clientAccessToken = "5750bce7d09f4ce3a3d8906d7e49618e"
                        
            let apiai = ApiAI.shared()
            apiai?.configuration = configuration
                        
            let request = ApiAI.shared().textRequest()
                            
            if let sendMessage1: String = "ไม่"{
                request?.query = sendMessage1
                print(sendMessage1)
            }else {
                    return
                    }
                            
                        
            request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
            if let textResponse = response.result.fulfillment.speech {
                var tt = self.pp + textResponse + self.oo
                print(tt)
                self.speechAndText(text: tt)
                self.result2.append(textResponse)
        //            result2.append(textResponse)
                if textResponse == "ประมวลผล1" {
                    self.result = "โรคที่เกี่ยวข้องกับไต"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "2"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "test11Show") as! test11ViewController
        //            vc.showdata1.text = "giggg"
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                        }
                    else if textResponse == "ประมวลผล2" {
                        self.result = "โรคที่เกี่ยวข้องกับไต"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "2"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                        }
                    else if textResponse == "ประมวลผล3" {
                        self.result = "โรคภาวะไตวาย, โรคไตเรื้อรัง"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "2"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล4" {
                        self.result = "โรคภาวะไตวาย, โรคไตเรื้อรัง"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "3"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                       let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล5" {
                        self.result = "โรคภาวะไตวาย, โรคไตเรื้อรัง"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                       let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล6" {
                        self.result = "โรคภาวะไตวาย, โรคไตเรื้อรัง"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล9" {
                        self.result = "โรคภาวะไตวาย, โรคไตเรื้อรัง"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                       let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล10" {
                        self.result = "โรคไตเรื้อรัง"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล8" {
                        self.result = "โรคภาวะไตวาย"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล12" {
                        self.result = "โรคภาวะไตวาย"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล25" {
                        self.result = "โรคที่เกี่ยวข้องกับไต"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "2"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                else if textResponse == "ประมวลผล24" {
                    self.result = "โรคกรวยไตอักเสบ, โรคนิ่วในไตและท่อไต"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "3"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล23" {
                    self.result = "โรคกรวยไตอักเสบ, โรคนิ่วในไตและท่อไต"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                   let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล21" {
                    self.result = "โรคกรวยไตอักเสบ, โรคนิ่วในไตและท่อไต"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล14" {
                    self.result = "โรคนิ่วในไตและท่อไต"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                   let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล20" {
                    self.result = "โรคกรวยไตอักเสบ, โรคนิ่วในไตและท่อไต"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                else if textResponse == "ประมวลผล17" {
                    self.result = "โรคกรวยไตอักเสบ"
                    self.chipResponse.text = "ประมวลผลอาการ"
                    self.aa = "1"
                    self.result2.removeLast()
                    let joined = self.result2.joined(separator: ", ")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                    vc.showdata = self.result
                    vc.showdata2 = joined
                    vc.bb = self.aa
                    self.present(vc, animated: true, completion: nil)
                }
                         
                                }
                    }, failure: { (request, error) in
                        print(error!)
                    })
                            
                    ApiAI.shared().enqueue(request)
        //                     messageField.text = ""
                    
                
                print(result)
                
                }
        
        
            
        //ลำไส้ หมายเลข4//
        func noo4(){
            let configuration = AIDefaultConfiguration()
            configuration.clientAccessToken = "010d039c624746759f3083801ae527d0"
                        
            let apiai = ApiAI.shared()
            apiai?.configuration = configuration
                        
            let request = ApiAI.shared().textRequest()
                            
            if let sendMessage1: String = "ไม่"{
                request?.query = sendMessage1
                print(sendMessage1)
            }else {
                    return
            }
            request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
                if let textResponse = response.result.fulfillment.speech {
                    var tt = self.pp + textResponse + self.oo
                    print(tt)
                    self.speechAndText(text: tt)
        //           print(textResponse)
                    self.result2.append(textResponse)
        //            result2.append(textResponse)
                    if textResponse == "ประมวล." {
                        self.result = "โรคที่เกี่ยวข้องกับลำไส้"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "2"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
        //             vc.showdata1.text = "giggg"
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                        }
                    else if textResponse == "ประมวลผล........" {
                        self.result = "ท้องผูก, โรคลำไส้อักเสบ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "3"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                        }
                    else if textResponse == "ประมวลผล...." {
                        self.result = "โรคโพลิพลำไส้ใหญ่"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล......" {
                        self.result = "โรคโพลิพลำไส้ใหญ่"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                       let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล........." {
                        self.result = "อาหารเป็นพิษ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล................." {
                        self.result = "อาหารเป็นพิษ, พยาธิตืดปลา"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล.................." {
                        self.result = "อาหารเป็นพิษ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวล............" {
                        self.result = "อาหารเป็นพิษ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                       let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล..............." {
                        self.result = "ท้องเสีย, อาหารเป็นพิษ, โรคลำไส้อักเสบ, โรคบิด"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล............." {
                        self.result = "ท้องเสีย, อาหารเป็นพิษ, โรคลำไส้อักเสบ, โรคบิด"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                         
                    }
                    }, failure: { (request, error) in
                        print(error!)
                    })
                            
                    ApiAI.shared().enqueue(request)
                print(result)
                
                }
        
        
        //กระเพาะปัสสาวะ หมายเลข5//
        func noo5(){
            let configuration = AIDefaultConfiguration()
            configuration.clientAccessToken = "055a84106bdd4f9e9320e9ab4486d01c"
                        
            let apiai = ApiAI.shared()
            apiai?.configuration = configuration
                        
            let request = ApiAI.shared().textRequest()
                            
            if let sendMessage1: String = "ไม่"{
                request?.query = sendMessage1
                print(sendMessage1)
            }else {
                    return
            }
            request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
                if let textResponse = response.result.fulfillment.speech {
                    var tt = self.pp + textResponse + self.oo
                    print(tt)
                    self.speechAndText(text: tt)
        //           print(textResponse)
                    self.result2.append(textResponse)
        //            result2.append(textResponse)
                    if textResponse == "ประมวลผล" {
                        self.result = "โรคที่เกี่ยวข้องกับกระเพาะปัสสาวะ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "2"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                       let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                        }
                    else if textResponse == "ประมวลผล2" {
                        self.result = "โรคที่เกี่ยวข้องกับกระเพาะปัสสาวะ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "3"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                        }
                    else if textResponse == "ประมวลผล3" {
                        self.result = "โรคที่เกี่ยวข้องกับกระเพาะปัสสาวะ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "2"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                       let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล4" {
                        self.result = "โรคที่เกี่ยวข้องกับกระเพาะปัสสาวะ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "3"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล5" {
                        self.result = "โรคกระเพาะปัสสาวะอักเสบ, โรคกระเพาะปัสสาวะอักเสบเรื้อรังไม่ติดเชื้อ, โรคติดเชื้อระบบทางเดินปัสสาวะ, นิ่วในกระเพาะปัสสาวะ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล6" {
                        self.result = "โรคกระเพาะปัสสาวะอักเสบ, โรคกระเพาะปัสสาวะอักเสบเรื้อรังไม่ติดเชื้อ, โรคติดเชื้อระบบทางเดินปัสสาวะ, นิ่วในกระเพาะปัสสาวะ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล7" {
                        self.result = "โรคกระเพาะปัสสาวะอักเสบ, โรคติดเชื้อระบบทางเดินปัสสาวะ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล8" {
                        self.result = "โรคกระเพาะปัสสาวะอักเสบ, โรคติดเชื้อระบบทางเดินปัสสาวะ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "4"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล9" {
                        self.result = "โรคกระเพาะปัสสาวะอักเสบ, โรคติดเชื้อระบบทางเดินปัสสาวะ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล10" {
                        self.result = "โรคกระเพาะปัสสาวะอักเสบ, โรคติดเชื้อระบบทางเดินปัสสาวะ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                       let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล11" {
                        self.result = "โรคกระเพาะปัสสาวะอักเสบ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                    else if textResponse == "ประมวลผล12" {
                        self.result = "โรคกระเพาะปัสสาวะอักเสบ, โรคติดเชื้อระบบทางเดินปัสสาวะ"
                        self.chipResponse.text = "ประมวลผลอาการ"
                        self.aa = "1"
                        self.result2.removeLast()
                        let joined = self.result2.joined(separator: ", ")
                       let vc = self.storyboard?.instantiateViewController(withIdentifier:"test22Show") as! test22ViewController
                        vc.showdata = self.result
                        vc.showdata2 = joined
                        vc.bb = self.aa
                        self.present(vc, animated: true, completion: nil)
                    }
                         
                    }
                    }, failure: { (request, error) in
                        print(error!)
                    })
                            
                    ApiAI.shared().enqueue(request)
                print(result)
                
                }
    
            
            

            
//            let speechSynthesizer = AVSpeechSynthesizer()
            
            
            func speechAndText(text: String) {
                let speechUtterance = AVSpeechUtterance(string: text)
//                speechSynthesizer.speak(speechUtterance)
                UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
                    self.chipResponse.text = text
                }, completion: nil)
            }
            
            func shadow(){
                startBtn.layer.shadowColor = UIColor.gray.cgColor
                startBtn.layer.shadowOpacity = 1
                startBtn.layer.shadowOffset = .zero
                startBtn.layer.shadowRadius = 3
                
                noBtn.layer.shadowColor = UIColor.gray.cgColor
                noBtn.layer.shadowOpacity = 1
                noBtn.layer.shadowOffset = .zero
                noBtn.layer.shadowRadius = 3
                
                yesBtn.layer.shadowColor = UIColor.gray.cgColor
                yesBtn.layer.shadowOpacity = 1
                yesBtn.layer.shadowOffset = .zero
                yesBtn.layer.shadowRadius = 3
                
                homeBtn.layer.shadowColor = UIColor.gray.cgColor
                homeBtn.layer.shadowOpacity = 1
                homeBtn.layer.shadowOffset = .zero
                homeBtn.layer.shadowRadius = 3
                homeBtn.center = CGPoint(x: 365, y: 750)

                
                again.layer.shadowColor = UIColor.gray.cgColor
                again.layer.shadowOpacity = 1
                again.layer.shadowOffset = .zero
                again.layer.shadowRadius = 3
                
                top.layer.borderWidth = 3
                top.layer.borderColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1).cgColor
                
                cirView.layer.cornerRadius = 30
            }
        
       
        override func viewDidLoad() {
            super.viewDidLoad()
            
            //ซ่อนคำถาม
            chipResponse.isHidden = true
            btn1Hid.isHidden = true
            btn2Hid.isHidden = true
            infoHid.isHidden = true
            again.isHidden = true
            
            startBtn.layer.cornerRadius = 5
            noBtn.layer.cornerRadius = 5
            yesBtn.layer.cornerRadius = 5
            again.layer.cornerRadius = 5
            shadow()
            print(test1)
            
            changAll()
            
    //        result2.removeLast()
            let joined = self.result2.joined(separator: ", ")
            
            
            
        
            

        }
        
        
        override func viewWillAppear(_ animated: Bool) {
    //
    //        //พื้นหลังnavi
    //        let img = UIImage(named: "hands-holding-heart_23-2148172201 2.jpg")
    //        navigationController?.navigationBar.setBackgroundImage(img, for: .default)

        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
            
     
        

        }

