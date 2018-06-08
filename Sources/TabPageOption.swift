//
//  TabPageOption.swift
//  TabPageViewController
//
//  Created by EndouMari on 2016/02/24.
//  Copyright © 2016年 EndouMari. All rights reserved.
//

import UIKit

public enum HidesTopContentsOnSwipeType {
    case none
    case tabBar
    case navigationBar
    case all
}

public struct TabPageOption {

    public init() {}

    public var currentFont = UIFont(name: "HiraginoSans-W6", size: 13)!
    public var defaultFont = UIFont(name: "HiraginoSans-W3", size: 13)!
    public var currentBarColor = UIColor(red: 0.69, green: 0.62, blue: 1.00, alpha: 1.00)
    public var currentTextColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
    public var defaultTextColor = UIColor(red: 0.24, green: 0.27, blue: 0.31, alpha: 1.00)
    public var tabHeight: CGFloat = 40.0
    public var tabMargin: CGFloat = 20.0
    public var tabWidth: CGFloat?
    public var currentBarHeight: CGFloat = 4.0
    public var tabBackgroundColor = UIColor.white
    public var pageBackgoundColor = UIColor.white
    public var isTranslucent = false
    public var hidesTopViewOnSwipeType: HidesTopContentsOnSwipeType = .none

    internal var tabBarAlpha: CGFloat {
        return isTranslucent ? 0.95 : 1.0
    }
    internal var tabBackgroundImage: UIImage {
        return convertImage()
    }

    fileprivate func convertImage() -> UIImage {
        let rect : CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context : CGContext? = UIGraphicsGetCurrentContext()
        let backgroundColor = tabBackgroundColor.withAlphaComponent(tabBarAlpha).cgColor
        context?.setFillColor(backgroundColor)
        context?.fill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
