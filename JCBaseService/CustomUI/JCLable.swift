//
//  JCLable.swift
//  JCBaseService
//
//  Created by 赵凯 on 2024/4/16.
//

import UIKit

public class JCLable: UILabel {

    var edgeInsets: UIEdgeInsets = .zero

    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: edgeInsets))
    }

    public override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {

        let insets = edgeInsets
        var rect = super.textRect(forBounds: bounds.inset(by: insets), limitedToNumberOfLines: numberOfLines)

        rect.origin.x -= insets.left
        rect.origin.y -= insets.top
        rect.size.width += (insets.left + insets.right)
        rect.size.height += (insets.top + insets.bottom)
        return rect
    }

}
