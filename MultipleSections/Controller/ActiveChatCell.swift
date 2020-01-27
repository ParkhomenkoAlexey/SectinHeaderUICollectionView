//
//  ActiveChatCell.swift
//  MultipleSections
//
//  Created by Алексей Пархоменко on 13.01.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import Foundation
import UIKit

class ActiveChatCell: UICollectionViewCell {
    
    static var reuseId: String = "ActiveChatCell"
    
    let friendImageView = UIImageView()
    let gradientView = GradientView(from: .topTrailing, to: .bottomLeading, inColor: #colorLiteral(red: 0.7882352941, green: 0.631372549, blue: 0.9411764706, alpha: 1), toColor: #colorLiteral(red: 0.4784313725, green: 0.6980392157, blue: 0.9215686275, alpha: 1))
    let friendName = UILabel()
    let lastMessage = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 1, alpha: 1)
        setupElements()
        setupConstraints()
        
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        
    }
    
    func setupElements() {
        friendName.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configure(with chat: MChat) {
        friendName.text = chat.friendName
        lastMessage.text = chat.lastMessage
        friendImageView.image = UIImage(named: chat.friendImage)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Constraints
extension ActiveChatCell {
    func setupConstraints() {
        addSubview(friendImageView)
        addSubview(gradientView)
        addSubview(friendName)
        addSubview(lastMessage)
        
        // oponentImageView constraints
        friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        friendImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        friendImageView.widthAnchor.constraint(equalToConstant: 78).isActive = true
        friendImageView.heightAnchor.constraint(equalToConstant: 78).isActive = true
        
        // gradientView constraints
        gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        gradientView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        gradientView.widthAnchor.constraint(equalToConstant: 8).isActive = true
        gradientView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive  = true
        
        // oponentLabel constraints
        friendName.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        friendName.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16).isActive = true
        friendName.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16).isActive = true
        
        // lastMessageLabel constraints
        lastMessage.topAnchor.constraint(equalTo: friendName.bottomAnchor).isActive = true
        lastMessage.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16).isActive = true
        lastMessage.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: -16).isActive = true
    }
}
