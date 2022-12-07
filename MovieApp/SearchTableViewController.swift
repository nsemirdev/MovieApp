//
//  SearchViewController.swift
//  MovieApp
//
//  Created by Emir Alkal on 7.12.2022.
//

import UIKit

class SearchTableViewController: UITableViewController {

    let searchController = UISearchController()
    let cellId = "SearchTableViewControllerCell"
    var viewModel = MoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureTableView()
    }
    
    func configure() {
        view.backgroundColor = .systemBackground
        navigationItem.searchController = searchController
        title = "Search"
        searchController.searchBar.delegate = self
    }
    
    func configureTableView() {
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
    }
    
}


extension SearchTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getMovieCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        cell.movie = viewModel.getMovie(at: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        220
    }
}

extension SearchTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        APICaller.shared.searchMovieRequest(with: searchText) { data in
            self.viewModel.movies = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
