//
//  datatype.swift
//  json Parse
//
//  Created by MrBostan on 3.12.2025.
//

import Foundation

struct datatype: Identifiable, Decodable {
    var id: Int
    var login: String
    var node_id: String
    var avatar_url: String
}
