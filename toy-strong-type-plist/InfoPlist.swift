//
//  InfoPlist.swift
//  toy-strong-type-plist
//
//  Created by Faiz Mokhtar on 05/05/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import Foundation

public struct InfoPlist: Codable {

    public struct Configuration: Codable {
        public let url: URL?
        public let environment: String
    }

    public let configuration: Configuration
}
