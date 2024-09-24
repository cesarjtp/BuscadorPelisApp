//
//  Movie.swift
//  BuscadorPelisApp
//
//  Created by Mañanas on 24/9/24.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let year: String
    let poster: String
    let plot: String?
    let runtime: String?
    let director: String?
    let genre: String?
    let country: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case plot = "Plot"
        case runtime = "Runtime"
        case director = "Director"
        case genre = "Genre"
        case country = "Country"
    }
}

struct MovieSearchResponse: Decodable {
    let search: [Movie]

    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}

    
