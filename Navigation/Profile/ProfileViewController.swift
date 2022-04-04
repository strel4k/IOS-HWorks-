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
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        layout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(profileHeaderView)
        self.profileHeaderView.frame = self.view.frame
        self.profileHeaderView.backgroundColor = .lightGray
    }
    
    private func layout() {
        view.addSubview(profileHeaderView)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        profileHeaderView.userImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.userImage.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 16),
            profileHeaderView.userImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileHeaderView.userImage.widthAnchor.constraint(equalToConstant: 125),
            profileHeaderView.userImage.heightAnchor.constraint(equalToConstant: 125)
        ])
        
        profileHeaderView.userName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.userName.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 27),
            profileHeaderView.userName.leadingAnchor.constraint(equalTo: profileHeaderView.centerXAnchor, constant: -40),
            profileHeaderView.userName.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        profileHeaderView.statusTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.statusTextField.bottomAnchor.constraint(equalTo: profileHeaderView.setStatusButton.topAnchor, constant: -34),
            profileHeaderView.statusTextField.leadingAnchor.constraint(equalTo: profileHeaderView.centerXAnchor, constant: -40),
            profileHeaderView.statusTextField.heightAnchor.constraint(equalToConstant: 14)
        ])
        
        profileHeaderView.setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.setStatusButton.topAnchor.constraint(equalTo: profileHeaderView.userImage.bottomAnchor, constant: 16),
            profileHeaderView.setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            profileHeaderView.setStatusButton.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16),
            profileHeaderView.setStatusButton.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -16)
        ])
        
        profileHeaderView.button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            profileHeaderView.button.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 0),
            profileHeaderView.button.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: 0)
        ])
    }
}
