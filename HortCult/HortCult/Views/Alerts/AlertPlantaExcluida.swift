import SwiftUI

struct CustomAlert: View {
    var title: String
    var message: String
    var primaryButtonTitle: String
    var primaryButtonAction: () -> Void
    var secondaryButtonTitle: String?
    var secondaryButtonAction: (() -> Void)?
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .foregroundColor(Color("VerdeEscuro"))
            
            Text(message)
                .font(.body)
                .foregroundColor(Color("CinzaEscuro"))
            
            Spacer()
            
            Divider()
                .padding(.top, 8)
            
            HStack(spacing: 0) {
                if let secondaryButtonTitle = secondaryButtonTitle {
                    Button(action: secondaryButtonAction ?? {}) {
                        Text(secondaryButtonTitle)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                }
                
                Button(action: primaryButtonAction) {
                    Text(primaryButtonTitle)
                        .font(.body)
                        .bold()
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.secondary, lineWidth: 1)
        )
        .padding(.horizontal, 20)
    }
}


//struct AlertPlantaExcluida_Previews: PreviewProvider {
//    static var previews: some View {
//        AlertPlantaExcluida()
//    }
//}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(
            title: "Planta Excluida!",
            message: "",
            primaryButtonTitle: "Voltar para Tela inicial",
            primaryButtonAction: {}
            //secondaryButtonTitle: "Cancel",
            //secondaryButtonAction: {}
        )
       //.padding()
    //.previewLayout(.sizeThatFits)
    }
}
