//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Alexander on 11.03.2022.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate {
    
    let profileHeaderView = ProfileHeaderView()
    let posts = Post.createPostsArray()
    lazy var tableView: UITableView = {
        var myTableView = UITableView()
        myTableView.backgroundColor = .white
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        return myTableView
    } ()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Мой профиль"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        profileHeaderView.statusTextField.delegate = self
        layout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(profileHeaderView)
        self.profileHeaderView.frame = self.view.frame
        self.profileHeaderView.backgroundColor = .lightGray
    }
    
    private func layout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHeaderView)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderView.userImage.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderView.userName.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderView.statusTextField.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderView.setStatusButton.translatesAutoresizingMaskIntoConstraints = false
//        profileHeaderView.button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            profileHeaderView.userImage.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 16),
            profileHeaderView.userImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileHeaderView.userImage.widthAnchor.constraint(equalToConstant: 125),
            profileHeaderView.userImage.heightAnchor.constraint(equalToConstant: 125),
            
            profileHeaderView.userName.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 27),
            profileHeaderView.userName.leadingAnchor.constraint(equalTo: profileHeaderView.centerXAnchor, constant: -40),
            profileHeaderView.userName.heightAnchor.constraint(equalToConstant: 18),
            
            profileHeaderView.statusTextField.bottomAnchor.constraint(equalTo: profileHeaderView.setStatusButton.topAnchor, constant: -34),
            profileHeaderView.statusTextField.leadingAnchor.constraint(equalTo: profileHeaderView.centerXAnchor, constant: -40),
            profileHeaderView.statusTextField.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -16),
            profileHeaderView.statusTextField.heightAnchor.constraint(equalToConstant: 30),
            profileHeaderView.setStatusButton.topAnchor.constraint(equalTo: profileHeaderView.userImage.bottomAnchor, constant: 16),
            profileHeaderView.setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            profileHeaderView.setStatusButton.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16),
            profileHeaderView.setStatusButton.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -16)
            
//            profileHeaderView.button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
//            profileHeaderView.button.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 0),
//            profileHeaderView.button.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: 0)
            
            
        ])
        
        
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
        cell.setupCell(feed: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var vw = UIView()
        vw = profileHeaderView
        vw.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 220)
        return vw
    }
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        view.endEditing(true)
        return true
    }
}
