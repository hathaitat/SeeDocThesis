//
//  articleDetailViewController.swift
//  bb
//
//  Created by hathaitat on 23/3/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Firebase

class articleDetailViewController: UIViewController {
     
     var titleArt = ""
     let db = Firestore.firestore()

     @IBOutlet weak var titleText: UILabel!
     @IBOutlet weak var btnShow: UIButton!
     @IBOutlet weak var btnShow2: UIButton!
     @IBOutlet weak var btnShow3: UIButton!
     @IBOutlet weak var lbl: UILabel!
     @IBOutlet weak var lbl2: UILabel!
     @IBOutlet weak var lbl3: UILabel!
     
     
     func getArticleData() {
                let docRef = db.collection("article").document(titleArt)
    
                docRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                        let array1 = document.get("Article1") as! [String]
                        let array2 = document.get("Article2") as! [String]
                        let array3 = document.get("Article3") as! [String]
    
                        let joined = array1.joined(separator: " \n- ")
                        let joined2 = array2.joined(separator: " \n- ")
                        let joined3 = array3.joined(separator: " \n- ")
                        print(joined)
                        print(joined2)
                        print(joined3)
//                        self.article1Text.text = joined
//                        self.article2Text.text = joined2
//                        self.article3Text.text = joined3
                         self.lbl.text = joined
                         self.lbl2.text = joined2
                         self.lbl3.text = joined3
    
    
    
    
                    } else {
                        print("Document does not exist")
                    }
                }
        }
    
   
    
        override func viewDidLoad() {
            super.viewDidLoad()
          
          getArticleData()
            
          btnShow.layer.cornerRadius = 7
          btnShow2.layer.cornerRadius = 7
          btnShow3.layer.cornerRadius = 7
         
          lbl.isHidden = false
          lbl2.isHidden = true
          lbl3.isHidden = true
          titleText.text = titleArt
          btnShow.backgroundColor = UIColor(red: 224/255, green: 174/255, blue: 112/255, alpha: 1)

         
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }

        @IBAction func onClickShow(_ sender: Any) {
            if lbl.isHidden {
                animate(toogle: true, type: btnShow)
               btnShow.setTitle("สาเหตุเกิดจากอะไร ?  (ซ่อน)", for: .normal)
               btnShow.backgroundColor = UIColor(red: 224/255, green: 174/255, blue: 112/255, alpha: 1)
            } else {
                animate(toogle: false, type: btnShow)
               btnShow.setTitle("สาเหตุเกิดจากอะไร ?  (แสดง)", for: .normal)
               btnShow.backgroundColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1)
            }
        }
     
     @IBAction func onClickShow2(_ sender: Any) {
          if lbl2.isHidden {
              animate(toogle: true, type: btnShow2)
               btnShow2.setTitle("อาการเป็นอย่างไร ?  (ซ่อน)", for: .normal)
               btnShow2.backgroundColor = UIColor(red: 224/255, green: 174/255, blue: 112/255, alpha: 1)


          } else {
              animate(toogle: false, type: btnShow2)
               btnShow2.setTitle("อาการเป็นอย่างไร ?  (แสดง)", for: .normal)
               btnShow2.backgroundColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1)

          }
     }
     
     
     @IBAction func onClickShow3(_ sender: Any) {
          if lbl3.isHidden {
              animate(toogle: true, type: btnShow3)
               btnShow3.setTitle("ป้องกันได้อย่างไร ?  (ซ่อน)", for: .normal)
               btnShow3.backgroundColor = UIColor(red: 224/255, green: 174/255, blue: 112/255, alpha: 1)


          } else {
              animate(toogle: false, type: btnShow3)
               btnShow3.setTitle("ป้องกันได้อย่างไร ?  (แสดง)", for: .normal)
               btnShow3.backgroundColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1)


          }
     }
     
     
     
        func animate(toogle: Bool, type: UIButton) {
            
            if type == btnShow {
            
                if toogle {
                    UIView.animate(withDuration: 0.3) {
                        self.lbl.isHidden = false
                    }
                } else {
                    UIView.animate(withDuration: 0.3) {
                        self.lbl.isHidden = true
                    }
                }
            }
            else if type == btnShow2{
               if toogle {
                   UIView.animate(withDuration: 0.3) {
                       self.lbl2.isHidden = false
                   }
               } else {
                   UIView.animate(withDuration: 0.3) {
                       self.lbl2.isHidden = true
                   }
               }
          }
            else{
               if toogle {
                   UIView.animate(withDuration: 0.3) {
                       self.lbl3.isHidden = false
                   }
               } else {
                   UIView.animate(withDuration: 0.3) {
                       self.lbl3.isHidden = true
                   }
               }
               
          }
        
        
}
}

    
//    @IBOutlet weak var article1Text: UITextView!
//    @IBOutlet weak var article2Text: UITextView!
//    @IBOutlet weak var article3Text: UITextView!
//    @IBOutlet weak var titleText: UILabel!
//
//
//        func getArticleData() {
//            let docRef = db.collection("article").document(titleArt)
//
//            docRef.getDocument { (document, error) in
//                if let document = document, document.exists {
//                    let array1 = document.get("Article1") as! [String]
//                    let array2 = document.get("Article2") as! [String]
//                    let array3 = document.get("Article3") as! [String]
//
//                    let joined = array1.joined(separator: " \n- ")
//                    let joined2 = array2.joined(separator: " \n- ")
//                    let joined3 = array3.joined(separator: " \n- ")
//                    print(joined)
//                    print(joined2)
//                    print(joined3)
//                    self.article1Text.text = joined
//                    self.article2Text.text = joined2
//                    self.article3Text.text = joined3
//
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "llViewController") as? llViewController
//                    vc?.joined11 = joined
//                    self.present(vc!, animated: true)
//
//
//
//                } else {
//                    print("Document does not exist")
//                }
//            }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print(titleArt)
//        titleText.text = titleArt
//
//        getArticleData()
//
//    }
//
//
//
//}
