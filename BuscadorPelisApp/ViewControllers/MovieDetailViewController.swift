//
//  MovieDetailViewController.swift
//  BuscadorPelisApp
//
//  Created by Mañanas on 24/9/24.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!

    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie {
            titleLabel.text = movie.title
            yearLabel.text = movie.year
            plotLabel.text = movie.plot
            runtimeLabel.text = movie.runtime
            directorLabel.text = "Director: \(movie.director)"
            genreLabel.text = "Genre: \(movie.genre)"
            countryLabel.text = "Country: \(movie.country)"
            
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
}
