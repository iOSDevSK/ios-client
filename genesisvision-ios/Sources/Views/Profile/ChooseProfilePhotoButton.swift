//
//  ChooseProfilePhotoButton.swift
//  genesisvision-ios
//
//  Created by George Shaginyan on 04.02.18.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit

class ChooseProfilePhotoButton: UIView {
    // MARK: - Outlets
    @IBOutlet var shadowView: UIView! {
        didSet {
            shadowView.roundCorners()
        }
    }
    
    @IBOutlet var photoImageView: UIImageView! {
        didSet {
            photoImageView.roundCorners()
        }
    }
    
    @IBOutlet var choosePhotoButton: UIButton! {
        didSet {
            choosePhotoButton.backgroundColor = .clear
        }
    }
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        photoImageView.roundCorners()
    }
    
    // MARK: - Public methdods
    func change(state: ProfileState) {
        choosePhotoButton.isHidden = state == .show
        shadowView.isHidden = state == .show
    }
}

