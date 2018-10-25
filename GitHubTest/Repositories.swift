//
//  Repositories.swift
//  GitHubTest
//
//  Created by Mikhail on 23/10/2018.
//  Copyright © 2018 Mikhail. All rights reserved.
//

import Foundation

class Owner {
    
    var avatar_url = ""
    var url = ""
    var login = ""
    
    convenience init(json: [String:Any]) {
        self.init()
        
        self.avatar_url = json["avatar_url"] as? String ?? ""
        self.url = json["html_url"] as? String ?? ""
        self.login = json["login"] as? String ?? ""
    }
}


class Repositories{
    
    var name  = ""
    var login = ""
    var url = ""
    var starsCount = 0
    
    var avatar_url = ""
    var urlOfOwner = ""

    
   private var owner: Owner?
    
    convenience init(json: [String:Any]) {
        self.init()
        self.name = json["name"] as? String ?? ""
        self.url = json["html_url"] as? String ?? ""
        self.starsCount = json["stargazers_count"] as? Int ?? 0
        
        if let ownerJson = json["owner"] as? [String:Any] {
            self.owner = Owner(json: ownerJson)
            self.avatar_url = owner?.avatar_url ?? ""
            self.urlOfOwner = owner?.url ?? ""
            self.login = owner?.login ?? ""
        }
        
        
      
    }
    
}


