//
//  LikeableImageView.swift
//  InstagramHome
//
//  Created by Daulet on 04/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import UIKit

final class LikeableImageView: UIImageView, UIGestureRecognizerDelegate {
    
    enum Constants {
        static let animationDurationMillis = 500
        static let likeSize = CGSize(width: 128, height: 128)
    }
    
    var onLike: EmptyClosure?
    
    private lazy var likeImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "biglike")
        imageView.isHidden = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func didDoubleTapImage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(Constants.animationDurationMillis)) {
            self.likeImageView.isHidden = true
        }
        likeImageView.isHidden = false
        animate()
        onLike?()
    }

    private func animate() {
        likeImageView.transform = transform.scaledBy(x: 0.6, y: 0.6)
        let duration = Double(Constants.animationDurationMillis) / 1000
        
        UIView.animate(withDuration: duration,
                       delay: 0.0,
                       usingSpringWithDamping: 0.35,
                       initialSpringVelocity: 0.2,
                       options: .curveEaseOut,
                       animations: {
                           self.likeImageView.transform = CGAffineTransform.identity
                       },
                       completion: nil)
    }
}

private extension LikeableImageView {
    
    private func commonInit() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        [likeImageView].forEach(addSubview)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(didDoubleTapImage))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.delegate = self
        
        addGestureRecognizer(doubleTap)
    }
    
    private func setupConstraints() {
        likeImageView.snp.makeConstraints { [unowned self] (make) in
            make.center.equalTo(self)
            make.size.equalTo(Constants.likeSize)
        }
    }
    
}
