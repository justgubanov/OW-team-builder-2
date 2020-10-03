//
//  PickerGroupButton.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 03.10.2020.
//

import SwiftUI

struct PickerGroupButton: View {
    
    @Binding var groupCriteria: HeroCollectionFabric.GroupCriteria
    
    private var image: Image {
        switch groupCriteria {
        case .queueRole:
            return Image(systemName: "cross.circle")
        case .pickPriority:
            return Image(systemName: "star.circle")
        }
    }
    
    private var shortName: String {
        switch groupCriteria {
        case .queueRole:
            return "role"
        case .pickPriority:
            return "priority"
        }
    }
    
    var body: some View {
        PickerOptionButton(title: "Group by",
                           image: image,
                           modeName: shortName,
                           action: toggle)
    }
    
    private func toggle() {
        switch groupCriteria {
        case .queueRole:
            groupCriteria = .pickPriority
        case .pickPriority:
            groupCriteria = .queueRole
        }
    }
}

struct PickerGroupButton_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            PickerGroupButton(groupCriteria: .constant(.pickPriority))
            
            PickerGroupButton(groupCriteria: .constant(.queueRole))
                .preferredColorScheme(.dark)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
