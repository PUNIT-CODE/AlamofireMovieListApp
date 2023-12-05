//
//  MovieModel.swift
//  MovieListApp
//
//  Created by Punit Thakali on 27/11/2023.
//

import UIKit

struct MovieResult: Codable{
    
    let Search: [Movie]
    
}

struct Movie: Codable{
    
    let Title: String
    let Year: String
    let imdbID: String
    let _Type: String
    let Poster: String
    
    
    private enum CodingKeys: String, CodingKey {
        
        case Title, Year, imdbID, _Type = "Type", Poster
    }
    
}

