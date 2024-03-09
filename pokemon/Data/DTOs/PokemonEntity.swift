//
//  PokemonEntity.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 5/02/24.
//

import Foundation

struct Pokemon: Decodable {
    var name: String
    var url: String
}

struct ListPokemon: Decodable {
    var results: [Pokemon]
}

struct DetailPokemon: Decodable {
        let abilities: [Ability]
        let baseExperience: Int
        let height: Int
        let id: Int
        let isDefault: Bool
        let locationAreaEncounters: String
        let moves: [Move]
        let name: String
        let order: Int
        let sprites: Sprites
        let stats: [Stat]
        let weight: Int

        enum CodingKeys: String, CodingKey {
            case abilities
            case baseExperience = "base_experience"
            case height
            case id
            case isDefault = "is_default"
            case locationAreaEncounters = "location_area_encounters"
            case moves, name, order
            case sprites, stats, weight
        }
    
}

// MARK: - Ability
struct Ability: Codable {
    let ability: Species
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String
    let url: String
}

// MARK: - Move
struct Move: Codable {
    let move: Species
    let versionGroupDetails: [VersionGroupDetail]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: Species

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

// MARK: - Sprites
class Sprites: Codable {
    let backDefault: String
    let backShiny: String
    let frontDefault: String
    let frontShiny: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }

    init(backDefault: String, backShiny: String, frontDefault: String, frontShiny: String, animated: Sprites?) {
        self.backDefault = backDefault
        self.backShiny = backShiny
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
    }
}

// MARK: - Stat
struct Stat: Codable {
    let baseStat, effort: Int
    let stat: Species

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}
