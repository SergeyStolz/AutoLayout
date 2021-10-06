//
//  ProfileViewController.swift
//  AutoLayout
//
//  Created by mac on 02.10.2021.
//

import UIKit

class ProfileViewController: UIViewController, UIScrollViewDelegate {
    
    private lazy var headView = ProfilePreviewView()
    private let mainStackView = UIStackView()
    private let scrollView = UIScrollView()
    
    private let settingButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Settings", for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 37.5
        button.backgroundColor = .blue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .systemGray4
        setupScrollView()
        setupMainStackView()
        setupCallButton()
    }
    
    private func setupHeadView() {
        mainStackView.addArrangedSubview(headView)
        headView.translatesAutoresizingMaskIntoConstraints = false
        headView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    private func setupMainStackView() {
        mainStackView.axis = .vertical
        mainStackView.distribution = .equalSpacing
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.backgroundColor = .systemBackground
        scrollView.addSubview(mainStackView)
        
        let contentLayoutGuide = scrollView.contentLayoutGuide
        NSLayoutConstraint.activate([
            mainStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor)
        ])
        setupHeadView()
        setupButtons()
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        let frameLayoutGuide = scrollView.frameLayoutGuide
        NSLayoutConstraint.activate([
            frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            frameLayoutGuide.bottomAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ProfileViewController {
    private func createButton(text: String, color: UIColor = .blue) -> UIButton {
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 55).isActive = true
        button.setTitle(text, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }
    
    func setupButtons() {
        let buttonTitles = [
            "Share Profile", "Favorites Messages", "Saved Messages",
            "Bookmarks", "History", "Notifications", "Find Friends",
            "Security", "Help", "Logout"]
        
        let buttonStack = UIStackView()
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.alignment = .fill
        buttonStack.axis = .vertical
        buttonStack.distribution = .equalSpacing
        
        buttonTitles.forEach { (buttonTitle) in
            buttonStack.addArrangedSubview(createButton(text: buttonTitle))
        }
        
        mainStackView.addArrangedSubview(buttonStack)
        NSLayoutConstraint.activate([
            buttonStack.widthAnchor.constraint(equalTo: mainStackView.widthAnchor),
            buttonStack.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor)
        ])
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        let buttonTitle = sender.titleLabel?.text ?? ""
        let message = "\(buttonTitle) button has been pressed"
        
        let alert = UIAlertController(
            title: "Button Pressed",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func setupCallButton() {
        scrollView.addSubview(settingButton)
        NSLayoutConstraint.activate([
            settingButton.widthAnchor.constraint(equalToConstant: 75),
            settingButton.heightAnchor.constraint(equalToConstant: 75),
            settingButton.trailingAnchor.constraint(equalTo:
                                                        scrollView.contentLayoutGuide.trailingAnchor, constant: -20),
            settingButton.bottomAnchor.constraint(equalTo:
                                                    scrollView.contentLayoutGuide.bottomAnchor, constant: -50),
        ])
    }
}
