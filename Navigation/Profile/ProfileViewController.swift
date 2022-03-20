//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Alexander on 11.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Мой профиль"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(profileHeaderView)
        self.view.frame.origin = CGPoint(x: 0, y: self.view.safeAreaInsets.top)
        self.profileHeaderView.frame = self.view.frame
        self.profileHeaderView.backgroundColor = .lightGray
        
    }
}
