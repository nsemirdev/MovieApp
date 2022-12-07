//
//  MoviesViewModel.swift
//  MovieApp
//
//  Created by Emir Alkal on 7.12.2022.
//

import Foundation

struct MoviesViewModel {
    var movies: [Movie]?
    
    func getMovie(at index: Int) -> Movie? {
        if let movies {
            return movies[index]
        }
        
        return nil
    }
    
    func getMovieCount() -> Int {
        if let movies {
            return movies.count
        }
        return 0
    }
}
