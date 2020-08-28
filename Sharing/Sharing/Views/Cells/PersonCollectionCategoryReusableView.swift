//
//  PersonCollectionCategoryReusableView.swift
//  Sharing
//
//  Created by kobayashi emino on 2020/08/28.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

class PersonCollectionCategoryReusableCell: UICollectionReusableView {
    
    static let identifier = "PersonCollectionCategoryReusableCell"
    
    private var collectionView: UICollectionView?
    
    private let plusButton: UIButton = {
        let button =  UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        guard let collectionView = collectionView else { return }
        addSubview(collectionView)
        addSubview(plusButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView?.frame = CGRect(x: 0,
                                       y: 0,
                                       width: width - 50,
                                       height: height)
        let size: CGFloat = 40
        plusButton.frame = CGRect(x: width - size - 5,
                                  y: 5,
                                  width: size,
                                  height: size)
        plusButton.backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PersonCollectionCategoryReusableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .yellow
        return cell
    }
    
    
}
