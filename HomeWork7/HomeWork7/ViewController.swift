//
//  ViewController.swift
//  HomeWork7
//
//  Created by Maxim Andryushin on 04.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Constants

    private enum Locals {
        static let cellID = "cell"
        static let cellSize = CGSize(width: 300, height: 100)
        static let spacingBetweenSections: CGFloat = 100
        static let spacingBetweenCells: CGFloat = 40
        static let colorOfHeader: UIColor = .darkGray
        static let colorOfFooter: UIColor = .darkGray
        static let maxNumber: Int = 100
        static let backgroundColor: UIColor = .white
        static let cellInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        static let maxNumberCellsInSection = 10
    }


    // MARK: - Properties

    private var collectionView: UICollectionView!
    private var cellModels: [PrimeNumberModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        createCollectionView()
        configureCollectionView()
        loadData()
    }


    // MARK: - Configurations
    
    private func createCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = Locals.backgroundColor
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PrimeNumberCell.self, forCellWithReuseIdentifier: Locals.cellID)
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
           flowLayout.scrollDirection = .horizontal
        }
    }

    //Sieve of Eratosthenes with O(n) time complexity
    private func loadData(maxNumber: Int = Locals.maxNumber) {
        var leastDivisor = [Int](repeating: 0, count: maxNumber + 1)
        for i in 2...maxNumber {
            if (leastDivisor[i] == 0) {
                leastDivisor[i] = i;
                cellModels.append(PrimeNumberModel(with: i, onPosition: cellModels.count + 1))
            }
            for j in 0..<cellModels.count {
                if Int64(cellModels[j].getValue()) * Int64(i) > Int64(maxNumber) || cellModels[j].getValue() > leastDivisor[i] {
                    break
                }
                leastDivisor[i * cellModels[j].getValue()] = cellModels[j].getValue()
            }
        }
    }
}


// MARK: - UICollectionViewDataSource & UICollectionViewDelegate
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(Locals.maxNumberCellsInSection, cellModels.count - section * Locals.maxNumberCellsInSection)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return cellModels.count / Locals.maxNumberCellsInSection + (cellModels.count % Locals.maxNumberCellsInSection != 0 ? 1 : 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Locals.cellID, for: indexPath) as? PrimeNumberCell {
            cell.viewModel = cellModels[indexPath.section * Locals.maxNumberCellsInSection + indexPath.item]
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}


// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: Locals.cellSize.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return Locals.cellInsets
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Locals.spacingBetweenCells
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Locals.spacingBetweenSections
    }
}
