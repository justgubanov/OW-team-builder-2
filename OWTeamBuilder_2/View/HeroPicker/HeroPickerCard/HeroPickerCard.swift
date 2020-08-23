//
//  HeroPickerCard.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 19.07.2020.
//

import SwiftUI

struct HeroPickerCard: View {
    
    @EnvironmentObject private var session: MatchSession
    
    @State private var sortsByRank: Bool = false
    @State private var groupsByRole: Bool = false
    
    private var isRoleLocked: Bool {
        return session.focusedSpot?.wrappedValue.roleLock != .any
    }
    
    private var sortCriteria: HeroPicker.SortCriteria {
        return sortsByRank ? .byCompositionValue : .alphabetically
    }
    
    private var groupCriteria: HeroPicker.GroupCriteria {
        guard !isRoleLocked else {
            return .byTierValue
        }
        return groupsByRole ? .byQueueRole : .byTierValue
    }
    
    private var isPresented: Bool {
        session.focusedSpot != nil
    }
    
    var body: some View {
        Group {
            if isPresented {
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        if !isRoleLocked {
                            GroupButton(isGroupedByRole: $groupsByRole, action: toggleGrouping)
                        }
                        SortButton(isSortedByRank: $sortsByRank, action: toggleSort)
                        CloseButton(action: closePicker)
                    }
                    
                    VStack {
                        HeroPicker(groupCriteria: groupCriteria, sortCriteria: sortCriteria)
                        
                        Spacer()
                            .frame(height: 20)
                    }
                    .frame(maxHeight: 400)
                    .background(
                        Color(.secondarySystemGroupedBackground)
                            .cornerRadius(10)
                            .shadow(radius: 30)
                    )
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
    
    private func closePicker() {
        session.focusedSpot = nil
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
        HeroPickerCard()
    }
}
