//
//  ViewController.swift
//  MasonKelber-Lab4
//
//  Created by Snow Hao on 11/9/20.
//  Copyright © 2020 MasonKelber. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var collection: UICollectionView!

    var apiData: APIResults!
    var imageCache: [UIImage] = []
    var query: String!
    
    //Reference video used to help with collection view formatting: How to Use Collection Views in Xcode 8 (Swift 3) by The Swift Guy
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loading.isHidden = true
        searchBar.delegate = self
        
        let bounds = (UIScreen.main.bounds.width/3) - 10
        let format = UICollectionViewFlowLayout()
        format.sectionInset = UIEdgeInsets(top: 8, left: 5, bottom: 8, right: 5)
        format.itemSize = CGSize(width: bounds, height: bounds + bounds / 2)
        
        collection.collectionViewLayout = format
        collection.dataSource = self
        collection.delegate = self
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        imageCache = []
        collection.reloadData()
        
        let keyword = searchBar.text!
        searchBar.resignFirstResponder()
        loading.isHidden = false
        loading.startAnimating()
        DispatchQueue.global().async {
            self.fetchDataForCollectionView(searchInput: keyword)
            DispatchQueue.main.async {
                self.loading.stopAnimating()
                self.loading.isHidden = true
                self.collection.reloadData()
            }
        }
    }
    
    func fetchDataForCollectionView(searchInput: String){
        let search = searchInput.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        query = "https://api.themoviedb.org/3/search/movie?api_key=6eed17b3dc92b388520aa4292890c8cd&&query=\(search!)"
        
        let url = URL(string: query)
        if url != nil {
            let data = try! Data(contentsOf: url!)
            apiData = try! JSONDecoder().decode(APIResults.self, from: data)
            if(apiData.results.count == 0){
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error!", message: "No movies matched your search", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
                    self.present(alert,animated: true)
                }
            }
            
            imageCache = []
            cacheImages()
            
        }
    }
    
    func cacheImages(){
        imageCache.removeAll()
        var url = URL(string: "")
        for results in apiData.results{
            if(results.poster_path != nil){
                url = URL(string: "https://image.tmdb.org/t/p/w500"+results.poster_path!)
            }
            let data = try? Data(contentsOf: url!)
            let image = UIImage(data: data!)
            imageCache.append(image!)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCache.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CollectionCell
        cell.movieTitle.text = apiData.results[indexPath.row].title
        cell.movieImage.image = imageCache[indexPath.row]
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Detailed", sender: indexPath.row)
    }
}

