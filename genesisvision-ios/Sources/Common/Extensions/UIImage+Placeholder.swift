//
//  UIImage+Placeholder.swift
//  genesisvision-ios
//
//  Created by George Shaginyan on 04.02.18.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit.UIImage

extension UIImage {
    static var placeholder: UIImage =  #imageLiteral(resourceName: "gv_logo")
    static var noDataPlaceholder: UIImage = #imageLiteral(resourceName: "img_trader_nodata_placeholder")
    
    struct NavBar {
        static var ipfsList: UIImage = #imageLiteral(resourceName: "img_ipfs_list")
    }
}
