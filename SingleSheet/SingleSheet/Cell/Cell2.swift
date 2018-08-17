//
//  Cell2.swift
//  SingleSheet
//
//  Created by GetHired on 8/16/18.
//  Copyright © 2018 GetHired.Jiacheng. All rights reserved.
//

import UIKit

class Cell2 : UIView {
    
    let rightArrowButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "right_arrow").withRenderingMode(.alwaysOriginal), for: .normal)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(sell(sender:)), for: .touchUpInside)
        return button
    }()
    
    @objc func sell(sender: UIButton){
        print(222222)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       addSubview(rightArrowButton)
        rightArrowButton.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("missing")
    }
}
