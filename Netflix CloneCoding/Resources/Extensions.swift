//
//  Extensions.swift
//  Netflix CloneCoding
//
//  Created by heojaenyeong on 2022/07/17.
//

import Foundation
extension String{
    func captializeFirstLetter() -> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
