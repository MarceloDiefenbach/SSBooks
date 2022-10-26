//
//  Queries.swift
//  StudioSolTestBooks
//
//  Created by Marcelo Diefenbach on 25/10/22.
//

import Foundation
import GraphQL

enum RequestQuery {
    case favoriteBooks
    case favoriteAuthors
    case allBooks
    
    var query: ExecutionArgs {
        switch self {
            case .favoriteBooks:
                return ExecutionArgs(
                    query: """
                    query getBooks {
                      favoriteBooks {
                        name
                        cover
                        description
                        author {
                          name
                        }
                      }
                    }
                    """,
                    variables: [:]
                )
            case .favoriteAuthors:
                return ExecutionArgs(
                    query: """
                    query getFavoriteAuthors {
                      favoriteAuthors {
                        name
                        picture
                        booksCount
                      }
                    }
                    """,
                    variables: [:]
                )
            case .allBooks:
                return ExecutionArgs(
                    query: """
                    query getBooks {
                      allBooks {
                        name
                        cover
                        description
                        author {
                          name
                        }
                      }
                    }
                    """,
                    variables: [:]
                )
        }
    }
    
    var queryName: String {
        switch self {
            case .favoriteBooks:
                return "favoriteBooks"
            case .favoriteAuthors:
                return "favoriteAuthors"
            case .allBooks:
                return "allBooks"
        }
    }
}
