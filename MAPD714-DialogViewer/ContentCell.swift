//
//  ContentCell.swift
//  MAPD714-DialogViewer
//
//  Created by Timofei Sopin on 2017-12-13.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import UIKit

class ContentCell: UICollectionViewCell {
    var label: UILabel!
    var maxWidth: CGFloat!
    var text: String! {
        get {
        return label.text
    }
    set(newText) {
    label.text = newText
    var newLabelFrame = label.frame
    var newContentFrame = contentView.frame
    let textSize = type(of: self).sizeForContentString(s: newText, forMaxWidth: maxWidth)
    newLabelFrame.size = textSize
    newContentFrame.size = textSize
    label.frame = newLabelFrame
    contentView.frame = newContentFrame
     }
    
    }
    
    class func sizeForContentString(s: String, forMaxWight maxWidth: CGFloat) -> CGSize {
        return CGSize.zero
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel(frame: self.contentView.bounds)
        label.isOpaque = false
        label.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0)
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        contentView.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class func sizeForContentString(s: String, forMaxWidth maxWidth: CGFloat) -> CGSize {
        let maxSize = CGSize(width: maxWidth, height: 1000.0)
        let opts = NSStringDrawingOptions.usesLineFragmentOrigin
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = NSLineBreakMode.byCharWrapping
        
        let attributes = [NSAttributedStringKey.font: defaultFont(),NSAttributedStringKey.paragraphStyle: style]
        
        let string = s as NSString
        let rect = string.boundingRect(with: maxSize, options: opts, attributes: attributes, context: nil)
        return rect.size
    }
    
    class func defaultFont() -> UIFont {
        return UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    }
    
}
