//
//  ViewController.swift
//  TOGGFINAL
//
//  Created by Developer on 04/10/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SlideMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        
    }
    
    func slideMenuItemSelectedAtIndex(_ index: Int32) {
        let topViewController : UIViewController = self.navigationController!.topViewController!
    }
    
   ///abcfckugikuhoih
    //s/ghkhgkjhikjhojkpo
   
   
    func addSlideMenuButton(){ /* button in navigation bar  view */
        
        print("first")
        let btnShowMenu = UIButton(type: UIButtonType.system)
        btnShowMenu.setImage(UIImage(named: "1.png"), for: UIControlState())
        btnShowMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnShowMenu.addTarget(self, action: #selector(onSlideMenuButtonPressed(_:)), for: UIControlEvents.touchUpInside)
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        self.navigationItem.leftBarButtonItem = customBarItem;
    }
    
    @objc func onSlideMenuButtonPressed(_ sender : UIButton){ /*action of button in navigation bar */
        print("second")
        self.navigationController?.isNavigationBarHidden = true
        if (sender.tag == 10)
        {
            self.slideMenuItemSelectedAtIndex(-1);
            sender.tag = 0;
            let viewMenuBack : UIView = view.subviews.last!
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
            }, completion: { (finished) -> Void in
                viewMenuBack.removeFromSuperview()
            })
            
            return
        }
        
        sender.isEnabled = false
        sender.tag = 10
        
        let menuVC : xyz = self.storyboard!.instantiateViewController(withIdentifier: "x") as! xyz /* side menu's view controller */
        menuVC.btnMenu = sender
        menuVC.delegate = self
        self.view.addSubview(menuVC.view)
        self.addChildViewController(menuVC)
        menuVC.view.layoutIfNeeded()
        
        
        menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            sender.isEnabled = true
        }, completion:nil)
    }

    
override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

