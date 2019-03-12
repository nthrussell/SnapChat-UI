//
//  PageVC.swift
//  SnapChat-Russell
//
//  Created by Minhajul Russell on 2019/03/12.
//  Copyright © 2019 Minhajul Russell. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var controllers:[UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.prepareControllers()
        setViewControllers([controllers[1]],
                           direction: UIPageViewController.NavigationDirection.forward,
                           animated: false,
                           completion: nil)
        
        self.dataSource = self
        self.delegate = self
    }
    
    func prepareControllers() {
        guard let storyboard = storyboard else {
            return
        }
        
        controllers = [
            storyboard.instantiateViewController(withIdentifier: "LeftVC"),
            storyboard.instantiateViewController(withIdentifier: "MiddleVC"),
            storyboard.instantiateViewController(withIdentifier: "RightVC")
        ]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = controllers.lastIndex(of: viewController) else {
            return nil
        }
        
        if index == 0 {
            return nil
        }
        
        return controllers[index.advanced(by: -1)]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.lastIndex(of: viewController) else {
            return nil
        }
        
        if index.advanced(by: 1) == controllers.count {
            return nil
        }
        
        return controllers[index.advanced(by: 1)]
    }

}
