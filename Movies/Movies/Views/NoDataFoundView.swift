//
//  NoDataFoundView.swift
//  Movies
//
//  Created by Rabel Ahmed  on 22/9/22.
//

import SwiftUI

struct NoDataFoundView: View {
    let errorText: String
    var body: some View {
        Text(errorText)
            .font(.largeTitle)
            .italic()
    }
}
