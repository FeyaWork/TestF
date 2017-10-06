//
//  xyz.swift
//  TOGGFINAL
//
//  Created by Developer on 04/10/17.
//  Copyright © 2017 Developer. All rights reserved.
//
// xyz is side menu page
import UIKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class xyz: UIViewController {
    
    @IBOutlet var btnCloseMenuOverlay : UIButton!
    var btnMenu : UIButton!
    var delegate : SlideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func onCloseMenuClick(_ button:UIButton!){    /* close button action */
        print("third")
        self.navigationController?.isNavigationBarHidden = false
        btnMenu.tag = 0 // uibutton = 0
        var index = 0
        if(button == self.btnCloseMenuOverlay){ /* in close button click index become -1 and */
            index = -1
        }
        delegate?.slideMenuItemSelectedAtIndex(Int32(index))
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        })
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
