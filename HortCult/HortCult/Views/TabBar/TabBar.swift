//import SwiftUI
//
//struct TabBar: View {
//    @State private var selectedTab: Int = 0
//    @AppStorage ("selectedTheme")private var selectedTheme: Choice?
//    @Environment(\.colorScheme) var colorScheme
//    
//    @ObservedObject var plantViewModel: PlantViewModel
//    
//    init(plantViewModel: PlantViewModel) {
//            self.plantViewModel = plantViewModel
//            plantViewModel.fetch()
//    }
//    
//    struct TabBarButton: View {
//        let tabIcon: String
//        let isSelected: Bool
//        let action: () -> Void
//        var body: some View {
//            Button(action: action) {
//                VStack {
//                    Image(tabIcon)
//                        .resizable()
//                        .frame(width: 30, height: 30)
//                }
//                .foregroundColor(isSelected ? Color("VerdeClaro") : Color("Cinza"))
//            }
//        }
//    }
//    
//    var body: some View {
//        VStack(spacing: 0) {
//            switch selectedTab {
//            case 0:
//                Home()
//            case 1:
//                AjustesView()
//            default:
//                EmptyView()
//            }
//            Spacer()
//            ZStack(alignment: .center) {
//                Color("BrancoTabBar")
//                    .frame(height: 80)
//                    .shadow(color: Color("Preto").opacity(0.2), radius: 5, x: 0, y: 2)
//                
//                HStack(spacing: 0) {
//                    Spacer()
//                    TabBarButton(tabIcon: selectedTab == 0 ? (colorScheme == .dark ? "HomeGreenLight" : "HomeGreen") : (colorScheme == .dark ? "HomeGrey" : "Home"), isSelected: selectedTab == 0) {
//                        selectedTab = 0
//                    }
//                    Spacer()
//                    TabBarButton(tabIcon: selectedTab == 1 ? (colorScheme == .dark ? "SettingsGreenLight" : "SettingsGreen") : (colorScheme == .dark ? "SettingsGrey" : "Settings"), isSelected: selectedTab == 1) {
//                        selectedTab = 1
//                    }
//                    Spacer()
//                }
//            }
//        }.ignoresSafeArea(edges: .bottom)
//        .navigationBarBackButtonHidden(true)
//        .preferredColorScheme(selectedTheme == .Claro ? .light : (selectedTheme == .Escuro ? .dark : .none))
//        .environmentObject(plantViewModel)
//
//    }
//}
//
//struct TabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBar(plantViewModel: PlantViewModel())
//    }
//}
