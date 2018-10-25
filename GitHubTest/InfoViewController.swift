//
//  InfoViewController.swift
//  GitHubTest
//
//  Created by Mikhail on 23/10/2018.
//  Copyright © 2018 Mikhail. All rights reserved.
//

import UIKit
import Kingfisher

class InfoViewController: UIViewController {
    
    @IBOutlet var avatar: UIImageView!
    
    @IBOutlet var name: UILabel!
    @IBOutlet var projectName: UILabel!
    
    var accountURL: String?
    var reposURL: String?
    var nameString = ""
    var projectNameString = ""
    var avatarURL: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        avatar.layer.cornerRadius = avatar.frame.width/2
        avatar.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        avatar.kf.setImage(with: URL(string: avatarURL ?? ""))
        name.text = "LOGIN: \(nameString)"
        projectName.text = "PROJECT NAME: \(projectNameString)"
        
    }
    
    
    
    @IBAction func goToAcc(_ sender: Any) {
        
        if let url = URL(string: accountURL ?? "") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func goToRepos(_ sender: Any) {
        if let url = URL(string: reposURL ?? "") {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
