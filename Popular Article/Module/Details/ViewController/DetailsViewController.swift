//
//  DetailsViewController.swift
//  Popular Article
//
//  Created by Development  on 25/08/2021.
//

import Foundation
import UIKit
import SafariServices
class DetailsViewController: UIViewController {
   
    @IBOutlet weak var eyebutton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var abstractHeight: NSLayoutConstraint!
    @IBOutlet weak var abstractLabel: UILabel! {
        didSet{
            abstractLabel.sizeToFit()
        }
    }
    @IBOutlet weak var updatedLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var autherNameLabel: UILabel!
    @IBOutlet weak var advertiseLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!{
        didSet{
            categoryView.startShimmeringEffect()
            categoryView.backgroundColor = AppColor.primaryColor.value
            categoryView.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var autherImageView: UIImageView!
    var result: Result?
    
    override func viewDidLoad() {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.textColor = .white
        label.text = result?.title ?? ""
        self.navigationItem.titleView = label
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func updateUI() {
        if let mediaCount = self.result?.media?.count {
            if(mediaCount > 0 ) {
                if let mediaMetadataCount = result?.media?[0].mediaMetadata?.count {
                    if(mediaMetadataCount > 0 ) {
                        if let url = result?.media?[0].mediaMetadata?[0].url {
                            self.autherImageView.kf.setImage(with: URL(string: url))
                        }
                    }
                }
            }
        }
        self.categoryLabel.text = self.result?.section ?? ""
        self.titleLabel.text = self.result?.title ?? ""
        if let addvString = self.result?.adxKeywords {
            let hashString = addvString.replacingOccurrences(of: ";", with: "#")
            advertiseLabel.text = "#" + hashString
        }
        self.autherNameLabel.text = self.result?.byline ?? ""
        self.publishedDateLabel.text = self.result?.publishedDate ?? ""
        if let updated =  self.result?.updated {
            let updatedDate = updated.components(separatedBy: " ")[0]
            self.updatedLabel.text =  updatedDate
        }
        if let abstract = self.result?.abstract{
            self.abstractHeight.constant =  heightForView(text: abstract)
            print(heightForView(text: abstract))
            self.abstractLabel.text = abstract
        }
    }
    
    @IBAction func openPdfInSafari(_ sender: Any) {
        let url = result?.url  ?? ""
        if let url = URL(string: url) {
               let config = SFSafariViewController.Configuration()
               config.entersReaderIfAvailable = true

               let vc = SFSafariViewController(url: url, configuration: config)
               present(vc, animated: true)
           }
    }
    
    @IBAction func sharePdf(_ sender: Any) {
        if let title = result?.title ,
           let url = result?.url {
            let textToShare = [ url, title ]
               let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
               
               if let popoverController = activityViewController.popoverPresentationController {
                   popoverController.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
                   popoverController.sourceView = self.view
                   popoverController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
               }
               self.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    func heightForView(text:String) -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 15 , height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = text

        label.sizeToFit()
        return label.frame.height
    }
}
