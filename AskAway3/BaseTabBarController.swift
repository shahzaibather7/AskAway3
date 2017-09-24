//
//  BaseTabBarController.swift
//  AskAway3
//
//  Created by Mohammad Shahzaib Ather on 2017-09-13.
//  Copyright © 2017 Mohammad Shahzaib Ather. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let layout = UICollectionViewFlowLayout()
        
        let homeController = HomeController(collectionViewLayout: layout)
        let homeViewControllerNav = UINavigationController(rootViewController: homeController)
        homeViewControllerNav.tabBarItem.title = "Home"
        homeViewControllerNav.tabBarItem.image = UIImage(named:"homeIcon")
      //  homeViewControllerNav.navigationController?.title = "Home"
        
        
        let tableViewControllerNav =  UINavigationController(rootViewController: TableViewController())
        tableViewControllerNav.tabBarItem.title = "My Jobs"
        tableViewControllerNav.tabBarItem.image = UIImage(named: "ic_work")
        
        let accountViewControllerNav =  UINavigationController(rootViewController: AccountViewController())
        accountViewControllerNav.tabBarItem.title = "Account"
        accountViewControllerNav.tabBarItem.image = UIImage(named: "account")
        
        let resumeViewControllerNav =  UINavigationController(rootViewController: ResumeViewController())
        resumeViewControllerNav.tabBarItem.title = "Resume"
        resumeViewControllerNav.tabBarItem.image = UIImage(named: "ic_assignment")
        viewControllers = [homeViewControllerNav ,resumeViewControllerNav, tableViewControllerNav,accountViewControllerNav ]
        
    }

 
}
