//
//  MovieService.swift
//  BuscadorPelisApp
//
//  Created by Mañanas on 24/9/24.
//

import Foundation

class MovieService {
    
    let apiKey = "8099beff"
    let baseURL = "https://www.omdbapi.com/"

    func searchMovies(query: String, completion: @escaping ([Movie]?) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "\(baseURL)?apikey=\(apiKey)&s=\(query)") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                if let str = String(data: data, encoding: .utf8) {
                    print("Successfully decoded: \(str)")
                }
                
                let searchResponse = try JSONDecoder().decode(MovieSearchResponse.self, from: data)
                completion(searchResponse.search)
            } catch {
                print("Error decodificando JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }

    func fetchMovieDetails(imdbID: String, completion: @escaping (Movie?) -> Void) {
        guard let url = URL(string: "\(baseURL)?apikey=\(apiKey)&i=\(imdbID)") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                let movie = try JSONDecoder().decode(Movie.self, from: data)
                completion(movie)
            } catch {
                print("Error decodificando JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}

