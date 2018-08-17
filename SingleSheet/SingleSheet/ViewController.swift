//
//  ViewController.swift
//  SingleSheet
//
//  Created by GetHired on 8/13/18.
//  Copyright © 2018 GetHired.Jiacheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    let headId = "headId"
    let barId = "barId"
    let dayId = "dayId"
    let noteId = "noteId"
    let disclaimId = "disclaimId"
    var checkStatus = false
    var currentWeek = [Date?]()
    var currentMonday : Date?
    
    // model values
    var summary = Summary(strings: "")
    var weekday = [Weekday?]()
    var acceptLabel = String()
    
    var debug = false
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .blue
        return cv
    }()
    
    let barLabel : UITextView = {
        let bv = UITextView()
        let attributedText = NSMutableAttributedString(string: "Scheduled", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16)])
        attributedText.append(NSAttributedString(string: "      Actual", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16)]))
        bv.attributedText = attributedText
        return bv
    }()
    
    // main
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContentView()
        initialDays()

    }
    
    fileprivate func initialDays() {
        currentMonday = getMonday()
        currentWeek = getWeekdays(startDate: currentMonday!)
        loadDateToModel()
       
    }
    
    fileprivate func loadDateToModel() {
        let sum = Summary(strings: getMonAndSunLabel())
        summary = sum
        getWeekdayLabel()
        print(sum.str)
    }
    
    fileprivate func setupContentView(){
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(Header.self, forCellWithReuseIdentifier: headId)
        collectionView.register(Bar.self, forCellWithReuseIdentifier: barId)
        collectionView.register(Day.self, forCellWithReuseIdentifier: dayId)
        collectionView.register(Note.self, forCellWithReuseIdentifier: noteId)
        collectionView.register(Disclaimer.self, forCellWithReuseIdentifier: disclaimId)
        
        collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    // return collectionView section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 5
        } else if section == 2 {
            return 7
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if debug { print(2-1)}
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headId, for: indexPath) as! Header
            cell.leftArrowButton.addTarget(self, action: #selector(self.findPreviousWeek(sender:)), for: .touchUpInside)
            cell.rightArrowButton.addTarget(self, action: #selector(self.findNextWeek(sender:)), for: .touchUpInside)
            cell.summary = summary
            return cell
            
        } else if indexPath.section == 1{
             if debug { print("2-2")}
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: barId, for: indexPath) as! Bar
            return cell
            
        } else if indexPath.section == 2{
             if debug { print("2-3")}
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dayId, for: indexPath) as! Day
            cell.weekday = weekday[indexPath.item]
            return cell
            
        } else if indexPath.section == 3 {
             if debug { print("2-4")}
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: noteId, for: indexPath) as! Note
            return cell
        } else {
             if debug { print("2-5")}
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: disclaimId , for: indexPath) as! Disclaimer
            cell.checkButton.addTarget(self, action: #selector(self.handleCheck(sender:)), for: .touchUpInside)
            cell.switchButton.addTarget(self, action: #selector(self.handleAcceptSwith(sender:)), for: UIControlEvents.valueChanged)
            cell.acceptLabel = acceptLabel
            return cell
        }
        
    }
    
    @objc func handleAcceptSwith(sender: UISwitch) {
        if sender.isOn {
            
            acceptLabel = "Accept"
        } else {
            
            acceptLabel = "Accept?"
        }
        self.collectionView.reloadData()
    }
    
    
    @objc func findPreviousWeek(sender: UIButton) {
         currentMonday = currentMonday?.previous(.monday)
        currentWeek = getWeekdays(startDate: currentMonday!)
        loadDateToModel()
         self.collectionView.reloadData()
//        print("-1 week: ",  currentWeek)
    }
    
    @objc func findNextWeek(sender: UIButton) {
        currentMonday = currentMonday?.next(.monday)
        currentWeek = getWeekdays(startDate: currentMonday!)
       loadDateToModel()
        self.collectionView.reloadData()
//        print("+1 week: ",  currentWeek)
    }
    
    
    // process the selector button
    @objc func handleCheck(sender: UIButton){
        if !checkStatus {
            sender.setImage(#imageLiteral(resourceName: "checked-red").withRenderingMode(.alwaysOriginal), for: .normal)
            checkStatus = true
        } else {
            sender.setImage(#imageLiteral(resourceName: "checkbox").withRenderingMode(.alwaysOriginal), for: .normal)
            checkStatus = false
        }
        
    }
    
    
    func getMonday() -> Date {
        let myDat = Date.today()
        let cal = Calendar.current
        var comps = cal.dateComponents([.weekOfYear, .yearForWeekOfYear], from: myDat)
        comps.weekday = 2 // Monday
        let mondayInWeek = cal.date(from: comps)!
        return mondayInWeek
    }
    
    func getNextMonday(currentDay: Date) -> Date {
         let date = Calendar.current.date(byAdding: .day, value: 7, to: currentDay)!
         return date
    }
    
    // get Current week range label for the header
    func getMonAndSunLabel() ->String {
        var res = "MON, "
        res.append(getDayString(date: (currentWeek[0])!))
        res.append(" ")
        res.append(getMonthString(date:  (currentWeek[0])!))
         res.append(" - SUN, ")
        res.append(getDayString(date: (currentWeek[6])!))
        res.append(" ")
        res.append(getMonthString(date:  (currentWeek[6])!))
        return res.uppercased()
    }
    
    fileprivate func getWeekdayLabel() {
        weekday.removeAll()
        
        for day in currentWeek {
            var str = getWeekdayString(date: day!)
            str.append(", ")
            str.append(getMonthString(date: day!))
            str.append(" ")
            str.append(getDayString(date: day!))
            var wkday = Weekday(string: str)
            weekday.append(wkday)
        }
        
    }
    
    fileprivate func getDayString(date: Date) -> String {
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "d"
        return dayFormatter.string(from: date)
    }
    
    fileprivate func getMonthString(date: Date) -> String {
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "LLL"
        return monthFormatter.string(from: date)
    }
    
    fileprivate func getWeekdayString(date: Date) -> String {
        let weekdayFormatter = DateFormatter()
        weekdayFormatter.dateFormat = "EEEE"
        return weekdayFormatter.string(from: date)
    }
    
// generate whole week for a centain Monday
    func getWeekdays(startDate: Date) -> [Date?] {
        var dates = [Date]()
        var date = startDate
        dates.append(startDate)
        var index = 0
       
        while index < 6 {
//            print(dates)
            date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
            dates.append(date)
            index += 1
        }
        return dates
    }
    
    
    
    
    // set  item horizental line space
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // set item vertical line space in section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // set space for every section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            if debug { print("1-1")}
            return CGSize(width: (view.frame.width), height: 220)
        } else if indexPath.section == 1 {
            if debug { print("1-2")}
            return CGSize(width: (view.frame.width)/5, height: 280)
        } else if indexPath.section == 2 {
            if debug { print("1-3")}
            return CGSize(width: (view.frame.width), height: 80)
        } else if indexPath.section == 3 {
            if debug { print("1-4")}
            return CGSize(width: view.frame.width, height: 140)
        } else {
            if debug { print("1-5")}
            return CGSize(width: view.frame.width, height: 180)
        }
        
    }
    
    // set interval space between sections
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 18, right: 0)
    }
    
    
    
}

