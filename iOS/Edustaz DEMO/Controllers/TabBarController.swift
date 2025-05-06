//
//  TabBarController.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 3/18/25.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabs()
        setupTabBarAppearance()
    }
    
    func setupTabs() {
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let materialsVC = UINavigationController(rootViewController: MaterialsViewController())
        let certificateVC = UINavigationController(rootViewController: CerticateViewController())
        let courseVC = UINavigationController(rootViewController: CourseViewController())
        let olympiadVC = UINavigationController(rootViewController: OlympiadViewController())
        
        
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home"), selectedImage: UIImage(named: "homeSelected"))
        materialsVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "material"), selectedImage: UIImage(named: "materialSelected"))
        certificateVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "certificate"), selectedImage: UIImage(named: "certificateSelected"))
        courseVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "course"), selectedImage: UIImage(named: "courseSelected"))
        olympiadVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "olympiad"), selectedImage: UIImage(named: "olympiadSelected"))

        
        setViewControllers( [homeVC, materialsVC, certificateVC, courseVC, olympiadVC], animated: false)
    }
    
    func setupTabBarAppearance() {
       let appearance = UITabBarAppearance()
       appearance.configureWithOpaqueBackground()
       appearance.backgroundColor = UIColor.white
       self.tabBar.standardAppearance = appearance
       self.tabBar.scrollEdgeAppearance = appearance
   }

}
