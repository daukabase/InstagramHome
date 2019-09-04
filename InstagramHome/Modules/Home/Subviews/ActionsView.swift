//
//  ActionsView.swift
//  InstagramHome
//
//  Created by Daulet on 04/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import UIKit

class ActionsView: UIView {
    
    private enum Constants {
        static let likeSize = CGSize(width: 32, height: 32)
    }
    
    lazy var likeButton: UIButton = {
        let button = UIButton(frame: .zero)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


private extension ActionsView {
    
    func commonInit() {
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        [likeButton].forEach(addSubview)
    }
    
    func setupConstraints() {
        likeButton.snp.makeConstraints { (make) in
            make.size.equalTo(Constants.likeSize)
            make.centerY.equalTo(self)
            make.left.equalTo(16)
        }
    }
    
}
