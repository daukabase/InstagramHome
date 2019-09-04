//
//  PostCell.swift
//  InstagramHome
//
//  Created by Daulet on 04/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import UIKit
import SnapKit

final class PostCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: PostCell.self)
    
    private lazy var userDescription: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private lazy var postImageView: UIView = {
        let imageView = UIView(frame: .zero)
        
        return imageView
    }()
    
    private lazy var actionsView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

private extension PostCell {
    
    func commonInit() {
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        [userDescription, postImageView, actionsView, contentLabel].forEach(addSubview)
    }
    
    func setupConstraints() {
        userDescription.snp.makeConstraints { [unowned self] (make) in
            make.left.top.right.equalTo(self)
            make.height.equalTo(56)
        }
        
        postImageView.snp.makeConstraints { [unowned self, unowned userDescription, unowned postImageView] (make) in
            make.top.equalTo(userDescription.snp.bottom)
            make.left.right.equalTo(self)
            make.height.equalTo(postImageView.snp.width)
        }
        
        actionsView.snp.makeConstraints { [unowned self, unowned postImageView] (make) in
            make.top.equalTo(postImageView.snp.bottom)
            make.left.right.equalTo(self)
            make.height.equalTo(42)
        }
        
        contentLabel.snp.makeConstraints { [unowned self, unowned actionsView] (make) in
            make.bottom.equalTo(self).offset(-16)
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-16)
            make.top.equalTo(actionsView.snp.bottom)
        }
    }
    
}