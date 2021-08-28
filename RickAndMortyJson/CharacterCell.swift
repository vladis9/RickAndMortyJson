//
//  CharacterCell.swift
//  RickAndMortyJson
//
//  Created by Vlad Zinevich on 25.08.2021.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet var characterUmage: UIImageView!
    @IBOutlet var characterName: UILabel!
    @IBOutlet var characterStatus: UILabel!
    @IBOutlet var characterGender: UILabel!
    
    func configureCell(with character: Character) {
        characterName.text = character.name
        characterStatus.text = character.status
        characterGender.text = character.gender
        
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: character.image) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.characterUmage.image = UIImage(data: imageData)
            }
        }
    }
}
