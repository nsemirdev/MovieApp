//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by Emir Alkal on 7.12.2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    var movie: Movie? {
        didSet {
            // ui things
        }
    }
    
    // MARK: - UI Elements
    let poster = UIImageView()
    let movieName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
    }
    
   
    override func layoutSubviews() {
       super.layoutSubviews()

       let contentViewFrame = self.contentView.frame
       let insetContentViewFrame = contentViewFrame.inset(by: UIEdgeInsets(top: 16, left: 24, bottom: 16, right: 24))
       self.contentView.frame = insetContentViewFrame
       self.selectedBackgroundView?.frame = insetContentViewFrame
    }
    
    
    func layout() {
        contentView.backgroundColor = .systemTeal
        contentView.layer.cornerRadius = 15
        
        contentView.addSubview(poster)
        configurePoster()
        
        contentView.addSubview(movieName)
        configureLabel()
        
    }
    
    func configureLabel() {
        movieName.font = .systemFont(ofSize: 32, weight: .thin)
        movieName.text = "Korku"
        movieName.textColor = .white
        movieName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieName.topAnchor.constraint(equalTo: poster.topAnchor),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: movieName.trailingAnchor, multiplier: 3)
        ])
    }
    
    
    func configurePoster() {
        poster.translatesAutoresizingMaskIntoConstraints = false
        poster.image = UIImage(named: "testImage")
        poster.contentMode = .scaleAspectFill
        poster.layer.cornerRadius = 6
        poster.clipsToBounds = true

        NSLayoutConstraint.activate([
            poster.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            poster.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: poster.bottomAnchor, multiplier: 2),
            poster.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
    
    
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
