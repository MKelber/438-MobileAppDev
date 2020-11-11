//
//  APIResults.swift
//  MasonKelber-Lab4
//
//  Created by Snow Hao on 11/9/20.
//  Copyright © 2020 MasonKelber. All rights reserved.
//

import Foundation

struct APIResults:Decodable {
    let page: Int
    let total_results: Int
    let total_pages: Int
    var results: [Movie]
}
