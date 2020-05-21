//
//  llViewController.swift
//  bb
//
//  Created by hathaitat on 25/3/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit

class llViewController: UIViewController {

//   @IBOutlet weak var btnDrop: UIButton!
//        @IBOutlet weak var tblView: UITableView!
        @IBOutlet weak var btnShow: UIButton!
        @IBOutlet weak var lbl: UILabel!
        var fruitList = ["Orange", "Banana", "Apple", "Blueberry", "Mango", "Cherry", "Grape", "Strawberry"]
    
    var joined11 = ""
    
        override func viewDidLoad() {
            super.viewDidLoad()
//            tblView.isHidden = true
            print(joined11)
            lbl.isHidden = false
            lbl.text = joined11
            // Do any additional setup after loading the view, typically from a nib.
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

//        @IBAction func onClickDropButton(_ sender: Any) {
//            if tblView.isHidden {
//                animate(toogle: true, type: btnDrop)
//            } else {
//                animate(toogle: false, type: btnDrop)
//            }
//
//
//        }
        @IBAction func onClickShow(_ sender: Any) {
            if lbl.isHidden {
                animate(toogle: true, type: btnShow)
            } else {
                animate(toogle: false, type: btnShow)
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
        
        
}
}
