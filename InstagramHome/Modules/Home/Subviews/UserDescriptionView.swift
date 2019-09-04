//
//  UserDescriptionView.swift
//  InstagramHome
//
//  Created by Daulet on 04/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import UIKit

class UserDescriptionView: UIView {
    
    private enum Constants {
        static let imageViewSize = CGSize(width: 32, height: 32)
    }
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = Constants.imageViewSize.height / 2
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    lazy var nicknameLabel = UILabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


private extension UserDescriptionView {
    
    func commonInit() {
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        [avatarImageView, nicknameLabel].forEach(addSubview)
    }
    
    func setupConstraints() {
        avatarImageView.snp.makeConstraints { [unowned self] (make) in
            make.left.equalTo(self).offset(12)
            make.centerY.equalTo(self)
            make.size.equalTo(Constants.imageViewSize)
        }
        nicknameLabel.snp.makeConstraints { [unowned avatarImageView] (make) in
            make.left.equalTo(avatarImageView.snp.right).offset(12)
            make.centerY.equalTo(avatarImageView)
        }
    }
    
}
