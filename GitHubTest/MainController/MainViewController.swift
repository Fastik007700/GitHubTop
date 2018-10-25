//
//  ViewController.swift
//  GitHubTest
//
//  Created by Mikhail on 23/10/2018.
//  Copyright © 2018 Mikhail. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tv: UITableView!
    var loadedRepositories = [Repositories]()
    
    @IBOutlet weak var router: MainRouter!
    
    @IBOutlet weak var seachBar: UISearchBar!
    
    @IBOutlet weak var blackView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seachBar.delegate = self
        tv.delegate = self
        tv.dataSource = self
        blackView?.loadingView()
        blackView.alpha = 0
        let logo = UIImage(named: "image")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit // set imageview's content mode
        self.navigationController?.navigationBar.topItem?.titleView = imageView
        seachBar.searchBarStyle = .prominent
        seachBar.placeholder = "Seach"
    }
    
    
    private func getData(seachParams: String) {
        UIView.animate(withDuration: 0.4, animations: {
            self.blackView?.alpha = 0.7
        })
        GitHubApiService().seachRepositories(seachParams, complection: { [weak self] (repositories) in
            self?.loadedRepositories = repositories
            DispatchQueue.main.async {
                if repositories.isEmpty {
                    UIView.animate(withDuration: 0.4, animations: {
                        self?.blackView?.alpha = 0.0})
                }
                self?.tv.reloadData()
                UIView.animate(withDuration: 0.4, animations: {
                    self?.blackView?.alpha = 0.0})}},
            controller: self)
    }
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadedRepositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MainControllerCell {
            
            cell.projectName.text = loadedRepositories[indexPath.row].name
            cell.avatarURL = loadedRepositories[indexPath.row].avatar_url
            cell.accURL = loadedRepositories[indexPath.row].urlOfOwner
            cell.reposLink = loadedRepositories[indexPath.row].url
            cell.login = loadedRepositories[indexPath.row].login
            cell.starsCount.text = String(loadedRepositories[indexPath.row].starsCount)
            return cell
        }
        else {return UITableViewCell()}
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath) as? MainControllerCell
        router.toInfo(name: currentCell?.login ?? "", avatar: currentCell?.avatarURL ?? "", linkToAcc: currentCell?.accURL ?? "", linkToRepos: currentCell?.reposLink ?? "", projectName: currentCell?.projectName.text ?? "")
    }
    
}

extension MainViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if searchBar.text != nil {
            getData(seachParams: searchBar.text!)
            self.seachBar.endEditing(true)
        }
    }
}



extension UIView {
    
    func loadingView() {
        let indicator = UIActivityIndicatorView()
        indicator.startAnimating()
        indicator.frame = CGRect(x: self.frame.size.width/2 - 10, y: self.frame.size.height/2, width: 20, height: 20)
        backgroundColor = UIColor.black
        alpha = 0.7
        addSubview(indicator)
    }
}

