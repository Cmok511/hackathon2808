//
//  ImageCell.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import UIKit
import SDWebImage

final class ImageCell: UITableViewCell {
    static let reuseID = "ImageCell"
    
    @IBOutlet weak var coverImage: UIImageView!
    
    private let coverImageView: UIImageView = {
        let coverImageView = UIImageView()
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.contentMode = .scaleAspectFill
        return coverImageView
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(coverImageView)
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: topAnchor),
            coverImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            coverImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            coverImageView.heightAnchor.constraint(equalToConstant: 320)
        ])
    }
    
    func configure(faculty: GettingFaculty?) {
        if let urlString =  faculty?.university?.photo {
            guard let image = URL(string: urlString) else { return }
            coverImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            coverImageView.sd_setImage(with: image)
        }
    }
}
