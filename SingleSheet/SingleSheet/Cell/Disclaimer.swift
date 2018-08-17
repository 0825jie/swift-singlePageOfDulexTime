//
//  Disclaimer.swift
//  SingleSheet
//
//  Created by GetHired on 8/15/18.
//  Copyright © 2018 GetHired.Jiacheng. All rights reserved.
//

import UIKit

class Disclaimer: UICollectionViewCell {
    
    
    
    
    
    let titleLabel : UITextView = {
        let tv = UITextView()
        let attributedText = NSMutableAttributedString(string: "Disclaimer", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18) ])
        tv.attributedText = attributedText
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.backgroundColor = .clear
        return tv
    }()
    
    let disclaimerContent : UITextView = {
        let tv = UITextView()
        let attributedText = NSMutableAttributedString(string: "I hereby agree that all info on my timesheet is accurate", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)])
        tv.attributedText = attributedText
        tv.backgroundColor = .clear
        return tv
    }()
    
    var checkButton : UIButton = {
        let bt = UIButton(type: .system)
        bt.setImage(#imageLiteral(resourceName: "checkbox").withRenderingMode(.alwaysOriginal), for: .normal)
        return bt
    }()
    
    var switchButton : UISwitch = {
        let st = UISwitch()
        st.isOn = false
        return st
    }()
 
    
    
    
    var acceptLabel : String? {
        
        didSet{
            if acceptLabel == "Accept"  {
                let attributedText = NSMutableAttributedString(string: "Accept", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedStringKey.foregroundColor: UIColor(red: 0.302, green: 0.6078, blue: 0, alpha: 1.0)])
                acceptLocal.attributedText = attributedText
                
               
            } else {
                let attributedText = NSMutableAttributedString(string: "Accept ?", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18),NSAttributedStringKey.foregroundColor: UIColor.red])
                acceptLocal.attributedText = attributedText
            }
        }
       
    }
    
    var acceptLocal : UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .clear
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        setupContentView()
        
    }
    
    fileprivate func setupContentView(){
        
        backgroundColor = UIColor(hue: 240/360, saturation: 0/100, brightness: 96/100, alpha: 1.0)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 12, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 180, height: 36)
        
        addSubview(disclaimerContent)
        disclaimerContent.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 12, paddingLeft: 20, paddingBottom: 0, paddingRight: 16, width: self.frame.width - 36, height: 70)
        
        addSubview(switchButton)
        switchButton.anchor(top: disclaimerContent.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 4, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 68, height: 18)
        
         addSubview(acceptLocal)
        acceptLocal.anchor(top: disclaimerContent.bottomAnchor, left: switchButton.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 120, height: 60)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("missing")
    }

}
