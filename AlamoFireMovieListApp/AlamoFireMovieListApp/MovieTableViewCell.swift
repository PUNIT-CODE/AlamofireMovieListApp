//
//  MovieTableViewCell.swift
//  MovieListApp
//
//  Created by Punit Thakali on 04/12/2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieYearLabel: UILabel!
    @IBOutlet var movieimdbIDLabel: UILabel!
    @IBOutlet var moviePosterImageView: UIImageView!

    override func awakeFromNib() {
        
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

    }

    static let identifier = "MovieTableViewCell"
    
    static func nib() -> UINib{
        
        return UINib(nibName: "MovieTableViewCell", bundle: nil)
    }
    
    func configure( with model: Movie){
        
        self.movieTitleLabel.text = model.Title
        self.movieYearLabel.text = model.Year
        self.movieimdbIDLabel.text = model.imdbID
        let url = model.Poster
        if let data = try? Data(contentsOf: URL(string: url)!){
             
            self.moviePosterImageView.image = UIImage(data: data)       //if the data successfully downloaded then the image is updated
        }
     
    }
    
}
 

