//
//  ArticleCell.swift
//  News
//
//  Created by Arseni Khatsuk on 07.03.2022.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    
    @IBOutlet weak var headlineLabel: UILabel!
    
    @IBOutlet weak var articleImageView: UIImageView!
    
    var articleToDisplay:Article?
    
    func displaArticle(_ article:Article) {
        
      // Clean up the cell before displaying the next article
        articleImageView.image = nil
        headlineLabel.text = "" 
        
        // Keep a reference to the article
        articleToDisplay = article
        
        // Set the headline
        headlineLabel.text = articleToDisplay!.title
        
        // Download and display the image
        
        // Check the article actually has an image
        guard articleToDisplay!.urlToImage != nil else {
            return
        }
        
        // Create url string
        let urlString = articleToDisplay!.urlToImage!
        
        // Create the url
        let url = URL(string: urlString)
        
        // Check that the url isn't nil
        guard url != nil else {
            print("Coudn't create the url object ")
            return
        }
        
        // Get a URLSession
        let session = URLSession.shared
        
        // Create the datatask
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check that there no errors
            if error == nil && data != nil {
                
                // Check if the url string that the data task went off download matches the article this cell is set to display
                if self.articleToDisplay!.urlToImage == urlString {
                    
                    DispatchQueue.main.async {
                        
                        // Dispaly the image data in the image view
                        self.articleImageView.image = UIImage(data: data!)
                        
                    }
                }
                
               
            } // End if
        } // End data task
        
        // Kick off the datatask
        dataTask.resume()
        
        
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
