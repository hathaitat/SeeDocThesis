//
//  articleViewController.swift
//  bb
//
//  Created by hathaitat on 23/3/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class articleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {


    @IBOutlet weak var tableDoc: UITableView!
    @IBOutlet weak var searchDoctor: UISearchBar!
    

    var doctor1:String!

    var filteredData = [String]()
    var inSearchMode = false
    var search: String!
    let db = Firestore.firestore()
    var ss = [String]()

    func getDoctorData() {
    db.collection("article").getDocuments { (snapshot, error) in
        if error == nil && snapshot != nil {
            for document in snapshot!.documents {
                if document == document {
                 print(document.documentID)
                    self.ss.append(document.documentID)
                    self.filteredData = self.ss
                   }
                            }
                        }
                        self.tableDoc.reloadData()
                    }
                }
    
   
            
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
      
        
            getDoctorData()

           self.navigationItem.hidesBackButton = true

           self.tableDoc.separatorStyle = .none

           tableDoc.delegate = self

           tableDoc.dataSource = self

           searchDoctor.delegate = self

           searchDoctor.returnKeyType = UIReturnKeyType.done


       if let navigationController = self.navigationController {

           let navigationBar = navigationController.navigationBar
        let navBorder: UIView = UIView(frame: CGRect(x: 0, y: navigationBar.frame.size.height - 1.5, width: navigationBar.frame.size.width, height: 1.5))
           navBorder.backgroundColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1)
        navBorder.isOpaque = true
           self.navigationController?.navigationBar.addSubview(navBorder)
        }
        
       
        
       }


       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

           if inSearchMode {

               return ss.count
           }else{
            return filteredData.count
        }
//           return 0   // return data.count
       }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        
    }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

           if let cell = tableDoc.dequeueReusableCell(withIdentifier: "bell",
               for: indexPath) as? articleTableViewCell {
               
               if inSearchMode {
                cell.doctorName?.text = ss[indexPath.row]
                doctor1 = self.filteredData[indexPath.row]

            } else {
                cell.doctorName?.text = ss[indexPath.row]
                doctor1 = ""
                print(ss)
                
               }
               return cell
            } else {
                return UITableViewCell()
           }
       }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print(doctor1)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "articleDetailViewController") as? articleDetailViewController
                   vc?.titleArt = ss[indexPath.row]
                   self.present(vc!, animated: true)
                   
               }


       func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            search = searchDoctor.text
            self.ss = self.filteredData.filter({$0.prefix(searchText.count) == searchText})
            print(self.ss)
            self.inSearchMode = true
            self.tableDoc.reloadData()
                  }
                  }


       func searchBarSearchButtonClicked1(_ searchBar: UISearchBar)  {
           searchBar.resignFirstResponder()

       }



