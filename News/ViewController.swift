//
//  ViewController.swift
//  News
//
//  Created by Arseni Khatsuk on 06.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var model = ArticleModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Get the articles from the article model
        model.delegate = self
        model.getArticles()
    }
    
    
    //MARK: - Article Model Protocol Methods
    
    func articleRetrived(_ article: [Article]) {
        print("article returned from model")
    }

}

extension ViewController:  ArticleModernProtocol{
    
    
}

