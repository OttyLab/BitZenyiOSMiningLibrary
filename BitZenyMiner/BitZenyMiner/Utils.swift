//
//  Utils.swift
//  BitZenyMiner
//
//  Created by ochikage on 2018/04/03.
//  Copyright © 2018 ottylab. All rights reserved.
//

import Foundation

class Utils {
    static let gcd = DispatchQueue(label: "com.example.ottylab")

    static func rotateStringueue(queue: inout Array<String>, maxSize:Int, next: String) -> String {
        var logs = ""
        gcd.sync {
            while (queue.count >= maxSize) {
                queue.removeFirst()
            }
            queue.append(next)

            for element in queue {
                logs += element
            }
        }

        return logs
    }
}
