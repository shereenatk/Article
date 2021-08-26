//
//  HomeViewController.swift
//  Popular Article
//
//  Created by Development  on 25/08/2021.
//

import Foundation
import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var homeTableView: UITableView!{
        didSet{
            homeTableView.tableFooterView = UIView()
        }
    }
    
    let cellReusableId = "HomeTVCell"
    var viewModel = ArticleListViewModel()
    var model: [Result]?
    
    override func viewDidLoad() {
        getArticleList()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func getArticleList() {
        self.viewModel.getArticleList() { isSuccess, errorMessage  in
            self.model = self.viewModel.responseStatus?.results
            self.homeTableView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: cellReusableId, for: indexPath) as? HomeTVCell else {
            return UITableViewCell()
        }
        if let mediaCount = self.model?[indexPath.row].media?.count {
            if(mediaCount > 0 ) {
                if let mediaMetadataCount = self.model?[indexPath.row].media?[0].mediaMetadata?.count {
                    if(mediaMetadataCount > 0 ) {
                        if let url = self.model?[indexPath.row].media?[0].mediaMetadata?[0].url {
                            cell.autherImageView.kf.setImage(with: URL(string: url))
                        }
                    }
                }
            }
        }
       
        cell.titleLabel.text = self.model?[indexPath.row].title ?? ""
        cell.byLineLabel.text = self.model?[indexPath.row].byline ?? ""
        if let date = self.model?[indexPath.row].publishedDate {
            cell.dateButton.setTitle(date, for: .normal)
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            vc.result = self.model?[indexPath.row]
            self.navigationController?.pushViewController(vc, animated:   true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
