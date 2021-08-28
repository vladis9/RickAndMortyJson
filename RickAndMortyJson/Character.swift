//
//  Character.swift
//  RickAndMortyJson
//
//  Created by Vlad Zinevich on 28.08.2021.
//

import Foundation

struct Character: Decodable {
    let image: String
    let name: String
    let status: String
    let gender: String
}
