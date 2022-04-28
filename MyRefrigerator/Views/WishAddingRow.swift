//
//  WishAddingRow.swift
//  MyRefrigerator
//
//  Created by Poter Pan on 2022/4/16.
//

import SwiftUI

struct WishAddingRow: View {
    
    @EnvironmentObject var wishViewModel: WishViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    @FocusState var isFocused: Bool

    
    var body: some View {
        HStack {
            TextField("請輸入待購項目", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .focused($isFocused)
            
            Button(action: {
                saveButtonPressed()
                isFocused = false
            }, label: {
                Text("Add".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: 50, height: 55)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            })
        }
        .padding(14)
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsExist() {
            wishViewModel.addItem(title: textFieldText)
            textFieldText = ""
        }
    }
    
    
    func textIsExist() -> Bool {
        if textFieldText.count < 1 {
            alertTitle = "請輸入產品名稱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title:  Text(alertTitle))
    }
    
}

struct WishAddingRow_Previews: PreviewProvider {
    static var previews: some View {
        WishAddingRow()
            .previewLayout(.sizeThatFits)
    }
}
