//
//  PushSegue.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/26.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class PushSegue: UIStoryboardSegue {
    override func perform() {
        source.navigationController?.pushViewController(destination, animated: true)
    }
}
