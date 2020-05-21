//
//  bookdoctor2ViewController.swift
//  bb
//
//  Created by hathaitat on 23/1/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI



class bookdoctor2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
//

    @IBOutlet weak var tableDoc: UITableView!
    @IBOutlet weak var searchDoctor: UISearchBar!
    @IBOutlet weak var topView: UIView!
    
    
    var doctor1:String!
    var doctor11 = ""
    var filteredData = [String]()
    var inSearchMode = false
    var search: String!
    let db = Firestore.firestore()
    var ss = [String]()
    var gg = [String]()//เก็บurl รูป
    var gg2 = [String]()//เก็บurl รูป
    

    //ตัวแปรส่งค่าอาการจากการประเมิน
    var showdataSymptom2 = ""
    var num3 = ""
    
    func getDoctorData() {
        db.collection("doctor").getDocuments { (snapshot, error) in
            if error == nil && snapshot != nil {
                for document in snapshot!.documents {
                    if document.get("nameDoc") != nil && document.get("deptDoc") != nil {
                        let documentData = document.data()
                        let nameDoc = document.get("nameDoc") as! String
    //                    let deptDoc = document.get("deptDoc") as! String
                        let imageURL2 = document.get("imageDoc") as! String
                        
                        self.gg2.append(imageURL2)
                        self.ss.append(nameDoc)
                        self.filteredData = self.ss
                        
                        
                        let data = self.db.collection("doctor").whereField("nameDoc", isEqualTo: nameDoc)
                        data.getDocuments { (snapshot, error) in
                            if error == nil && snapshot != nil {
                                for document in snapshot!.documents {
                                    let imageURL = document.get("imageDoc") as! String
                                        if imageURL != "" {
//                                            let storageRef = Storage.storage().reference(forURL: imageURL)
////                                             doctorImage.sd_setImage(with: storageRef)
                                            self.gg.append(imageURL)
                                    }
                                }
                            }
                        }
                                           
    
                        
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

            //view ข้างบน
            topView.layer.borderWidth = 1.5
            topView.layer.borderColor = UIColor(red: 132/255, green: 104/255, blue: 173/255, alpha: 1).cgColor

            
            
           }


           func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

               if inSearchMode {

                   return ss.count
               }else{
                return filteredData.count
            }
    //           return 0   // return data.count
           }
    func tableView2(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

                   return gg2.count
           }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 237
        }

           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

               if let cell = tableDoc.dequeueReusableCell(withIdentifier: "bell",
                   for: indexPath) as? book2 {
                   if inSearchMode {
                    cell.doctorName?.text = ss[indexPath.row]
    //                cell.doctorDept?.text = filteredData[indexPath.row]
//                    cell.doctorImage.image = UIImage(data: gg[indexPath.row])
                    let storageRef = Storage.storage().reference(forURL: gg[indexPath.row])
                    cell.doctorImage.sd_setImage(with: storageRef)
                    
                    doctor1 = self.filteredData[indexPath.row]
                    print(doctor1)
                    doctor11.append(doctor1)
                    print(doctor11)

                } else {
                    cell.doctorName?.text = ss[indexPath.row]
                    let storageRef1 = Storage.storage().reference(forURL: gg2[indexPath.row])
                    cell.doctorImage.sd_setImage(with: storageRef1)
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
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "book2detail") as? book2detailViewController
            vc?.doctor111 = ss[indexPath.row]
            
            vc?.showdataSymptom3 = showdataSymptom2
        //               vc?.showTimeperiod2 = showTimeperiod
        //               vc?.showDayPick2 = showDayPick
        //               vc?.showDayPickTotal2 = showDayPickTotal
                       self.present(vc!, animated: true)
                       
                   }


           func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //            var ss = [String]()
    //            inSearchMode = true
               search = searchDoctor.text
    //           db.collection("doctor").getDocuments { (snapshot, error) in
    //              if error == nil && snapshot != nil {
    //                  for document in snapshot!.documents {
    //                     if document.get("nameDoc") != nil && document.get("deptDoc") != nil  {
    //                     let documentData = document.data()
    //                     let nameDoc = document.get("nameDoc") as! String
    //                     let deptDoc = document.get("deptDoc") as! String
    //
    //
    //                    self.filteredData.removeAll()   //remove irrelevant values
    //                        self.filteredData.append(nameDoc)
    //                        self.filteredData.append(deptDoc)
    ////                        print(self.filteredData)

                            self.ss = self.filteredData.filter({$0.prefix(searchText.count) == searchText})
                            print(self.ss)
    //                        print(self.filteredData)
    //                        if self.search == nameDoc {
    ////                            print(nameDoc)
    //                        }
    //                        ss = self.filteredData.filter({$0.prefix(searchText.count) == searchText})
    //                        print(ss)
    //                    }
    //
    //                      }
                    self.inSearchMode = true

                    self.tableDoc.reloadData()
                      }
    //            print(self.ss)
                      }



    //           }

                   // here is where we get data and filter data




           func searchBarSearchButtonClicked(_ searchBar: UISearchBar)  {
               searchBar.resignFirstResponder()

           }
    //




