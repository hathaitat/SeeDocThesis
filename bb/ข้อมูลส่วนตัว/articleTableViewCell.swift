//
//  articleTableViewCell.swift
//  bb
//
//  Created by hathaitat on 23/3/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit

class articleTableViewCell: UITableViewCell {

        @IBOutlet weak var doctorName: UILabel!
        
    
    @IBOutlet weak var backview: UIView!
    
        
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
            backview.layer.borderWidth = 0.5
            backview.layer.borderColor = UIColor.lightGray.cgColor
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

        
    }
    //class DoctorData {
    //        var nameDoc : String
    //        var deptdoc : String
    ////        var style : String
    ////        var area_en : String
    ////        var area_th : String
    ////        var imageURL : String
    //
    //        init(nameDoc: String, deptdoc: String) {
    //            self.nameDoc = nameDoc
    //            self.deptdoc = deptdoc
    ////            self.style = style
    ////            self.area_en = area_en
    ////            self.area_th = area_th
    ////            self.imageURL = imageURL
    //        }
    //    }
