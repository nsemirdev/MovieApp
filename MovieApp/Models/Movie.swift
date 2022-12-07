//
//  Movie.swift
//  MovieApp
//
//  Created by Emir Alkal on 7.12.2022.
//

import Foundation

struct Movie: Decodable {
    var original_title: String?
    var overview: String?
    var poster_path: String?
    var release_date: String?
    var vote_average: Double?
}
