//
//  User.swift
//  MyProfile
//
//  Created by Алексей Зарудный on 13.03.2022.
//

struct User {
    let username: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(username: "qwe", password: "111", person: .init(name: "alex", surname: "zar", age: 41, job: "zzz", hobby: "sport"))
    }
}

struct Person {
    let name: String
    let surname: String
    let age: Int
    let job: String
    let hobby: String
}

