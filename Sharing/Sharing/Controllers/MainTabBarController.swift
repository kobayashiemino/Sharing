//
//  MainTabBarController.swift
//  Sharing
//
//  Created by kobayashi emino on 2020/08/28.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeController = templeteViewController(image: "house", selectedImage: "house.fill", viewController: HomeViewController())
        let organizationViewController = templeteViewController(image: "person.3", selectedImage: "person.3.fill", viewController: OrgnizationViewController())
        let personViewController = templeteViewController(image: "person", selectedImage: "person.fill", viewController: PersonViewController())
        let productViewController = templeteViewController(image: "bag", selectedImage: "bag.fill", viewController: ProductViewController())
        let communityViewController = templeteViewController(image: "bubble.left.and.bubble.right", selectedImage: "bubble.left.and.bubble.right.fill", viewController: CommuintyViewController())
        
        viewControllers = [homeController,
                           organizationViewController,
                           personViewController,
                           productViewController,
                           communityViewController]
    }
    
    private func templeteViewController(image: String, selectedImage: String, viewController: UIViewController) -> UINavigationController {
        
        let VC = viewController
        let navVC = UINavigationController(rootViewController: VC)
        navVC.tabBarItem.image = UIImage(systemName: image)
        navVC.tabBarItem.selectedImage = UIImage(systemName: selectedImage)
        navVC.navigationBar.isHidden = true
        return navVC
    }
}
