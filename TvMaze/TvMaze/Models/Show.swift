//
//  Show.swift
//  TvMaze
//
//  Created by Josefina Perez on 04/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import SwiftyJSON

struct Schedule {
    
    let time: String
    let days: [String]
}

struct Rating {
    
    let average: Float
}

struct Country {
    
    let name: String
    let code: String
    let timezone: String
}

struct Network {
    
    let id: Int
    let name: String
    let country: Country
}

struct WebChannel {
    
    let id: Int
    let name: String
    let country: Country
}

struct Externals {
    
    let tvrage: Int
    let thetvdb: Int
    let imdb: String
}

struct Image {
    
    let medium: String
    let original: String
}

struct Links {
    
    let show: String
    let previousEpisode: String
}

class Show {
    
    let id: Int
    let url: String
    let name: String
    let type: String
    let language: String
    let genres: [String]
    let status: String
    let runtime: Int
    let premiered: String
    let officialSite: String
    let schedule: Schedule
    let rating: Rating
    let weight: Int
    let network: Network
    let webChannel: WebChannel?
    let externals: Externals
    let image: Image
    let summary: String
    let updated: Int
    let links: Links
    
    init(
        id: Int,
        url: String,
        name: String,
        type: String,
        language: String,
        genres: [String],
        status: String,
        runtime: Int,
        premiered: String,
        officialSite: String,
        schedule: Schedule,
        rating: Rating,
        weight: Int,
        network: Network,
        webChannel: WebChannel,
        externals: Externals,
        image: Image,
        summary: String,
        updated: Int,
        links: Links)
    {
        self.id = id
        self.url = url
        self.name = name
        self.type =  type
        self.language = language
        self.genres = genres
        self.status = status
        self.runtime = runtime
        self.premiered = premiered
        self.officialSite = officialSite
        self.schedule = schedule
        self.rating = rating
        self.weight = weight
        self.network = network
        self.webChannel = webChannel
        self.externals = externals
        self.image = image
        self.summary = summary
        self.updated = updated
        self.links = links
    }
}

