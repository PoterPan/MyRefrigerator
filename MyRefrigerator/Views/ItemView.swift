//
//  ItemView.swift
//  MyRefrigerator
//
//  Created by Poter Pan on 2022/3/30.
//

import SwiftUI

struct ItemView: View {
    
    @EnvironmentObject var itemViewModel: ItemViewModel
    
    let nowDate = Date(timeIntervalSinceNow: 604800)
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("即將過期")) {
                        //                        Text("設定日期 \(nowDate)")
                        ScrollView (.horizontal) {
                            HStack {
                                ForEach(itemViewModel.items) { item in
                                    if item.exp<nowDate {
                                        ItemBlockView(item: item)
                                    }
                                }
                            }
                        }
                        
                    }
                    Section(header: Text("所有物品")) {
                        ForEach(itemViewModel.items) { item in
                            ItemRowView(item: item)
                                .swipeActions(edge: .trailing) {
                                    Button {
                                        print("Delete")
                                        withAnimation{
                                            itemViewModel.items.removeAll { $0.id == item.id }
                                        }
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                    .tint(.red)
                                    Button {
                                        print("Edit item detail")
                                    } label: {
                                        Label("Edit", systemImage: "pencil")
                                    }
                                    .tint(.green)
                                }
                                .swipeActions(edge: .leading) {
                                    Button {
                                        print("Mark as favorite")
                                    } label: {
                                        Label("Favorite", systemImage: "star")
                                    }
                                    .tint(.yellow)
                                    Button {
                                        print("Pinned to top")
                                    } label: {
                                        Label("Pin",systemImage: "pin.fill")
                                    }
                                    .tint(.blue)
                                }
                            
                        }
                        .onDelete(perform: itemViewModel.deleteItem)
                        .onMove(perform: itemViewModel.moveItem)
                        
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("我的冰箱")
            .navigationBarItems(leading: EditButton() )
            
            
            //            ToolBar with error about NavigationView
            //
            //            .toolbar{
            //                NavigationLink {
            //                    AddingView()
            //                } label: {
            //                    Image(systemName: "plus.circle.fill")
            //                        .frame(width: 25, height: 25, alignment: .center)
            //                        .foregroundColor(.blue)
            //                }
            //            }
            
            
        }
    }
    
}


struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
            .environmentObject(ItemViewModel())
        
    }
}

