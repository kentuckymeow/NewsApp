//
//  ViewController.swift
//  News
//
//  Created by Arseni Khatsuk on 06.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var model = ArticleModel()
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Get the articles from the article model
        model.delegate = self
        model.getArticles()
    }
    
}

extension ViewController:  ArticleModernProtocol{
    
    //MARK: - Article Model Protocol Methods
    
    func articleRetrived(_ article: [Article]) {
        
        // Set the articles property of the view controller to the articless passed back from the model 
        self.articles = article
    }
    
}

