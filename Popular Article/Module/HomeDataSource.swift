////
////  HomeDataSource.swift
////  Popular Article
////
////  Created by User on 26/08/2021.
////
//
//import Foundation
//import UIKit
//class HomeDataSource: NSObject, UITableViewDataSource {
//    private let model: [Result]
//    let cellReusableId = "HomeTVCell"
//       init(model: [Result]) {
//           self.model = model
//           super.init()
//       }
//       
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return model.count
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        return UITableViewCell()
////    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.model.count ?? 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = HomeTVCell()
////        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: cellReusableId, for: indexPath) as? HomeTVCell else {
////            return UITableViewCell()
////        }
//        if let mediaCount = self.model[indexPath.row].media?.count {
//            if(mediaCount > 0 ) {
//                if let mediaMetadataCount = self.model[indexPath.row].media?[0].mediaMetadata?.count {
//                    if(mediaMetadataCount > 0 ) {
//                        if let url = self.model[indexPath.row].media?[0].mediaMetadata?[0].url {
//                            cell.autherImageView.kf.setImage(with: URL(string: url))
//                        }
//                    }
//                }
//            }
//        }
//       
//        cell.titleLabel.text = self.model[indexPath.row].title ?? ""
//        cell.byLineLabel.text = self.model[indexPath.row].byline ?? ""
//        if let date = self.model[indexPath.row].publishedDate {
//            cell.dateButton.setTitle(date, for: .normal)
//        }
//        cell.selectedBackgroundView  = .none
//        return UITableViewCell()
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 110.0
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
//            vc.result = self.model?[indexPath.row]
//            self.navigationController?.pushViewController(vc, animated:   true)
//        }
//    }
//}
