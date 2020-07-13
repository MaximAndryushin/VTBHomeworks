//
//  Alert.swift
//  HomeWork10
//
//  Created by Maxim Andryushin on 13.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

class MyAlert: NSObject {

    static func showAlertWithTextField(controller: UIViewController) {
        let alertController = UIAlertController(title: "Add new car", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Add", style: .default) { (_) in
            if let txtField = alertController.textFields?.first, let text = txtField.text, !text.isEmpty {
                let user = DataManager.shared.getUser()
                let car = Car()
                car.name = text
                let cars = user!.mutableSetValue(forKey: "cars")
                cars.add(car)
                DataManager.shared.saveContext()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addTextField { (textField) in
            textField.placeholder = "Tag"
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        controller.present(alertController, animated: true, completion: nil)
    }
}
