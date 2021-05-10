//
//  Array+Only.swift
//  Memorize
//
//  Created by Peter Kostin on 2021-05-10.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first :nil
    }
}
