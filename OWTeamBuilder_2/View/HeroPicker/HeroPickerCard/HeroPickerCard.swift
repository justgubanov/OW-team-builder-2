//
//  HeroPickerCard.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 19.07.2020.
//

import SwiftUI

struct HeroPickerCard: View {
    
    @EnvironmentObject private var session: MatchSession
    
    @Binding private var isPresented: Bool
    @State private var sortsByRank: Bool = false
    @State private var groupsByRole: Bool = false
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    private var isRoleLocked: Bool {
        return session.focusedSpot?.roleLock != .any
    }
    
    private var sortCriteria: PickableHeroCollection.SortCriteria {
        return sortsByRank ? .compositionValue : .name
    }
    
    private var groupCriteria: HeroCollectionFabric.GroupCriteria {
        guard !isRoleLocked else {
            return .tierValue
        }
        return groupsByRole ? .queueRole : .tierValue
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                if !isRoleLocked {
                    GroupButton(isGroupedByRole: $groupsByRole, action: toggleGrouping)
                }
                SortButton(isSortedByRank: $sortsByRank, action: toggleSort)
                CloseButton(action: closePicker)
            }
            
            HeroPicker(groupCriteria: groupCriteria, sortCriteria: sortCriteria)
            
            Spacer()
                .frame(height: 20)
        }
        .background(
            Color(.tertiarySystemGroupedBackground)
                .cornerRadius(10)
                .shadow(radius: 30)
        )
    }
    
    private func closePicker() {
        session.setFocusedSpot(to: nil)
        isPresented = false
    }
    
    private func toggleSort() {
        sortsByRank.toggle()
    }
    
    private func toggleGrouping() {
        groupsByRole.toggle()
    }
}

struct HeroPickerCard_Previews: PreviewProvider {
    static var previews: some View {
        HeroPickerCard(isPresented: .constant(true))
    }
}
