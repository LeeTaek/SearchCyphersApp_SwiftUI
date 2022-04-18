//
//  playerInfo.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/18.
//

import SwiftUI

// MARK: - UserInfo
struct UserInfo: Codable {
    let rows: [PlayerInfo]
}

// MARK: - Row
struct PlayerInfo: Codable {
    let playerId, nickname: String
    let grade: Int


}

struct Rank : Codable {
    let Rank : [String : MatchInfo]
}

// MARK: - UserInfo
struct MatchInfo: Codable {
    let playerId, nickname: String
    let grade: Int
    let clanName: String?
    let ratingPoint, maxRatingPoint: Int?
    let tierName: String?
    let records: [Record]?
    let matches: Matches
}

// MARK: - Matches
struct Matches: Codable {
    let gameTypeId, next: String
    let rows: [MatchRow]
}


// MARK: - Row
struct MatchRow: Codable {
    let date, matchId: String
    let map: Map
    let playInfo: PlayInfo
    let position: Position

   
}

// MARK: - Map
struct Map: Codable {
    let name: String
}

// MARK: - PlayInfo
struct PlayInfo: Codable {
    let res: String
    let random: Bool
    let partyUserCount: Int?
    let partyInfo: [PartyInfo]?
    let playTypeName: String
    let characterId, characterName: String
    let level, killCount, deathCount, assistCount: Int
    let attackPoint, damagePoint, battlePoint, sightPoint: Int
    let towerAttackPoint, backAttackCount, comboCount, spellCount: Int
    let healAmount, sentinelKillCount, demolisherKillCount, trooperKillCount: Int
    let guardianKillCount, guardTowerKillCount, getCoin, spendCoin: Int
    let spendConsumablesCoin, playTime, responseTime, minLifeTime: Int
    let maxLifeTime: Int

    enum CodingKeys: String, CodingKey {
        case res = "result"
        case random, partyUserCount, partyInfo, playTypeName, characterId, characterName, level, killCount, deathCount, assistCount, attackPoint, damagePoint, battlePoint, sightPoint, towerAttackPoint, backAttackCount, comboCount, spellCount, healAmount, sentinelKillCount, demolisherKillCount, trooperKillCount, guardianKillCount, guardTowerKillCount, getCoin, spendCoin, spendConsumablesCoin, playTime, responseTime, minLifeTime, maxLifeTime
    }
}

struct RankMatchInfo : Codable {
    let averageRate : [String : Double]
    let matchingData : [MatchRow]
    
}


// MARK: - PartyInfo
struct PartyInfo: Codable {
    let playerId, nickname, characterId, characterName: String
}


// MARK: - Position
struct Position: Codable {
    let name: String
    let explain: String
    let attribute: [Attribute]
}

// MARK: - Attribute
struct Attribute: Codable {
    let level: Int
    let id, name: String
}


// MARK: - Record
struct Record: Codable {
    let gameTypeId: String
    let winCount, loseCount, stopCount: Int

}


// MARK: - data -> NsDictionary
extension Encodable {
    
    func encode() throws -> [String:Any] {
        
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any] else {
            throw NSError()
        }
        
        return dictionary
    }
}



// MARK: - NSDictionary -> data
extension Decodable {
        
    static func decode<T: Decodable>(dictionary : [String:Any]) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: dictionary, options: [.prettyPrinted])
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}


let MatchRowSamples = [
    MatchRow(date:  "2022-04-13 00:55", matchId: "89f11e549709d2a7ebab20b9bf0dc58626f53135aa58a38940e14bd120276693", map: mapSample, playInfo: playInfoSample, position: positionSample)

]

let mapSample = Map(name: "메트로폴리스")
let playInfoSample = PlayInfo(res: "lose", random: false, partyUserCount: 0, partyInfo: nil, playTypeName: "정상", characterId: "052b8ab48199f154cbafc20a8ea7ebcf", characterName: "릭", level: 37, killCount: 1, deathCount: 7, assistCount: 11, attackPoint: 11998, damagePoint: 63664, battlePoint: 353, sightPoint: 496, towerAttackPoint: 978, backAttackCount: 28, comboCount: 36, spellCount: 0, healAmount: 0, sentinelKillCount: 1, demolisherKillCount: 3, trooperKillCount: 0, guardianKillCount: 0, guardTowerKillCount: 0, getCoin: 13340, spendCoin: 13000, spendConsumablesCoin: 5300, playTime: 1276, responseTime: 202, minLifeTime: 52, maxLifeTime: 283)
let positionSample = Position(name: "탱커", explain: "체력 +7%, 회피 +5%", attribute: attributeSample)

let attributeSample = [
    
    Attribute(level: 1, id: "678bca255e575ae96aceefacaa7aee4e", name: "최후의 저항"),
    Attribute(level: 2, id: "1d49c4504c55a43f670d4d69575760d4", name: "재생의 숨결"),
    Attribute(level: 3, id: "6d8fb905d69edf1c9f73495c3ee44d28", name: "선봉장")

]
