//
//  PersonViewController.swift
//  Sharing
//
//  Created by kobayashi emino on 2020/08/28.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        let size = (view.width - 4) / 3
        layout.itemSize = CGSize(width: size, height: size)
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        view.addSubview(collectionView)
        
        collectionView.register(PersonCollectionHeaderReusableCell.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: PersonCollectionHeaderReusableCell.identifier)
        collectionView.register(PersonCollectionCategoryReusableCell.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: PersonCollectionCategoryReusableCell.identifier)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        collectionView?.frame = view.bounds
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension PersonViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // MARK: - header
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize(width: view.width, height: view.height / 6)
        }
        else {
            return CGSize(width: view.width, height: 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section == 1 {
            let category = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: PersonCollectionCategoryReusableCell.identifier,
                                                                         for: indexPath) as! PersonCollectionCategoryReusableCell
            return category
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withReuseIdentifier: PersonCollectionHeaderReusableCell.identifier,
                                                                     for: indexPath) as! PersonCollectionHeaderReusableCell
        header.delegate = self
        return header
    }
    
    // MARK: - cell
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        else {
            return 30
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

extension PersonViewController: PersonCollectionHeaderReusableCellDelegate {
    func didTapInfoButton() {
        let vc = InfoTableViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapFollowerButton() {
        let vc = FollowerTableViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapFollowingButton() {
        let vc = FollowingTableViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
