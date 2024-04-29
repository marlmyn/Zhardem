//
//  ArticlesModel.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 29.04.2024.
//

import UIKit

struct ArticleModel: Codable {
    let title, author, publicationDate, tags: String
    let imagePath: String
}

typealias Articles = [ArticleModel]
