//
//  APICaller.swift
//  MovieApp
//
//  Created by Emir Alkal on 7.12.2022.
//

import Foundation
import Alamofire

class APICaller {
    static let shared = APICaller()
    let base_url = "https://api.themoviedb.org/3/"
    let api_key = "e45bffdff6dffbe6e65f817a6d705787"
    
    func searchMovieRequest(with searchTerm: String, completionHandler: @escaping ([Movie]) -> Void) {
        let url = "\(base_url)/search/movie"
        let parameters = [
            "api_key": api_key,
            "query": searchTerm
        ]
        
        AF.request(url, parameters: parameters)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success(let data):
                    let movies = try! JSONDecoder().decode(ResponseModel.self, from: data)
                    guard let m = movies.results else { return }
                    completionHandler(m)
                    break
                case .failure(let error):
                    print(error)
                    break
                }
            }
        
    }
}
