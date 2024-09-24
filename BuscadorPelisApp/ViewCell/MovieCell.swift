//
//  MovieCell.swift
//  BuscadorPelisApp
//
//  Created by Mañanas on 24/9/24.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        
        if let posterURL = URL(string: movie.poster) {
            URLSession.shared.dataTask(with: posterURL) { (data, _, _) in
                if let data = data {
                    DispatchQueue.main.async {
                        self.posterImageView.image = UIImage(data: data)
                    }
                }
            }.resume()
        } else {
            posterImageView.image = UIImage(named: "placeholder_image")
        }
    }
}

