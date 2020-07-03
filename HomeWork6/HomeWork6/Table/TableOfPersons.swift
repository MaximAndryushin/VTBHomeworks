//
//  CustomTable.swift
//  HomeWork6
//
//  Created by Maxim Andryushin on 03.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

class TableOfPersons: UITableViewCell {
    
    // MARK: ~ Constants
    
    private enum Locals {
        static let sizeOfFont: CGFloat = 20
        static let colorOfText: UIColor = .black
        static let heightOfLabel: CGFloat = 40
    }
    
    // MARK: - Properties
    
    private var nameTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: Locals.sizeOfFont)
        label.textColor = Locals.colorOfText
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var viewModel: Person? {
        didSet {
            if let viewModel = viewModel {
                updateContent(with: viewModel)
            }
        }
    }
    
    
    // MARK: ~Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(nameTextLabel)
        
        nameTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameTextLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameTextLabel.heightAnchor.constraint(equalToConstant: Locals.heightOfLabel),
            nameTextLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            nameTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    
    // MARK: - Lifecycle

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - Public
    
    private func updateContent(with viewModel: Person) {
        nameTextLabel.text = viewModel.nameValue
    }
}
