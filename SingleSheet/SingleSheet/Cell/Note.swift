//
//  Note.swift
//  SingleSheet
//
//  Created by GetHired on 8/15/18.
//  Copyright © 2018 GetHired.Jiacheng. All rights reserved.
//

import UIKit

class Note: UICollectionViewCell {
    let titleLabel : UITextView = {
        let tv = UITextView()
        let attributedText = NSMutableAttributedString(string: "Notes", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        tv.attributedText = attributedText
        tv.backgroundColor = .clear
        return tv
    }()
    
    let noteContent : UITextField = {
        let tf = UITextField()
        let attributedText = NSMutableAttributedString(string: " Enter your notes here", attributes: [NSAttributedStringKey.foregroundColor : UIColor.gray, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)])
        tf.attributedText = attributedText
        tf.backgroundColor = .white
        return tf
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
    
    }
    
    fileprivate func setupContentView(){
        backgroundColor = UIColor(hue: 240/360, saturation: 0/100, brightness: 96/100, alpha: 1.0)
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 12, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 60, height: 32)
        
        addSubview(noteContent)
        noteContent.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 12, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: self.frame.width - 40, height: 60)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("missing")
    }

}
