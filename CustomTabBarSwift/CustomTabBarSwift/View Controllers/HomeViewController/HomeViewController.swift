//
//  HomeViewController.swift
//  CustomTabBarSwift
//
//  Created by IAPPS on 22/4/21.
//
import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manageUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        Helper.share.tabBarDelegate?.isHideTabBar(flag: false)
    }
    func manageUI(){
        
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func pickBtnPressed(_ sender: Any) {
        
        guard let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "PickerViewController") as? PickerViewController else{
            return
        }
       vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: pickerVcDelegate{
    func getValue(index: Int) {
        print("my value", index)
    }
    
    
}
