//
//  ViewController.swift
//  MovieListApp
//
//  Created by Punit Thakali on 27/11/2023.
//

import UIKit
import Alamofire

class MovieListViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var movieListTextField: UITextField!
    @IBOutlet var movieListTableView: UITableView!

    var movies = [Movie]()

    override func viewDidLoad() {
        
        super.viewDidLoad()

        movieListTableView.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
        movieListTableView.dataSource = self
        movieListTableView.delegate = self
        movieListTextField.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        searchMovies()
        return true
    }

    func searchMovies() {
        
        movieListTextField.resignFirstResponder()

        guard let text = movieListTextField.text, !text.isEmpty else {
            
            return
        }

        let query = text.replacingOccurrences(of: " ", with: "%20")
        movies.removeAll()

        let apiKey = "93b6d334"
        
        AF.request("https://www.omdbapi.com/?apikey=\(apiKey)&s=\(query)&type=movie")
            .validate()
            .responseDecodable(of: MovieResult.self) { response in
                
                switch response.result {
                        
                    case .success(let result):
                        let newMovies = result.Search
                        self.movies.append(contentsOf: newMovies)
                        self.movieListTableView.reloadData()

                    case .failure(let error):
                        print("Error: \(error)")
                }
            }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

