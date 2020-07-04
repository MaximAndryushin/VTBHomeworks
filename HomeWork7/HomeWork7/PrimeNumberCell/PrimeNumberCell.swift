//
//  PrimeNumberCell.swift
//  HomeWork7
//
//  Created by Maxim Andryushin on 04.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

class PrimeNumberCell: UICollectionViewCell {
        
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
    
    var viewModel: PrimeNumberModel? {
        didSet {
            if let viewModel = viewModel {
                updateContent(with: viewModel)
            }
        }
    }
    
    
    // MARK: ~Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(nameTextLabel)
        NSLayoutConstraint.activate([
            nameTextLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameTextLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
        reset()
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
    }
    
    private func reset() {
        nameTextLabel.text = ""
    }
    
    // MARK: - Public
    
    private func updateContent(with viewModel: PrimeNumberModel) {
        nameTextLabel.text = viewModel.nameValue
    }

}
