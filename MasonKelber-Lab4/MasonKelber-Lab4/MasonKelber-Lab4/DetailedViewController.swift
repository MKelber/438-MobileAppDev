//
//  DetailedView.swift
//  MasonKelber-Lab4
//
//  Created by Snow Hao on 11/9/20.
//  Copyright © 2020 MasonKelber. All rights reserved.
//

import Foundation
import UIKit

class DetailedView: UIViewController{
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieScore: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieRelease: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    var movie: Movie!
    var info: String!
    var poster: UIImage!
    var overview: String!
    var rating: String!
    var name: String!
    
    //override viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        moviePoster.image = poster
        movieTitle.text = movie.title
        movieRelease.text = movie.release_date
        movieScore.text = movie.overview
        movieRating.text = String(movie.vote_average)
        getImage()
    }
    
    //helper method to get movie image from tmdb
    func getImage(){
        
        let baseURL:String = "https://image.tmdb.org/t/p/w500"
        if let info:String = self.info{
            let imageQuery:String = baseURL + info
            let url = URL(string: imageQuery)
            let data = try? Data(contentsOf: url!)
            let image = UIImage(data: data!)
            movieImage.image = image
        }
        else{
            movieImage.image = nil
        }
    }
    
    //Creative Portion 1: send an alert if movie has already been added to Favorites
    @IBAction func addFavorite(_sender: UIButton){
        let path = Bundle.main.path(forResource: "favorite", ofType: "plist")
        let dictionary = NSMutableDictionary(contentsOfFile: path!)!
        let favorites = dictionary.object(forKey: "favorite") as! NSMutableArray
        let check = dictionary.object(forKey: "favorite") as! Array<String>

        //Check if movie is already in Favorites and add movie to favorites if not
        if check.contains(name){
                let alert = UIAlertController(title: "Movie not added", message: "This movie is already in your favorites list", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
                self.present(alert,animated: true)
        }else{
            favorites.add(name!)
            dictionary.write(toFile:path!,atomically:true)
            let alert = UIAlertController(title: "Movie added", message: "Great choice", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert,animated: true)
        }
    }
}
