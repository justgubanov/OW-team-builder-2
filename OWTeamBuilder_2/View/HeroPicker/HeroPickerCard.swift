//
//  HeroPickerCard.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 19.07.2020.
//

import SwiftUI

struct HeroPickerCard: View {
    
    typealias GroupCriteria = HeroCollectionFabric.GroupCriteria
    typealias SortCriteria = PickableHeroCollection.SortCriteria
    
    @EnvironmentObject private var session: MatchSession
    
    @Binding private var isPresented: Bool
    @State private var sortCriteria: SortCriteria = .name
    @State private var groupCriteria: GroupCriteria = .queueRole
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    private var isRoleLocked: Bool {
        return session.focusedSpot?.roleLock != .any
    }
    
    var body: some View {
        VStack {
            HStack {
                PickerSortButton(sortCriteria: $sortCriteria)
                if !isRoleLocked {
                    PickerGroupButton(groupCriteria: $groupCriteria)
                }
                
                Spacer()
                
                XmarkCloseButton(action: closePicker)
                    .frame(height: 30)
            }
            .padding()
            
            HeroPicker(groupCriteria: groupCriteria, sortCriteria: sortCriteria)
            
            Spacer()
                .frame(height: 20)
        }
        .background(
            Color(.secondarySystemGroupedBackground)
                .cornerRadius(10)
                .shadow(radius: 2)
        )
        .onChange(of: session.focusedSpot?.roleLock) { _ in
            if isRoleLocked {
                groupCriteria = .pickPriority
            } else {
                groupCriteria = .queueRole
            }
        }
        .gesture(dismissGesture)
    }
    
    private var dismissGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged { value in
                guard value.translation.height > 80 else {
                    return
                }
                closePicker()
            }
    }
    
    private func closePicker() {
        isPresented = false
    }
}

struct HeroPickerCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeroPickerCard(isPresented: .constant(true))
                .environmentObject(MatchSession())
            
            HeroPickerCard(isPresented: .constant(true))
                .environmentObject(MatchSession())
                .colorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
