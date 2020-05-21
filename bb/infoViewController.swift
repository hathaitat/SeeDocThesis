//
//  infoViewController.swift
//  bb
//
//  Created by hathaitat on 28/4/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit

class infoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       if let navigationController = self.navigationController {

          let navigationBar = navigationController.navigationBar
           let navBorder: UIView = UIView(frame: CGRect(x: 0, y: navigationBar.frame.size.height - 1.5, width: navigationBar.frame.size.width, height: 1.5))
          navBorder.backgroundColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1)
       navBorder.isOpaque = true
          self.navigationController?.navigationBar.addSubview(navBorder)
       }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
