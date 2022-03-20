//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Alexander on 14.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        self.addSubview(userImage)
        self.addSubview(userName)
        self.addSubview(setStatusButton)
        self.addSubview(statusTextField)
    }
    
    
    let userImage: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.image = UIImage(named: "bruce")
        avatarImage.frame = CGRect(x: 16, y: 16, width: 125, height: 125)
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.translatesAutoresizingMaskIntoConstraints = true
        avatarImage.clipsToBounds = true
        return avatarImage
    }()
    
    let userName: UILabel = {
        let nameField = UILabel()
        nameField.text = "Bruce The Cat"
        nameField.font = .boldSystemFont(ofSize: 18)
        nameField.textColor = .black
        nameField.frame = CGRect(x: 180, y: 27, width: 200, height: 18)
        return nameField
    }()
    
    var statusTextField: UITextField = {
        let text = UITextField()
        text.textColor = .darkGray
        text.attributedPlaceholder = NSAttributedString.init(string: "Ваш статус...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        text.frame = CGRect(x: 180, y: 123, width: 200, height: 14)
        return text
    }()
    
    var setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.frame = CGRect(x: 16, y: 157, width: 395, height: 50)
        button.layer.cornerRadius = 14
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitle("Показать статус", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(pushTheButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = true
        return button
    }()
    
    @objc func pushTheButton(){
        
        if let text = statusTextField.text{
            print(text)
        }
        
    }
    
}
