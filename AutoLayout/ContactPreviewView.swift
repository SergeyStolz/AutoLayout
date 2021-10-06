//
//  ContactPreviewView.swift
//  AutoLayout
//
//  Created by mac on 02.10.2021.
//

import UIKit

class ContactPreviewView: UIView {
    
    lazy var imageView: UIImageView = {
        var image = UIImageView()
        image.backgroundColor = .yellow
        image.image = UIImage(systemName: "gift")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var labelView: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadView()
    }
    
    func loadView() {
        let view = UIView()
        addSubview(view)
        view.addSubview(imageView)
        view.addSubview(labelView)
        setupLabelViewLayout()
        setupImageViewLayout()
    }
    
    func setupImageViewLayout() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        ])
    }
    
    func setupLabelViewLayout() {
        NSLayoutConstraint.activate([
            labelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            labelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            labelView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 2),
            labelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2)
        ])
    }
}

