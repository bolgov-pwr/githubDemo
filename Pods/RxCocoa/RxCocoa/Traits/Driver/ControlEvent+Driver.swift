//
//  ControlEvent+Driver.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 9/19/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if !RX_NO_MODULE
import RxSwift
#endif

extension ControlEvent {
    /// Converts `ControlEvent` to `Driver` trait.
    ///
    /// `ControlEvent` already can't fail, so no special case needs to be handled.
    public func asDriver() -> Driver<E> {
        return self.asDriver { (_) -> Driver<E> in
            #if DEBUG
                rxFatalError("Somehow driver received error from a source that shouldn't fail.")
            #else
                return Driver.empty()
            #endif
        }
    }
}
