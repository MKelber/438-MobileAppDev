//
//  Movie.swift
//  MasonKelber-Lab4
//
//  Created by Snow Hao on 11/9/20.
//  Copyright © 2020 MasonKelber. All rights reserved.
//

import Foundation

struct Movie:Decodable {
    let id: Int!
    let poster_path: String?
    let title: String
    let release_date: String
    let vote_average: Double
    let overview: String
    let vote_count: Int!
}
