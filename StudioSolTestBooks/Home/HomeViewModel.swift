//
//  HomeViewModel.swift
//  StudioSol
//
//  Created by Marcelo Diefenbach on 23/10/22.
//

import Foundation
import Combine
import SwiftGraphQL
import GraphQL
import SwiftGraphQLClient

class HomeViewModel: ObservableObject {
    
    @Published var books: [Book] = []
    @Published var authors: [Author] = []
    @Published var allBooks: [Book] = []
    private var subscriptions: Set<AnyCancellable> = []
    
    let segmentedControlFirst = "Meus Livros"
    let segmentedControlSecond = "Emprestados"
    
    let url = "https://us-central1-ss-devops.cloudfunctions.net/GraphQL"
    
    func getFavoriteBooks(completionHandler: @escaping ([Book]) -> Void) {
        
        let request = URLRequest(url: URL(string: url)!)
        let client = SwiftGraphQLClient.Client(request: request)
        
        client.mutate(RequestQuery.favoriteBooks.query)
            .sink { completion in
                print(completion)
            } receiveValue: { result in
                
                guard let dict = result.data.value as? [String: Any] else {
                    return
                }
                
                let data = (dict["\(RequestQuery.favoriteBooks.queryName)"] as! Array<Any>)
                var books: [Book] = []
                
                for dataIntern in data {
                    
                    if let name = (dataIntern as! [String:Any])["name"] as? String,
                       let cover = (dataIntern as! [String:Any])["cover"] as? String,
                       let description = (dataIntern as! [String:Any])["description"] as? String {
                        
                        let author = (dataIntern as! [String:Any])["author"]
                        
                        if let authorName = (author as! [String:Any])["name"] as? String {
                            
                            let book = Book(
                                name: name,
                                author: Author(
                                    name: authorName
                                ),
                                cover: cover,
                                description: description
                            )
                            books.append(book)
                            
                        } else {
                            fatalError()
                        }
                    } else {
                        fatalError()
                    }
                }
                print(books)
                self.books = books
                completionHandler(books)
            }.store(in: &subscriptions)
    }
    
    func getFavoriteAuthors(completionHandler: @escaping ([Author]) -> Void) {
        
        let request = URLRequest(url: URL(string: url)!)
        let client = SwiftGraphQLClient.Client(request: request)
        
        let args = RequestQuery.favoriteAuthors.query
        
        client.mutate(args)
            .sink { completion in
                print(completion)
            } receiveValue: { result in
                
                guard let dict = result.data.value as? [String: Any] else {
                    fatalError()
                    return
                }
                
                let data = (dict[RequestQuery.favoriteAuthors.queryName] as! Array<Any>)
                var authors: [Author] = []
                
                for dataIntern in data {
                    
                    if let name = (dataIntern as! [String:Any])["name"] as? String,
                       let picture = (dataIntern as! [String:Any])["picture"] as? String,
                       let booksCount = (dataIntern as! [String:Any])["booksCount"] as? Int {
                        
                        let author = Author(name: name, picture: picture, booksCount: booksCount)
                        authors.append(author)
                    } else {
                        fatalError()
                    }
                }
                self.authors = authors
                completionHandler(authors)
            }.store(in: &subscriptions)
    }
    
    func getAllBooks(completionHandler: @escaping ([Book]) -> Void) {
        
        let request = URLRequest(url: URL(string: url)!)
        let client = SwiftGraphQLClient.Client(request: request)
        
        client.mutate(RequestQuery.allBooks.query)
            .sink { completion in
                print(completion)
            } receiveValue: { result in
                
                guard let dict = result.data.value as? [String: Any] else {
                    return
                }
                
                let data = (dict[RequestQuery.allBooks.queryName] as! Array<Any>)
                var books: [Book] = []
                
                for dataIntern in data {
                    
                    if let name = (dataIntern as! [String:Any])["name"] as? String,
                       let cover = (dataIntern as! [String:Any])["cover"] as? String,
                       let description = (dataIntern as! [String:Any])["description"] as? String {
                        
                        let author = (dataIntern as! [String:Any])["author"]
                        
                        if let authorName = (author as! [String:Any])["name"] as? String {
                            
                            let book = Book(
                                name: name,
                                author: Author(
                                    name: authorName
                                ),
                                cover: cover,
                                description: description
                            )
                            books.append(book)
                            
                        } else {
                            fatalError()
                        }
                    } else {
                        fatalError()
                    }
                }
                print(books)
                self.allBooks = books
                completionHandler(books)
            }.store(in: &subscriptions)
    }
}
