//
//  HeaderCell.swift
//  MAPD714-DialogViewer
//
//  Created by Timofei Sopin on 2017-12-13.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import UIKit

class HeaderCell: ContentCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.8, alpha: 1.0)
        label.textColor = UIColor.black
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override class func defaultFont() -> UIFont {
        return UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
    }
    
    
}
