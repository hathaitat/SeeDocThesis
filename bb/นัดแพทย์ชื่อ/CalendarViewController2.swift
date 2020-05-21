//
//  CalendarViewController2.swift
//  bb
//
//  Created by hathaitat on 12/3/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Firebase


extension Date {
    
    fileprivate static let weekdayColor  = UIColor.darkGray
    fileprivate static let saturdayColor = UIColor(red: CGFloat(0.400), green: CGFloat(0.471), blue: CGFloat(0.980), alpha: CGFloat(1.0))
    
    func getDaysInMonthFC2() -> Int{
        var calendar = Calendar.current
        
        let dateComponents = DateComponents(year: calendar.component(.year, from: self), month: calendar.component(.month, from: self))
        var date = calendar.date(from: dateComponents)!
        calendar.locale = Locale(identifier: "th")
        
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
       var myCalendar = Calendar(identifier: .buddhist)
        
        return numDays
    }
    
    func addMonthFC2(month: Int) -> Date {
        return Calendar.current.date(byAdding: .month, value: month, to: self)!
    }
    
    func startOfMonthFC2() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonthFC2() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonthFC())!
    }
    
    func getDayOfWeekFC2() -> Int? {
        var myCalendar = Calendar(identifier: .buddhist)
        myCalendar.locale = Locale(identifier: "th")
        let weekDay = myCalendar.component(.weekday, from: self)
        return weekDay
    }
    
    func getHeaderTitleFC2() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM, YYYY"
        return dateFormatter.string(from: self)
    }
    
    func getDayFC2(day: Int) -> Date {
        let day = Calendar.current.date(byAdding: .day, value: day, to: self)!
       
        return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: day)!
    }
    
    func getYearOnlyFC2() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        dateFormatter.calendar = Calendar(identifier: .buddhist)
        return dateFormatter.string(from: self)
    }
    
    func getTitleDateFC2() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM dd"
        
        
        return dateFormatter.string(from: self)
    }
    

  
        
        
       
    }


extension UIView {
    func callRecursively2(level: Int = 0, _ body: (_ subview: UIView, _ level: Int) -> Void) {
        body(self, level)
        subviews.forEach { $0.callRecursively2(level: level + 1, body) }
    }
}

protocol CalendarCallBack2 {
    func didSelectDate(date: Date)
}


class CalendarViewController2: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var calendar: UICollectionView!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var wrapper: UIView!
    
    var delegate: CalendarCallBack? = nil
    
    @IBAction func close(_ sender: UIButton){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.removeConstraint(self.heightConstraint!)
            self.verticalConstraint!.constant = self.view.frame.size.height
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
            self.view.layoutIfNeeded()
        }) { (done) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @IBAction func selectDate(_ sender: UIButton){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.removeConstraint(self.heightConstraint!)
            self.verticalConstraint!.constant = self.view.frame.size.height
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
            self.view.layoutIfNeeded()
        }) { (done) in
            self.dismiss(animated: false, completion: nil)
            self.delegate?.didSelectDate(date: self.selectedDate)
            print(self.selectedDate)
        }
    
    }
    
    
    
    var selectedIndex: IndexPath? = nil
    var selectedDate = Date()
    
    var verticalConstraint: NSLayoutConstraint? = nil
    var heightConstraint: NSLayoutConstraint? = nil
    
    //ตัวแปรที่รับค่าวัน
    var SS = ""
    var Mon = ""
    var Tue = ""
    var Wed = ""
    var Thu = ""
    var Fri = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        delegate.calendar = Calendar(identifier: .buddhist)
