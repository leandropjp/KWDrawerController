/*
The MIT License (MIT)

Copyright (c) 2017 Kawoou (Jungwon An)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import UIKit

open class DrawerCurveEaseAnimator: DrawerAnimator {

    // MARK: - Enum
    
    public enum EaseType {
        case linear
        case easeIn
        case easeOut
        case easeInOut
        
        internal func option() -> UIView.AnimationOptions {
            switch self {
            case .linear:
                return .curveLinear
            case .easeIn:
                return .curveEaseIn
            case .easeOut:
                return .curveEaseOut
            case .easeInOut:
                return .curveEaseInOut
            }
        }
    }
    
    
    // MARK: - Property
    
    open var easeType: EaseType
    
    
    // MARK: - Public
    
    open override func animate(duration: TimeInterval, animations: @escaping (Float)->(), completion: @escaping ((Bool)->())) {
        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            options: easeType.option(),
            animations: {
                animations(1.0)
            },
            completion: completion
        )
    }
    
    
    // MARK: - Lifecycle
    
    public init(easeType: EaseType = .easeInOut) {
        self.easeType = easeType
        
        super.init()
    }
    
}
