//
//  AlertClass.swift
//  GitHubTest
//
//  Created by Mikhail on 23/10/2018.
//  Copyright © 2018 Mikhail. All rights reserved.
//

import UIKit


class AlertClass {
    
    func presentAlertWhenLoadingFail(fromViewController controller: UIViewController) -> UIViewController {
        
        let alert = UIAlertController(title: "Connection Error", message: "Check You Internet Connection", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        return alert
    }
}
