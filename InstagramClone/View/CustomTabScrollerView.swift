//
//  CustomTabScrollerView.swift
//  InstagramClone
//
//  Created by Prashant Tukadiya on 21/03/21.
//

import Foundation
import SwiftUI
import UIKit

struct CustomPageViewController:UIViewControllerRepresentable {
  
    
    var controllers : [UIViewController]
      
    let screenFrame = UIScreen.main.bounds
    @Binding var currentSelectedIndex:Int
    @State private var prevIndex = 0
   
    
    func makeUIViewController(context: Context) ->  UIPageViewController {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        pageVC.dataSource = context.coordinator
        pageVC.delegate = context.coordinator
        
        pageVC.setViewControllers([controllers[currentSelectedIndex]], direction: .forward, animated: true, completion: nil)
                
        return pageVC

    }
  
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        
        print("currentSelectedIndex",currentSelectedIndex)
        
        
        if    let visibleViewController = uiViewController.viewControllers?.first,
              let index = controllers.firstIndex(of: visibleViewController) {
            
            
            uiViewController.setViewControllers([controllers[currentSelectedIndex]], direction: index < currentSelectedIndex ?  .forward : .reverse, animated: true, completion: nil)
        } else {
            uiViewController.setViewControllers([controllers[currentSelectedIndex]], direction: .forward, animated: false, completion: nil)

        }
        //  prevIndex = currentSelectedIndex
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    class Coordinator:NSObject,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
        var parent:CustomPageViewController
        
        init(_ pageViewController:CustomPageViewController) {
            self.parent = pageViewController
        }
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return nil
            }
            return parent.controllers[index - 1]

        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == parent.controllers.count {
                return nil
            }
            return parent.controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
                let visibleViewController = pageViewController.viewControllers?.first,
                let index = parent.controllers.firstIndex(of: visibleViewController)
            {
                parent.currentSelectedIndex = index
            }

        }
        
    }
}
