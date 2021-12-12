//
//  TransactionsRowView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/7/21.
//

import SwiftUI

// MARK: - Transactions Row View
struct TransactionsRowView: View {
    
    // MARK: - Properties
    private let columns = [ GridItem(.flexible()) ]
    
    @Binding var transactionsData: TransactionsModel
    
    var body: some View {
        
        // grid
        LazyVGrid(columns: columns, spacing: 10) {
            // for each
            ForEach(0..<(self.transactionsData.result?.count ?? 0), id: \.self) { item in
                // hstack
                HStack {
                    // vstack
                    VStack(alignment: .leading) {
                        // hstack
                        HStack {
                            
                            // logo
                            Image(systemName: self.transactionsData.result?[item].recipient == UserDefaults.standard.string(forKey: "username") ? "chevron.right.square" : "chevron.left.square")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .font(Font.title.weight(.thin))
                                .foregroundColor(.black)
                            
                            // amount
                            Text("\(self.transactionsData.result?[item].amount ?? 0) ᕲ")
                                .foregroundColor(.customOrange)
                                .font(.title)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .padding([.trailing, .vertical])
                            
                        } //: hstack
                        
                        // sender
                        Text("Sender: \(self.transactionsData.result?[item].sender ?? "")")
                            .foregroundColor(.black)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .padding(.vertical, 1)
                        
                        
                        // recipent
                        Text("Recipient: \(self.transactionsData.result?[item].recipient ?? "")")
                            .foregroundColor(.black)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .padding(.vertical, 1)
                        
                        
                        // time and date
                        Text("Time and Date: \(self.transactionsData.result?[item].datetime ?? "")")
                            .foregroundColor(.black)
                            .font(.caption)
                            .fontWeight(.regular)
                            .padding(.vertical, 1)
                    } //: vstack
                    
                    Spacer()
                    
                } //: hstack
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.customGray)
                .cornerRadius(10)
            } //: for each
        } //: grid
        .padding(10)
    }
}


// MARK: - Preview
struct TransactionsRowView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsRowView(transactionsData: .constant(TransactionsModel.init()))
            .previewLayout(.sizeThatFits)
    }
}
