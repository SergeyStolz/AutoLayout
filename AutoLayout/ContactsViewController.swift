//
//  ContactsViewController.swift
//  AutoLayout
//
//  Created by mac on 02.10.2021.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let contacts = ["Noah", "Liam", "William",
                    "Mason", "James", "Benjamin",
                    "Jacob", "Michael", "Elijah"]
    let contactPreviewView = ContactPreviewView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setupTableViewLayout()
        configureTapGesture()
    }
    
    private func setupTableViewLayout() {
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        let contact = contacts[indexPath.row]
        contactPreviewView.labelView.text = contact
        view.addSubview(contactPreviewView)
        
        
        contactPreviewView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contactPreviewView.widthAnchor.constraint(equalToConstant: 150),
            contactPreviewView.heightAnchor.constraint(equalToConstant: 150),
            contactPreviewView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contactPreviewView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        contactPreviewView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        contactPreviewView.alpha = 0
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            self.contactPreviewView.alpha = 1
            self.contactPreviewView.transform = CGAffineTransform.identity
        }
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(hideContactPreview))
        contactPreviewView.addGestureRecognizer(tapGesture)
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func hideContactPreview() {
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            guard let self = self else { return }
            self.contactPreviewView.transform =
            CGAffineTransform(scaleX: 1.25, y: 1.25)
            self.contactPreviewView.alpha = 0
        }
        ) { (success) in
            self.contactPreviewView.removeFromSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        let contact = contacts[indexPath.row]
        
        cell.textLabel?.text = contact
        cell.accessoryType = UITableViewCell.AccessoryType.detailButton
        
        return cell
    }
}

