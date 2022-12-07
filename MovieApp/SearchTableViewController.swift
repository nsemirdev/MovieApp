//
//  SearchViewController.swift
//  MovieApp
//
//  Created by Emir Alkal on 7.12.2022.
//

import UIKit

class SearchTableViewController: UITableViewController {

    let searchController = UISearchController(searchResultsController: SearchResultViewController())
    let cellId = "SearchTableViewControllerCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureTableView()
    }
    
    func configure() {
        view.backgroundColor = .systemBackground
        navigationItem.searchController = searchController
        
        title = "Search"
    }
    
    func configureTableView() {
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
    }
    
}


extension SearchTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        220
    }
}
