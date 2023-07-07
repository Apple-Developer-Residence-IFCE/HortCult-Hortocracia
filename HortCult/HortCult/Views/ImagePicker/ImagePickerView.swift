import SwiftUI

struct ImagePickerView: View {
    @EnvironmentObject var imagesSelected: ImageSelected
    @State private var emptyPicker = false

    var body: some View {
        HStack {
            if imagesSelected.imagesSelected.isEmpty {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 12) {
                        Button(action: {
                            emptyPicker = true
                        }) {
                            ZStack {
                                Color("BrancoMinhaHorta")
                                Image("AddCinza")
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 120, height: 120)
                            .cornerRadius(10)
                        }
                        .sheet(isPresented: $emptyPicker) {
                            ImagePicker()
                        }
                        ZStack {
                            Color("Branco")
                        }.overlay(
                            Rectangle()
                                .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                                .foregroundColor(Color("Cinza"))
                        )
                        
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                        ZStack {
                            Color("Branco")
                            
                        }.overlay(
                            Rectangle()
                                .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                                .foregroundColor(Color("Cinza"))
                        )
                        
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                        ForEach(imagesSelected.imagesSelected, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120 ,height: 120)
                        }
                    }.padding(.all, 10)
                }
            } else {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 12) {
                        Button(action: {
                            emptyPicker = true
                        }) {
                            ZStack {
                                Color("BrancoMinhaHorta")
                                Image("Add")
                                    .resizable()
                                    .frame(width: 45, height: 46)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 120, height: 120)
                            .cornerRadius(10)
                        }
                        .sheet(isPresented: $emptyPicker) {
                            ImagePicker()
                        }
                        
                        ForEach(imagesSelected.imagesSelected, id: \.self) { image in
                        VStack{
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxHeight: 120)
                                .clipped()
                        }.frame(width: 120, height: 120)
                            .background(Color("BrancoMinhaHorta"))
                            .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}


struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
            .environmentObject(ImageSelected())
    }
}


