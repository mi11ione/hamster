//
//  Homyak.swift
//  hamster
//
//  Created by mi11ion on 21/01/2023.
//

import Foundation
import RealmSwift

class Homyak: Object, ObjectKeyIdentifiable {
    @Persisted var name: String = ""
    
    @Persisted(primaryKey: true) var id: ObjectId
}
