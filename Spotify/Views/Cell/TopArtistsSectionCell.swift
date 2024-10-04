//
//  TopArtistsSectionCell.swift
//  Spotify
//
//  Created by Yerkebulan on 04.10.2024.
//

import Foundation
import UIKit

class TopArtistsSectionCell: UICollectionViewCell {
    public static let reuseIdentifier = "topArtistsSectionCell"
    let image = UIImageView(image: UIImage(named: "spotify-icon-36865"))
    let name  = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(image)
        contentView.addSubview(name)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        

        
        name.text = "unkown"
        name.textAlignment = .center
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            
            name.topAnchor.constraint(equalTo: image.bottomAnchor),
            name.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            name.trailingAnchor.constraint(equalTo: image.trailingAnchor),
            name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with topArtist: TopArtistsCellViewModel) {
        name.text = topArtist.name
        if let imageUrl = topArtist.image {
            NetworkManager.shared.loadImage(url: imageUrl) { data in
                DispatchQueue.main.sync {
                    self.image.image = UIImage(data: data!)
                }
            }

        }
    }
}


