import SwiftUI

struct RecordListElement: View {
    
    public static let shadowradius: CGFloat = 2
    
    @State var record: Record
    
    var body: some View {
        VStack {
            VStack() {
                HStack {
                    VStack {
                        HStack {
                            Text("\(Record.records.firstIndex(where: {$0 === self.record})! + 1))").padding(.leading)
                            
                            Text("\(self.record.getName())").lineLimit(self.getWordsCount(self.record.getName()))
                            
                            Spacer()
                        }.padding(.vertical).shadow(color: Color.black, radius: RecordListElement.shadowradius, x: RecordListElement.shadowradius, y: RecordListElement.shadowradius)
                        
                        HStack {
                            Text("\(self.record.getStringForUI())").padding(.bottom).padding(.leading).shadow(color: Color.black, radius: RecordListElement.shadowradius, x: RecordListElement.shadowradius, y: RecordListElement.shadowradius).lineLimit(1).font(.system(size: GamingActivity.fontsize - 4))
                            
                            Spacer()
                        }
                    }
                    
                    Text("\(self.record.getScore())").foregroundColor(self.record.getIsNow() ? MyColor.connquantityhigh : MyColor.vipstatusgoldcolor).padding(.trailing).shadow(color: self.record.getIsNow() ? MyColor.connquantityhigh : MyColor.vipstatusgoldcolor, radius: RecordListElement.shadowradius, x: RecordListElement.shadowradius, y: RecordListElement.shadowradius).lineLimit(1)
                }
            }.font(.system(size: GamingActivity.fontsize, weight: .heavy, design: .default)).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 4)).shadow(color: Color.black, radius: RecordListElement.shadowradius, x: RecordListElement.shadowradius, y: RecordListElement.shadowradius)
        }.padding().background(MyColor.colortransparent).listRowBackground(MyColor.colortransparent)
    }
    
    public func getWordsCount(_ string: String) -> Int
    {
        let answer = Logic.replaceAll(string.trimmingCharacters(in: .whitespacesAndNewlines), "\\s+", " ")
            .components(separatedBy: " ").count
        
        return answer > 0 ? answer : 1
    }
}

/*
struct RecordListElement_Previews: PreviewProvider {
    static var previews: some View {
        RecordListElement(record: Record.records[3]).previewDevice(PreviewDevice(rawValue: "iPhone SE"))
    }
}*/
