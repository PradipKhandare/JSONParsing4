//
//  JsonDataModel.swift
//  JSONParsing4
//
//  Created by NTS on 08/01/24.
//

import Foundation

struct JsonDataModel: Codable
{
    let name: String
    let alpha2Code : String
    let alpha3Code : String
    let region : String
    let subregion : String
}
