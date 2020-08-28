//
//  PersonCollectionHeaderReusableView.swift
//  Sharing
//
//  Created by kobayashi emino on 2020/08/28.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

protocol PersonCollectionHeaderReusableCellDelegate: AnyObject {
    func didTapInfoButton()
    func didTapFollowerButton()
    func didTapFollowingButton()
}

class PersonCollectionHeaderReusableCell: UICollectionReusableView {
    
    static let identifier = "PersonCollectionHeaderReusableView"
    
    weak var delegate: PersonCollectionHeaderReusableCellDelegate?
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let infoButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("インフォメーション", for: .normal)
        return button
    }()
    
    private let followerButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("フォロワー", for: .normal)
        return button
    }()
    
    private let followingButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("フォロー中", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        addSubviews()
        addActions()
    }
    
    private func addSubviews() {
        addSubview(profileImageView)
        addSubview(infoButton)
        addSubview(followerButton)
        addSubview(followingButton)
    }
    
    private func addActions() {
        infoButton.addTarget(self, action: #selector(didTapInfoButton), for: .touchUpInside)
        followerButton.addTarget(self, action: #selector(didTapfollowerButton), for: .touchUpInside)
        followingButton.addTarget(self, action: #selector(didTapfollowingButton), for: .touchUpInside)
    }
    
    @objc private func didTapInfoButton() {
        delegate?.didTapInfoButton()
    }
    
    @objc private func didTapfollowerButton() {
        delegate?.didTapFollowerButton()
    }
    
    @objc private func didTapfollowingButton() {
        delegate?.didTapFollowingButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = frame.height - 10
        profileImageView.frame = CGRect(x: 5,
                                        y: 5,
                                        width: size,
                                        height: size)
        profileImageView.layer.cornerRadius = size / 2
        infoButton.frame = CGRect(x: profileImageView.right + 5,
                                  y: 5,
                                  width: width - profileImageView.width - 15,
                                  height: size / 2)
        followerButton.frame = CGRect(x: profileImageView.right + 5,
                                      y: infoButton.bottom + 5,
                                      width: (width - profileImageView.width - 15) / 2,
                                      height: size / 2)
        followingButton.frame = CGRect(x: followerButton.right + 5,
                                       y: infoButton.bottom + 5,
                                       width: (width - profileImageView.width - 15) / 2,
                                       height: size / 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
