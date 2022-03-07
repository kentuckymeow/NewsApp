//
//  ViewController.swift
//  News
//
//  Created by Arseni Khatsuk on 06.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = ArticleModel()
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the viewcontroller as the datasource and delegate of the table view
        tableView.delegate = self
        tableView.dataSource = self
        
        // Get the articles from the article model
        model.delegate = self
        model.getArticles()
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)
        
        // TODO: customize it
        
        // Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension ViewController:  ArticleModernProtocol{
    
    //MARK: - Article Model Protocol Methods
    
    func articleRetrived(_ article: [Article]) {
        
        // Set the articles property of the view controller to the articless passed back from the model 
        self.articles = article
        
        // Refresh the tableview
        tableView.reloadData()
    }
    
}

