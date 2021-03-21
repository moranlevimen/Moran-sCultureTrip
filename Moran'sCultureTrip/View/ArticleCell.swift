//
//  ArticleCell.swift
//  Moran'sCultureTrip
//
//  Created by moran levi on 21/03/2021.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var saveIcon: UIButton!
    @IBOutlet weak var loveIcon: UIButton!
    @IBOutlet weak var likeCounterLabel: UILabel!
    @IBOutlet weak var backgroundImageCell: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var imageIconArthor:
        UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    func setArticleCell(article:Article)  {
        
        self.likeCounterLabel.text = String(article.likesCount ?? 0)
        self.categoryLabel.text = article.category
        self.mainTitleLabel.text = article.title
        self.authorLabel.text = article.author?.authorName
        
        let date = Date()
        let formate = date.getFormattedDate(format: "d MMM, yyyy") //
        self.dateLabel.text = (article.metaData?.creationTime)


     
        self.imageIconArthor.setRounded()
 
        if article.isLiked == true {
            loveIcon.setImage(UIImage(named: "liked.png"), for: .normal)

        }else{
            loveIcon.setImage(UIImage(named: "like.png"), for: .normal)

        }
        
        if article.isSaved == true  {
            self.saveIcon.setImage(UIImage(named: "saved.png"), for: .normal)
        }else{
            self.saveIcon.setImage(UIImage(named: "save.png"), for: .normal)
        }
        
        
        let imageUrlString = article.author?.authorAvatar?.imageUrl
        guard let imageUrl:URL = URL(string: imageUrlString!) else {
                  return
              }
        imageIconArthor.loadImge(withUrl: imageUrl)
        
        let imageStr = article.imageUrl
        guard let imageUrlSec:URL = URL(string: imageStr!) else {
                  return
              }
        backgroundImageCell.loadImge(withUrl: imageUrlSec)
        
    }
    
}
extension UIImageView {

   func setRounded() {
    let radius = self.frame.width / 2
      self.layer.cornerRadius = radius
      self.layer.masksToBounds = true
   }
}
extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
extension UIImageView {
func loadImge(withUrl url: URL) {
       DispatchQueue.global().async { [weak self] in
           if let imageData = try? Data(contentsOf: url) {
               if let image = UIImage(data: imageData) {
                   DispatchQueue.main.async {
                       self?.image = image
                   }
               }
           }
       }
   }
}


