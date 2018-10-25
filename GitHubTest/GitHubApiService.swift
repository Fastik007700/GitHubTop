//
//  GitHubApiService.swift
//  GitHubTest
//
//  Created by Mikhail on 23/10/2018.
//  Copyright © 2018 Mikhail. All rights reserved.
//

import Foundation
import UIKit


class GitHubApiService {
    
    private var baseURL = URLComponents(string: "https://api.github.com/search/repositories")
    
    public func seachRepositories(_ reposName: String, complection: @escaping ([Repositories]) -> Void, controller: UIViewController) {
        
        
        baseURL?.queryItems = [URLQueryItem(name: "q", value: reposName),
                               URLQueryItem(name: "sort", value: "stars"),
                               URLQueryItem(name: "order", value: "desc")]
        
        
        let session = URLSession.shared
        _ = session.dataTask(with: (baseURL?.url)!) { (data, responce, error) in
            guard let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) else {
                     controller.present(AlertClass().presentAlertWhenLoadingFail(fromViewController: controller), animated: true, completion: nil)
                    DispatchQueue.global().async {
                        complection([])
                    }
                    return}
            
            if let dictionary = json as? [String:Any] {
                let items = dictionary["items"] as? [[String:Any]]
                let info = items?.compactMap{Repositories(json: $0)} ?? []
                
                DispatchQueue.global().async {
                    complection(info)
                }
            }

            

        
        }.resume()
    }
    
}
