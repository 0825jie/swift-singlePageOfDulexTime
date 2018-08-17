//
//  Day.swift
//  SingleSheet
//
//  Created by GetHired on 8/14/18.
//  Copyright © 2018 GetHired.Jiacheng. All rights reserved.
//

import UIKit

class Day : UICollectionViewCell {
    
    var weekday : Weekday? {
        didSet{
            let dayString = weekday?.day
            let attributedText = NSMutableAttributedString(string: dayString!, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
            dayLabel.attributedText = attributedText
        }
       
    }

    
    let dayLabel : UITextView = {
        let label = UITextView()
        let attributedText = NSMutableAttributedString(string: "Monday, May 1", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedStringKey.foregroundColor: UIColor.black])
        label.attributedText = attributedText
        label.isEditable = false
        label.isScrollEnabled = false
        label.backgroundColor = .clear
        return label
    }()
    
    let time : UITextView = {
        let label = UITextView()
        let attributedText = NSMutableAttributedString(string: "8h 30min", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        label.attributedText = attributedText
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    let rightArrowButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "right_arrow").withRenderingMode(.alwaysOriginal), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
        
    }
    
    fileprivate func setupContentView(){
        addSubview(dayLabel)
        dayLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 200, height: 36)
        
        addSubview(time)
        time.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 20, width: 120, height: 36)
        backgroundColor = UIColor(hue: 105/360, saturation: 2/100, brightness: 97/100, alpha: 1.0)
        
        addSubview(rightArrowButton)
        rightArrowButton.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 5, width: 20, height: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("missing errors")
    }
}
