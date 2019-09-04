//
//  ActionsView.swift
//  InstagramHome
//
//  Created by Daulet on 04/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import UIKit

class ActionsView: UIView {
    
    fileprivate enum Constants {
        static let likeSize = CGSize(width: 22, height: 22)
        static let likeImage = UIImage(named: "like")
        static let dislikeImage = UIImage(named: "dislike")
        static let likeTag = 1
        static let dislikeTag = 0
    }
    
    lazy var likeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(Constants.likeImage, for: .normal)
        button.addTarget(self, action: #selector(likeButtonDidiClicked), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(isLiked: Bool) {
        likeButton.tag = isLiked ? Constants.likeTag : Constants.dislikeTag
        upadteUI()
    }
    
    @objc
    private func likeButtonDidiClicked() {
        likeButton.toogle()
        upadteUI()
    }
    
    private func upadteUI() {
        if likeButton.isLiked {
            likeButton.setImage(Constants.likeImage, for: .normal)
        } else {
            likeButton.setImage(Constants.dislikeImage, for: .normal)
        }
        animate()
    }
    
    private func animate() {
        likeButton.transform = transform.scaledBy(x: 0.6, y: 0.6)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.35,
                       initialSpringVelocity: 0.2,
                       options: .curveEaseOut,
                       animations: {
                           self.likeButton.transform = CGAffineTransform.identity
                       },
                       completion: nil)
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

private extension UIButton {
    
    var isLiked: Bool {
        return tag == ActionsView.Constants.likeTag
    }
    
    func toogle() {
        if tag == ActionsView.Constants.likeTag {
            tag = ActionsView.Constants.dislikeTag
        } else {
            tag = ActionsView.Constants.likeTag
        }
    }
    
}
