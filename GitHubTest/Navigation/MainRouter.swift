//
//  MainRouter.swift
//  GitHubTest
//
//  Created by Mikhail on 23/10/2018.
//  Copyright © 2018 Mikhail. All rights reserved.
//
import UIKit

class MainRouter: BaseRouter {
    
    func toInfo(name: String, avatar: String, linkToAcc: String, linkToRepos:String, projectName: String) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InfoViewController") as? InfoViewController
        controller?.avatarURL = avatar
        controller?.nameString = name
        controller?.accountURL = linkToAcc
        controller?.reposURL = linkToRepos
        controller?.projectNameString = projectName
        show(controller ?? UIViewController())
    }
    
    
}
