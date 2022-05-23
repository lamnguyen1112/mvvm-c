//
//  CGFloat+Ẽ.swift
//  Template
//
//  Created by Lam Nguyen on 5/23/22.
//

import UIKit

extension CGFloat {
    /**
     The relative dimension to the corresponding screen size.
     
     //Usage
     let someView = UIView(frame: CGRect(x: 0, y: 0, width: 320.dp, height: 40.dp)
     
     **Warning** Only works with size references from @1x mockups.
     
     */
    var dp: CGFloat {
        return (self / 375) * UIScreen.main.bounds.width
    }
}