//        delegate.locale = Locale(identifier: "th")
        
       
        
        let numberOfCellsPerRow: CGFloat = 7
        
        
        if let flowLayout = calendar.collectionViewLayout as? UICollectionViewFlowLayout {
            let horizontalSpacing = flowLayout.scrollDirection == .vertical ? flowLayout.minimumInteritemSpacing : flowLayout.minimumLineSpacing
            let cellWidth = (view.frame.width - 16 - max(0, numberOfCellsPerRow - 1)*horizontalSpacing)/numberOfCellsPerRow
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
            
        }

        view.backgroundColor = UIColor.black.withAlphaComponent(0)
        self.view.layoutIfNeeded()
        
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: wrapper, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: wrapper, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: self.view.frame.size.width)
        
        verticalConstraint = NSLayoutConstraint(item: wrapper, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: self.view.frame.size.height)
        
        view.addConstraints([horizontalConstraint, widthConstraint, verticalConstraint!])
        
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1) {
            UIView.animate(withDuration: 0.25, animations: {
                self.verticalConstraint!.constant = 60
                self.heightConstraint = NSLayoutConstraint(item: self.wrapper, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant:  0)
                self.view.addConstraints([self.heightConstraint!])
                self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
                self.view.layoutIfNeeded()
                
            })
        }
        
        year.text = selectedDate.getYearOnlyFC2()
        date.text = selectedDate.getTitleDateFC2()
        

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calendar.reloadData()
  
        
        
        
    }
    
    func scrollToIndex() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1) {
            if self.selectedIndex != nil {
                self.calendar.scrollToItem(at: self.selectedIndex!, at: .centeredVertically, animated: true)
               
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((collectionView.frame.size.width / 3) - 20), height: CGFloat(100))
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        let title = headerView.viewWithTag(1) as! UILabel
        title.text = Date().addMonthFC(month: indexPath.section).getHeaderTitleFC()
        print(title)
        return headerView
//        print(title)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Date().addMonthFC(month: section).getDaysInMonthFC()+Date().addMonthFC(month: section).startOfMonthFC().getDayOfWeekFC2()!+6
    
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let calendarDay = cell.viewWithTag(1) as! UILabel
        calendarDay.textColor = UIColor.lightGray
        if indexPath.row+1 >= Date().addMonthFC(month: indexPath.section).startOfMonthFC().getDayOfWeekFC2()!+7{
            calendarDay.text = "\((indexPath.row+1)-(Date().addMonthFC(month: indexPath.section).startOfMonthFC().getDayOfWeekFC2()!+6))"
            
        }else{
            if(indexPath.row < 7){
                var dayname = ""
                switch (indexPath.row){
                case 0:
                    dayname = "อา"
                    break
                    
                case 1:
                    dayname = "จ"
                    break
                    
                case 2:
                    dayname = "อ"
                    break
                    
                case 3:
                    dayname = "พ"
                    break
                    
                case 4:
                    dayname = "พฤ"
                    break
                    
                case 5:
                    dayname = "ศ"
                    break
                    
                case 6:
                    dayname = "ส"
                    break
                    
                default:
                    break
                }
                calendarDay.text = dayname
                calendarDay.textColor = UIColor.darkGray
                
            }else{
                calendarDay.text = ""
                
            }
//            print(calendarDay.text)
        }
//        print(indexPath)
        cell.viewWithTag(2)?.isHidden = true
        cell.viewWithTag(2)?.layer.cornerRadius = (cell.viewWithTag(2)?.frame.size.width)!/2
        if(selectedIndex != nil){
            if(selectedIndex == indexPath){
                cell.viewWithTag(2)?.isHidden = false
                calendarDay.textColor = UIColor.white
                self.scrollToIndex()
                
            }
        }else if Int(calendarDay.text!) != nil{
            if(Date().addMonthFC(month: indexPath.section).startOfMonthFC().getDayFC2(day: Int(calendarDay.text!)!-1) == selectedDate.getDayFC2(day: 0)){
                cell.viewWithTag(2)?.isHidden = false
                calendarDay.textColor = UIColor.white
                year.text = selectedDate.getYearOnlyFC2()
                date.text = selectedDate.getTitleDateFC2()
                selectedDate = Date()
                selectedIndex = indexPath
//                print(date.text)
                
                }
        }

        //ฟังชั่นโชว์เวลาหมอที่เข้า
        g1(cell: cell, indexPath: indexPath)
        g2(cell: cell, indexPath: indexPath)
        g3(cell: cell, indexPath: indexPath)
        g4(cell: cell, indexPath: indexPath)
        g5(cell: cell, indexPath: indexPath)
        g6(cell: cell, indexPath: indexPath)
        
        
            return cell
                    }
    
    //Mon
    func g1(cell: UICollectionViewCell, indexPath: IndexPath) {
        let calendarDay = cell.viewWithTag(1) as! UILabel
        let dayIndexPathArray = [8, 15, 22, 29, 36]
            for index in dayIndexPathArray {
            if index == indexPath.row {
                if Mon == "Mon"{
                    calendarDay.textColor = UIColor(red: 238/255, green: 72/255, blue: 133/255, alpha: 1)
            }
            else{
                 calendarDay.textColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
            }
        }
       }
    }
    
    //Tue
    func g2(cell: UICollectionViewCell, indexPath: IndexPath) {
        let calendarDay = cell.viewWithTag(1) as! UILabel
        let dayIndexPathArray = [9, 16, 23, 30, 37]
            for index in dayIndexPathArray {
            if index == indexPath.row {
                if Tue == "Tue"{
                calendarDay.textColor = UIColor(red: 238/255, green: 72/255, blue: 133/255, alpha: 1)
            }
            else{
                 calendarDay.textColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
            }
        }
       }
    }
    
    //Wed
    func g3(cell: UICollectionViewCell, indexPath: IndexPath) {
        let calendarDay = cell.viewWithTag(1) as! UILabel
        let dayIndexPathArray = [10, 17, 24, 31, 38]
            for index in dayIndexPathArray {
            if index == indexPath.row {
                if Wed == "Wed"{
                calendarDay.textColor = UIColor(red: 238/255, green: 72/255, blue: 133/255, alpha: 1)
            }
            else{
                 calendarDay.textColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
            }
        }
       }
    }
    
    //Thu
    func g4(cell: UICollectionViewCell, indexPath: IndexPath) {
        let calendarDay = cell.viewWithTag(1) as! UILabel
        let dayIndexPathArray = [11, 18, 25, 32, 39]
            for index in dayIndexPathArray {
            if index == indexPath.row {
                if Thu == "Thu"{
                calendarDay.textColor = UIColor(red: 238/255, green: 72/255, blue: 133/255, alpha: 1)
            }
            else{
                 calendarDay.textColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
            }
        }
       }
    }
    
    //Fri
    func g5(cell: UICollectionViewCell, indexPath: IndexPath) {
        let calendarDay = cell.viewWithTag(1) as! UILabel
        let dayIndexPathArray = [12, 19, 26, 33, 40]
            for index in dayIndexPathArray {
            if index == indexPath.row {
                if Fri == "Fri"{
                calendarDay.textColor = UIColor(red: 238/255, green: 72/255, blue: 133/255, alpha: 1)
            }
            else{
                 calendarDay.textColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
            }
        }
       }
    }
    
    //SS
    func g6(cell: UICollectionViewCell, indexPath: IndexPath) {
        let calendarDay = cell.viewWithTag(1) as! UILabel
        let dayIndexPathArray = [13, 20, 27, 34, 41, 7, 14, 21, 28, 35]
            for index in dayIndexPathArray {
            if index == indexPath.row {
                if SS == "SS"{
                calendarDay.textColor = UIColor(red: 238/255, green: 72/255, blue: 133/255, alpha: 1)
            }
            else{
                 calendarDay.textColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
            }
        }
       }
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        let calendarDay = cell?.viewWithTag(1) as! UILabel
        if Int(calendarDay.text!) != nil{
            cell?.viewWithTag(2)?.isHidden = false
            calendarDay.textColor = UIColor.white
            let sDate =  Date().addMonthFC(month: indexPath.section).startOfMonthFC().getDayFC(day: Int(calendarDay.text!)!-1)
            year.text = sDate.getYearOnlyFC2()
            date.text = sDate.getTitleDateFC2()
            selectedDate = sDate
            selectedIndex = indexPath
            collectionView.reloadData()
            
                    
        }
        
    }
    
    
    
}



