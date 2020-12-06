//
//  PickerSortButton.swift
//  OverAssistantApp
//
//  Created by Александр Губанов on 28.09.2020.
//

import SwiftUI

struct PickerSortButton: View {
    
    @Binding var sortCriteria: PickableHeroCollection.SortCriteria
    
    private var image: Image {
        switch sortCriteria {
        case .name:
            return Image(systemName: "bookmark.circle")
        case .compositionValue:
            return Image(systemName: "person.2.circle")
        }
    }
    
    private var shortName: String {
        switch sortCriteria {
        case .name:
            return "name"
        case .compositionValue:
            return "value"
        }
    }
    
    var body: some View {
        PickerOptionButton(title: "Sort by",
                           image: image,
                           modeName: shortName,
                           action: toggle)
    }
    
    private func toggle() {
        switch sortCriteria {
        case .name:
            sortCriteria = .compositionValue
        case .compositionValue:
            sortCriteria = .name
        }
    }
}

struct PickerSortButton_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            PickerSortButton(sortCriteria: .constant(.name))
            
            PickerSortButton(sortCriteria: .constant(.compositionValue))
                .preferredColorScheme(.dark)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
