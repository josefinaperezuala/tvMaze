//
//  Constants.swift
//  TvMaze
//
//  Created by Josefina Perez on 05/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

struct Constants {
    static let baseUrl = "http://api.tvmaze.com/"
}

struct K {
    struct ProductionServer {
        static let baseURL = "https://api.medium.com/v1"
    }
    struct APIParameterKey {
        static let password = "password"
        static let email = "email"
    }
}
enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}
enum ContentType: String {
    case json = "application/json"
}
