//
//  MinersListView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/2/21.
//

import SwiftUI

// MARK: - Miners List View
struct MinersListView: View {
    
    // MARK: - Properties
    private let columns = [ GridItem(.flexible()) ]
    private let headlines = ["Total Hashrate", "DUCO Balance", "Estimated Profit", "DUCO Price"]
    private let headLinesColor: [Color] = [.customBlue, .customGreen, .customIndigo, .customRed]
    
    @Binding var userData: UserDataModel
    
    // body
    var body: some View {
        // vstack
        VStack {
            // hstack
            HStack {
                Text("Miners")
                    .foregroundColor(.customOrange)
                    .font(.title3)
                    .bold()
                
                Spacer()
                
                Text("Total: \(self.userData.result?.miners?.count ?? 0)")
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
            } //: hstack
            .padding(10)
            
            // grid
            LazyVGrid(columns: columns, spacing: 10) {
                // for each
                ForEach(0..<(self.userData.result?.miners?.count ?? 0), id: \.self) { item in
                    // hstack
                    HStack {
                        // vstack
                        VStack(alignment: .leading, spacing: 1) {
                            // hstack
                            HStack {
                                // logo
                                Image(systemName: "hammer")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.customOrange)
                                
                                // miner name
                                Text(self.userData.result?.miners?[item].identifier ?? "")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .bold()
                                    .padding(.vertical, 5)
                            } //: hstack
                            
                            // pool
                            Text("Pool: \(self.userData.result?.miners?[item].pool ?? "")")
                                .foregroundColor(.white)
                                .font(.caption)
                                .bold()
                                .padding(.vertical, 5)
                        } //: vstack
                        
                        Spacer()
                        
                        // vstack
                        VStack(alignment: .trailing, spacing: 1) {
                            // hashrate
                            Text("HR: \(furnishedHR(hr: self.userData.result?.miners?[item].hashrate ?? 0.0))")
                                .foregroundColor(.white)
                                .font(.headline)
                                .bold()
                                .padding(.vertical, 5)
                            
                            // diff
                            Text("Diff: \(self.userData.result?.miners?[item].diff ?? 0)")
                                .foregroundColor(.white)
                                .font(.caption)
                                .bold()
                                .padding(.vertical, 5)
                            
                            // accept / reject
                            Text("A/R: \(self.userData.result?.miners?[item].accepted ?? 0)/\(self.userData.result?.miners?[item].rejected ?? 0)")
                                .foregroundColor(.white)
                                .font(.caption)
                                .bold()
                                .padding(.vertical, 5)
                            
                        } //: vstack
                        
                    } //: hstack
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.customGray)
                    .cornerRadius(10)
                } //: for each
            } //: grid
            .padding(10)
        } //: vstack
    } //: body
    
    
    // hashrate H to KH and rounded
    func furnishedHR(hr: Double) -> String {
        return hr < 1000 ? "\(hr.round(to: 2)) H/s" : "\((hr / 1000).round(to: 2)) KH/s"
    }
}



// MARK: - Preview
struct MinersListView_Previews: PreviewProvider {
    static var previews: some View {
        MinersListView(userData: .constant(UserDataModel.init()))
            .previewLayout(.sizeThatFits)
    }
}
