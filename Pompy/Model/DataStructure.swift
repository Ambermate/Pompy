//
//  DataStructure.swift
//  Pompy
//
//  Created by Long Hai on 10/16/22.
//

import FirebaseFirestoreSwift
import Foundation
import UIKit

struct User: Identifiable, Hashable, Decodable {
    @DocumentID var id: String?
    var imageURL = ""
}
