//
//  ArticleModel.swift
//  News
//
//  Created by Arseni Khatsuk on 06.03.2022.
//

import Foundation

protocol ArticleModernProtocol {
    
    func articleRetrived(_ article:[Article])
}

class ArticleModel {
    
    var delegate:ArticleModernProtocol?
    
    func getArticles(){
        
        // Fire off the request to the API
        
        // Parse the returned JSON into article instances and pass it back to the view controller with the protocol and delegate pattern
        delegate?.articleRetrived([Article]())
        
        
    }
}
