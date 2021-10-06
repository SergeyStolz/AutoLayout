//
//  PreviewView.swift
//  AutoLayout
//
//  Created by mac on 02.10.2021.
//

import UIKit

class ProfilePreviewView: UIView {
    
    lazy var viewFull: UIView = {
        let view = UIView()
        let width:CGFloat = UIScreen.main.bounds.width*0.0533
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0,y: 0,width: width,height: width)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = width/2
        return view
    }()
    
    lazy var imageViewFull: UIImageView = {
        let imageView  = UIImageView()
        imageView.image = UIImage(systemName: "person")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var labelNameFull: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Full Name"
        label.font = label.font.withSize(28)
        label.textAlignment = .center
        label.backgroundColor = .systemGray6
        label.textColor = .black
        return label
    }()
    
    lazy var stackViewFull: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 8.0
        return stack
    }()
    
    lazy var btnMessage: UIButton = {
        let button = UIButton()
        button.setTitle("Message", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var btnCall: UIButton = {
        let button = UIButton()
        button.setTitle("Call", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var btnEmail: UIButton = {
        let button = UIButton()
        button.setTitle("Email", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        backgroundColor = .systemGray6
        let view = UIView()
        addSubview(view)
        view.addSubview(viewFull)
        viewFull.addSubview(imageViewFull)
        view.addSubview(labelNameFull)
        view.addSubview(stackViewFull)
        setupViewFullLayout()
        setupImageFullLayout()
        setupLabelNameFullLayout()
        setupStackViewLayout()
        setupButtons()
    }
    
    func setupViewFullLayout() {
        NSLayoutConstraint.activate([
            viewFull.widthAnchor.constraint(equalToConstant: 150),
            viewFull.heightAnchor.constraint(equalToConstant: 150),
            viewFull.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewFull.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50)
        ])
    }
    
    func setupImageFullLayout() {
        NSLayoutConstraint.activate([
            imageViewFull.leadingAnchor.constraint(equalTo: viewFull.leadingAnchor),
            imageViewFull.trailingAnchor.constraint(equalTo: viewFull.trailingAnchor),
            imageViewFull.topAnchor.constraint(equalTo: viewFull.topAnchor),
            imageViewFull.bottomAnchor.constraint(equalTo: viewFull.bottomAnchor)
        ])
    }
    
    func setupLabelNameFullLayout() {
        NSLayoutConstraint.activate([
            labelNameFull.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            labelNameFull.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            labelNameFull.topAnchor.constraint(equalTo: viewFull.bottomAnchor, constant: 10),
            labelNameFull.bottomAnchor.constraint(equalTo: stackViewFull.topAnchor, constant: -15)
        ])
    }
    
    func setupStackViewLayout() {
        NSLayoutConstraint.activate([
            stackViewFull.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            stackViewFull.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            stackViewFull.topAnchor.constraint(equalTo: labelNameFull.bottomAnchor, constant: 15),
            stackViewFull.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}

extension ProfilePreviewView {
    private func createButton(text: String, color: UIColor = .blue) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 55).isActive = true
        button.setTitle(text, for: .normal)
        return button
    }
    
    func setupButtons() {
        let buttonTitles = ["Message", "Call", "Email"]
        buttonTitles.forEach { (buttonTitle) in
            stackViewFull.addArrangedSubview(createButton(text: buttonTitle))
        }
    }
}
