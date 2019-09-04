//
//  HomeViewController.swift
//  InstagramHome
//
//  Created by Daulet on 04/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    let posts: [Post] = [
        Post(authorNickname: "almagambetoff",
             authorAvatarImage: UIImage(named: "ava"),
             postImage: UIImage(named: "i1"),
             postContentText: "Text1"),
        Post(authorNickname: "almagambetoff",
             authorAvatarImage: UIImage(named: "ava"),
             postImage: UIImage(named: "i2"),
             postContentText: "Text1"),
        Post(authorNickname: "almagambetoff",
             authorAvatarImage: UIImage(named: "ava"),
             postImage: UIImage(named: "i3"),
             postContentText: "Text1"),
        Post(authorNickname: "almagambetoff",
             authorAvatarImage: UIImage(named: "ava"),
             postImage: UIImage(named: "i4"),
             postContentText: "Text1")
    ]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
}

private extension HomeViewController {
    
    func commonInit() {
        setupSubviews()
        setupConstraints()
        view.backgroundColor = .white
    }
    
    func setupSubviews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { [unowned self] (make) in
            make.left.top.right.bottom.equalTo(self.view.safeAreaInsets)
        }
    }
    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseIdentifier, for: indexPath) as! PostCell
        cell.configureCell(for: posts[indexPath.row])
        return cell
    }
    
    
}
