//
//  FavoriteView.swift
//  MasonKelber-Lab4
//
//  Created by Snow Hao on 11/10/20.
//  Copyright © 2020 MasonKelber. All rights reserved.
//

import Foundation
import UIKit

class FavoriteView: UITableViewController {

    @IBOutlet var favoriteTable: UITableView!
    var favoriteArray:[String] = []
    
    //Override functions, numberOfSections Optional Method allowed to default to 1
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteTable.dataSource = self
        favoriteTable.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let path = Bundle.main.path(forResource: "favorites", ofType: "plist")
        let dictionary:AnyObject = NSDictionary(contentsOfFile: (path)!)!
        let tempArray = dictionary.object(forKey: "favorite") as! Array<String>
        
        self.favoriteArray = []
        
        for movie in tempArray{
            self.favoriteArray.append(movie)
        }
        self.favoriteTable.reloadData()
        
    }
    //tableView functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCells", for: indexPath)
        cell.textLabel?.text = self.favoriteArray[indexPath.row]
        return cell
    }
    
    //delete
    //ioscreator.com/tutorials/delete-rows-table-view-ios-tutorial-ios12 was used as a reference
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.favoriteArray.remove(at: indexPath.row)
            let path = Bundle.main.path(forResource: "favorites", ofType: "plist")
            guard let dictionary:AnyObject = NSDictionary(contentsOfFile: (path)!) else{ return }
            var tempArray = dictionary.object(forKey: "favorite") as! Array<String>
            tempArray.remove(at: indexPath.row)
            
            self.favoriteArray=[]
            
            for movie in tempArray{
                self.favoriteArray.append(movie)
            }
            self.favoriteTable.reloadData()
        }
    }
    
}
