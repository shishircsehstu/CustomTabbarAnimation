//
//  ParentViewController.swift
//  CustomTabBarSwift
//
//  Created by IAPPS on 22/4/21.
//

import UIKit

class ParentViewController: UIViewController {
    
    @IBOutlet weak var settingsBtnOutlet: UIButton!
    @IBOutlet weak var favouriteBtnOutlet: UIButton!
    @IBOutlet weak var homeBtnOutlet: UIButton!
    @IBOutlet weak var historyBtnOutlet: UIButton!
    
    @IBOutlet weak var settingsConainerView: UIView!
    @IBOutlet weak var favouriteContainerView: UIView!
    @IBOutlet weak var historyContainerView: UIView!
    @IBOutlet weak var homeContainerView: UIView!
    
    @IBOutlet weak var movingView: UIView!
    @IBOutlet weak var customtTbBarView: UIView!
    var tabBarViewController: TabBarViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Helper.share.tabBarDelegate = self
        setupTabBarController()
        
        //tabBarViewController.delegate = self
        manageUI()
    }
    
    func manageUI(){
        movingView.layer.cornerRadius = 2
    }
    
    func setupTabBarController(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        tabBarViewController = (storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController)
        
        tabBarViewController.view.frame = view.frame//CGRect(x: 0, y: 0, width: 414, height: 896)
        
        self.view.addSubview(tabBarViewController.view)
        self.addChild(tabBarViewController)
        tabBarViewController.didMove(toParent: parent)
        
        
        homeBtnOutlet.tag = 0
        homeBtnOutlet.addTarget(self, action: #selector(tabBarItemButtonAction(_:)), for: .touchUpInside)
        
        historyBtnOutlet.tag = 1
        historyBtnOutlet.addTarget(self, action: #selector(tabBarItemButtonAction(_:)), for: .touchUpInside)
        
        favouriteBtnOutlet.tag = 2
        favouriteBtnOutlet.addTarget(self, action: #selector(tabBarItemButtonAction(_:)), for: .touchUpInside)
        
        
        settingsBtnOutlet.tag = 3
        settingsBtnOutlet.addTarget(self, action: #selector(tabBarItemButtonAction(_:)), for: .touchUpInside)
        
        self.view.bringSubviewToFront(customtTbBarView)
        self.tabBarViewController.selectedIndex = 0
    }
    
    @objc func tabBarItemButtonAction (_ button:UIButton){
        
        // NotificationCenter.default.post(name: Notification.Name("ADD_DOCUMENT_OF_DROP_BOX"), object: nil, userInfo: nil)
        
        print("index.. ", button.tag)
        //  self.tabBarViewController.selectedIndex = button.tag
        
        
        
        let index = button.tag
        
        animateTabBarChange(tabBarController: self.tabBarViewController!, to: self.tabBarViewController!.viewControllers![index])
        //  self.tabBarController?.selectedIndex = index
        tabBarViewController.index = button.tag
        manageTabIconSelectAnddeselect(index: button.tag)
    }
    
    func manageTabIconSelectAnddeselect(index: Int){
        
        var leading_x = CGFloat(0)
        if index == 0{
            leading_x = homeContainerView.frame.origin.x
        }
        else if index == 1{
            leading_x = historyContainerView.frame.origin.x
        }
        else if index == 2{
            leading_x = favouriteContainerView.frame.origin.x
        }
        else if index == 3{
            leading_x = settingsConainerView.frame.origin.x
        }
        leading_x+=10
        UIView.animate(withDuration: 0.5) {
            self.movingView.frame.origin.x = leading_x
        } completion: { (finished) in
            
        }
    }
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        animateTabBarChange(tabBarController: tabBarController, to: viewController)
        return true
    }
    
    func animateTabBarChange(tabBarController: UITabBarController, to viewController: UIViewController) {
        
        let fromView: UIView = tabBarController.selectedViewController!.view
        let toView: UIView = viewController.view
        
        if fromView != toView {
            
            UIView.transition(from: fromView, to: toView, duration: 0.8, options: [.transitionCrossDissolve], completion: nil)
            
            //transitionCrossDissolve
            //transitionFlipFromLeft
        }
        // do whatever animation you like
        
    }
}




extension ParentViewController: TabBarDelegate{
    func isHideTabBar(flag: Bool) {
        customtTbBarView.isHidden = flag
    }
    
}


