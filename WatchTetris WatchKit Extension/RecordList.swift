import SwiftUI

struct RecordList: View {
    
    var body: some View {
        
        return ZStack {
            
            if (Record.records.count > 0)
            {
                ScrollView([.vertical], showsIndicators: false) {
                    VStack {
                        
                        ForEach(Record.records, id: \.id) {
                            record in RecordListElement(record: record)
                        }
                    }
                }
            }
            else
            {
                VStack (alignment: .center) {
                    Spacer()
                    
                    Text("You don't\nhave records!").multilineTextAlignment(.center).foregroundColor(MyColor.vipstatusgoldcolor).font(.system(size: GamingActivity.fontsize, weight: .heavy, design: .default)).lineLimit(2)
                    
                    Spacer()
                }
            }
        }.animation(.spring()).font(.system(size: CGFloat(GamingActivity.fontsize))).lineLimit(1)
    }
}


#if DEBUG
struct RecordList_Previews: PreviewProvider {
    static var previews: some View {
        RecordList()
    }
}
#endif
