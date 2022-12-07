//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by Emir Alkal on 7.12.2022.
//

import UIKit
import SDWebImage


// https://image.tmdb.org/t/p/w500/k12PqAkuXszXYHFVXcQQrvtdsck.jpg

class MovieTableViewCell: UITableViewCell {
    var movie: Movie? {
        didSet {
            let url = URL(string: "https://image.tmdb.org/t/p/w500/\(self.movie?.poster_path ?? "")")
    
            DispatchQueue.main.async {
                self.movieNameLabel.text = self.movie?.original_title
                self.posterImageView.sd_setImage(with: url)
                self.detailLabel.text = self.movie?.overview
            }
        }
    }
    
    // MARK: - UI Elements
    let posterImageView = UIImageView()
    let movieNameLabel = UILabel()
    let detailLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
    }
    
   
    override func layoutSubviews() {
       super.layoutSubviews()

       let contentViewFrame = self.contentView.frame
       let insetContentViewFrame = contentViewFrame.inset(by: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
       self.contentView.frame = insetContentViewFrame
       self.selectedBackgroundView?.frame = insetContentViewFrame
    }
    
    
    func layout() {
        contentView.backgroundColor = .systemTeal
        contentView.layer.cornerRadius = 15
        
        contentView.addSubview(posterImageView)
        configurePoster()
        
        contentView.addSubview(movieNameLabel)
        contentView.addSubview(detailLabel)
        
        configureLabels()

    }
    
    func configureLabels() {
        movieNameLabel.font = .systemFont(ofSize: 25, weight: .thin)
        movieNameLabel.textColor = .white
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabel.textAlignment = .right
        
        NSLayoutConstraint.activate([
            movieNameLabel.topAnchor.constraint(equalTo: posterImageView.topAnchor),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: movieNameLabel.trailingAnchor, multiplier: 1),
            movieNameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: posterImageView.trailingAnchor, multiplier: 1)
        ])
        
        detailLabel.font = .systemFont(ofSize: 14, weight: .regular)
        detailLabel.textColor = .secondaryLabel
        detailLabel.textAlignment = .right
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            detailLabel.trailingAnchor.constraint(equalTo: movieNameLabel.trailingAnchor),
            detailLabel.topAnchor.constraint(equalToSystemSpacingBelow: movieNameLabel.bottomAnchor, multiplier: 2),
            detailLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: posterImageView.trailingAnchor, multiplier: 1),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: detailLabel.bottomAnchor, multiplier: 2)
        ])
    }
    
    
    func configurePoster() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.image = UIImage(named: "testImage")
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.layer.cornerRadius = 6
        posterImageView.clipsToBounds = true

        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            posterImageView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: posterImageView.bottomAnchor, multiplier: 2),
            posterImageView.widthAnchor.constraint(equalToConstant: 100)
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
