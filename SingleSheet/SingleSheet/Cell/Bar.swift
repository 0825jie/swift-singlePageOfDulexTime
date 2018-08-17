//
//  Bar.swift
//  SingleSheet
//
//  Created by GetHired on 8/14/18.
//  Copyright © 2018 GetHired.Jiacheng. All rights reserved.
//

import UIKit


class Bar: UICollectionViewCell {
    
    let payLabel : UITextView = {
        let tv = UITextView()
        tv.text = "$80"
        tv.textAlignment = .center
        tv.backgroundColor = .clear
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.font = UIFont.boldSystemFont(ofSize: 16)
        return tv
    }()
    
    let barFinish : UIView = {
        let bv = UIView()
        bv.backgroundColor = UIColor(red: 0.302, green: 0.6078, blue: 0, alpha: 1.0)
        return bv
    }()
    
    let barExpect : UIView = {
        let bv = UIView()
        bv.backgroundColor = UIColor(red: 0.7882, green: 0.8392, blue: 0.7882, alpha: 1.0)
        return bv
    }()
    
    let dayLabel : UITextView = {
        let tv = UITextView()
        tv.text = "MON\n5/1"
        tv.textAlignment = .center
        tv.backgroundColor = .clear
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.font = UIFont.systemFont(ofSize: 14)
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
    }
    
    fileprivate func setupContentView(){
        backgroundColor = UIColor(hue: 105/360, saturation: 2/100, brightness: 97/100, alpha: 1.0)
        
        addSubview(barFinish)
        barFinish.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: ((self.frame.width - 6) / 2) - 6, paddingBottom: 80, paddingRight: ((self.frame.width - 6) / 2) + 6, width: 6, height: 120)
        
        addSubview(barExpect)
        barExpect.anchor(top: nil, left: barFinish.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 80, paddingRight: 0, width: 6, height: 100)
        
        addSubview(payLabel)
        payLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 40, paddingLeft: (self.frame.width - 60) / 2, paddingBottom: 0, paddingRight: (self.frame.width - 60) / 2, width: 60, height: 24)
        
        addSubview(dayLabel)
        dayLabel.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: (self.frame.width - 60) / 2, paddingBottom: 40, paddingRight: (self.frame.width - 60) / 2, width: 60, height: 44)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("missing errors")
    }
}
