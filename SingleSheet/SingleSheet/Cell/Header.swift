//
//  Header.swift
//  SingleSheet
//
//  Created by GetHired on 8/13/18.
//  Copyright © 2018 GetHired.Jiacheng. All rights reserved.
//

import UIKit

class Header : UICollectionViewCell {
    
    
    var summary : Summary? {
        didSet{
            guard let strs = summary?.str else {return}
        let attributedText = NSMutableAttributedString(string: strs, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
          weekDayLabel.attributedText = attributedText
        }
    }
    
    let leftArrowButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "left_arrow").withRenderingMode(.alwaysOriginal), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    let rightArrowButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "right_arrow").withRenderingMode(.alwaysOriginal), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    let weekDayLabel : UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "MON, MAY 1 - SUN, MAY 7", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        label.attributedText = attributedText
        label.textAlignment = .center
        return label
    }()
    
    let statusLabel : UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Not Submitted", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.gray])
        label.attributedText = attributedText
        label.textAlignment = .center
        return label
    }()
    
    let timeLabel : UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Total: ", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.gray])
        attributedText.append(NSAttributedString(string: "55h 30min", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.black]))
        label.attributedText = attributedText
        label.textAlignment = .center
        return label
    }()
    
    let grossLabel : UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Gross Pay: ", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.gray])
        attributedText.append(NSAttributedString(string: "$550.00", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.black]))
        label.attributedText = attributedText
        label.textAlignment = .center
        return label
    }()
    
    let reminderLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "4  Missing Punches ", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedStringKey.foregroundColor: UIColor.red])
        label.layer.borderWidth = 4
        label.layer.cornerRadius = 20
        label.textAlignment = .center
        label.layer.borderColor = UIColor.red.cgColor
        label.attributedText = attributedText
        return label
    }()
    
    let divider : UIView = {
        let iv = UIView()
        iv.backgroundColor = .gray
        return iv
    }()
    
   
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(hue: 240/360, saturation: 0/100, brightness: 96/100, alpha: 1.0)
        
        setupContentView()
        
    }
    
    fileprivate func setupContentView(){
        addSubview(leftArrowButton)
        leftArrowButton.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 25, height: 25)
        addSubview(rightArrowButton)
        rightArrowButton.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 20, width: 25, height: 25)
        
        addSubview(weekDayLabel)
        weekDayLabel.anchor(top: topAnchor, left: leftArrowButton.rightAnchor, bottom: nil, right: rightArrowButton.leftAnchor, paddingTop: 20, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 0)
        
        addSubview(statusLabel)
        statusLabel.anchor(top: weekDayLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        // add time and gross label
        setupStackView()
        
        addSubview(divider)
        divider.anchor(top: statusLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: (self.frame.width - 1) / 2, paddingBottom: 0, paddingRight: (self.frame.width - 1) / 2, width: 1, height: 16)
        
        addSubview(reminderLabel)
        reminderLabel.anchor(top: timeLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: (self.frame.width - 220)/2, paddingBottom: 0, paddingRight: (self.frame.width - 220)/2, width: 0, height: 40)
    }
    
    fileprivate func setupStackView(){
        let stackView = UIStackView(arrangedSubviews: [timeLabel, grossLabel])
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: statusLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("missing")
    }
}
