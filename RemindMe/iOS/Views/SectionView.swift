//
//  SectionView.swift
//  RemindMe (iOS)
//
//  Created by Roman Zuchowski on 07.10.23.
//

import SwiftUI

struct SectionView: View {
    
    var items: [RemindMeItem]
    
    init(items: [RemindMeItem]) {
        self.items = items
    }
    
    var body: some View {
        List(items) { item in
            Text(item.itemTitle)
        }
    }
}

#Preview {
    SectionView(items: RemindMeItem.getExampleData())
}
