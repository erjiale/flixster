//
//  MovieGridViewController.swift
//  flixster
//
//  Created by Jiale Qiu on 10/21/19.
//  Copyright © 2019 jiale98chinoguay. All rights reserved.
//

import UIKit
import Alamofire

class MovieGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 4 // controls space between rows.
        layout.minimumInteritemSpacing = 4 // controls space next to each image/object
        
        // view.frane.size.width depends on what phone the user is running the app on.
        let width = (view.frame.size.width / 2) - (layout.minimumInteritemSpacing / 2)
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)

    
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

            self.movies = dataDictionary["results"] as! [[String:Any]]
            
            self.collectionView.reloadData()
            
            print(self.movies)

           }
        }
        task.resume()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        
        let movie = movies[indexPath.item]
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)!
        
        // function that takes a URL and takes care of downloading it and sending it
        cell.posterView.af_setImage(withURL: posterUrl)
        
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        print("Loading up the superhero details screen")
    
        // 1) Find selected superhero
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)!
        let movie = movies[indexPath.item]
        
        let detailsViewController = segue.destination as! SuperheroDetailsViewController
        detailsViewController.movie = movie
    }
}
