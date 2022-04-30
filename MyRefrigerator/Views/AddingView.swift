//
//  AddingView.swift
//  MyRefrigerator
//
//  Created by Poter Pan on 2022/3/30.
//

import SwiftUI

struct AddingView: View {
    
    @EnvironmentObject var itemViewModel: ItemViewModel
    
    
    @State var newName: String = ""
    @State var newType: String = ""
    @State var newImage: String = ""
    @State var newPrice: Double = 0.0
    @State var newhaveExp: Bool = true
    let types = ["水果","蔬菜","飲品","肉類食材","其他"]
    @State private var selectedName = "其他"
    @State var newPurchaseDate: Date = Date()
    @State var newExp: Date = Date()
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    @FocusState private var isFocused: Bool
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    //    var items: [itemModel]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack{
                        
                        Button {
                            
                            self.isShowPhotoLibrary = true
                            
                        } label: {
                            Image(uiImage: self.image)
                                .resizable()
                                .cornerRadius(20)
                                .frame(width: 100, height: 100)
                                .background{
                                    Image(systemName: "photo.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80)
                                        .padding(.trailing, 10)
                                }
                                .aspectRatio(contentMode: .fill)
                            
                        }
                        
                        VStack{
                            HStack {
                                Text("商品名稱：")
                                //                                Spacer()
                                TextField("", text: $newName)
                                //                        .textFieldStyle(.roundedBorder)
                                    .frame(maxWidth: .infinity, minHeight: 35)
                                    .background(Color(UIColor.secondarySystemBackground))
                                    .cornerRadius(10)
                                    .focused($isFocused)
                                
                            }
                            HStack {
                                Text("購入價格：")
                                //                                Spacer()
                                TextField("", value: $newPrice, format: .number)
                                    .keyboardType(.decimalPad)
                                    .frame(maxWidth: .infinity, minHeight: 35)
                                    .background(Color(UIColor.secondarySystemBackground))
                                //                            .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                                    .cornerRadius(10)
                                    .focused($isFocused)
                                
                            }
                        }
                    }
                    .sheet(isPresented: $isShowPhotoLibrary) {
                        ImagePicker(sourceType: .camera, selectedImage: self.$image)
                    }
                    
                    HStack {
                        Text("類型：")
                        Spacer()
                        Picker(selection: $selectedName) {
                            ForEach(types, id: \.self) { type in
                                Text(type)
                            }
                        } label: {
                            Text("選擇類型")
                        }
                        .pickerStyle(.menu)
                        .padding(3)
                        .padding(.horizontal, 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 3)
                        )
                    }
                    //                    Text("當前選中項：\(selectedName)")
                    
                    
                    DatePicker("購買日期", selection: $newPurchaseDate, displayedComponents: .date)
                    
                    Toggle("存在有效期限", isOn: $newhaveExp.animation())
                        .padding(.vertical, 5.0)
                    
                    if newhaveExp {
                        DatePicker("有效期限", selection: $newExp, displayedComponents: .date)
                    }
                    
                    
                    Button (action: {
                        saveButtonPressed()
                        isFocused = false
                    })
                    {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                            .padding()
                        
                    }
                    
                    Button (action: {
                        itemViewModel.createDefultItems()
                        isFocused = false
                    })
                    {
                        Text("Create Defult Items".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                            .cornerRadius(10)
                            .padding()
                        
                    }
                    
                }
                .padding(16)
                .navigationTitle("新增物品")
                .navigationBarTitleDisplayMode(.inline)
                .alert(isPresented: $showAlert, content: getAlert)
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarLeading){
                        //                    closeView
                        Button(action: {
                            resetItem()
                            
                            isFocused = false
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                        }
                    }
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                        //                    saveData
                        Button (action: {
                            saveButtonPressed()
                            isFocused = false
                        })
                        {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                            
                        }
                        
                    }
                }
            }
        }
    }
    func saveButtonPressed() {
        if textIsExist() {
            if image.size.width == 0 {
                image = UIImage(systemName: "photo.fill")!
            }
            
            itemViewModel.addItem(name: newName, type: newType, price: newPrice, purchaseDate:newPurchaseDate, haveExp: newhaveExp, exp: newExp, image: image)
            resetItem()
            
        }
        
    }
    
    func textIsExist() -> Bool {
        if newName.count < 1 {
            alertTitle = "請輸入產品名稱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title:  Text(alertTitle))
    }
    
    func resetItem() {
        newName = ""
        newType = ""
        newImage = ""
        newPrice = 0.0
        newhaveExp = true
        selectedName = "其他"
        newPurchaseDate = Date()
        newExp = Date()
        image = UIImage()
        itemViewModel.reset()
        
    }
}

struct AddingView_Previews: PreviewProvider {
    static var previews: some View {
        AddingView()
        
    }
}
