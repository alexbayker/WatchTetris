import SwiftUI
import Combine

struct StartActivity: View {
    
    public static let publisher = PassthroughSubject<(String, Any), Never>()
    
    public static let screenwidth  = WKInterfaceDevice.current().screenBounds.width;
    public static let screenheight = WKInterfaceDevice.current().screenBounds.height - StartActivity.getStatusBarHeight();
    public static let hassafearea  = StartActivity.hasSafeArea()
    
    public static var logic = Logic()
    @State private var lose = false;
    @State private var numberofscreen = Screens.startscreen;
    @State private var lastscore = 0;
    
    @State private var winnername = ""
    
    var body: some View {
        
        let drag = DragGesture().onEnded {
            if abs($0.translation.width) > 100 && self.numberofscreen != Screens.startscreen
            {
                if (self.numberofscreen == Screens.gamingscreen)
                {
                    StartActivity.logic.setpause(true)
                }
                StartActivity.publisher.send(("screen", Screens.startscreen))
            }
        }
        
        return ZStack (alignment: .center) {
            LinearGradient(gradient: Gradient(colors: [.black, .blue]), startPoint: .topTrailing, endPoint: .bottomLeading).edgesIgnoringSafeArea(.all)
                
                VStack (alignment: .center, spacing: 0) {
                    
                    Spacer().frame(height: StartActivity.getStatusBarHeight())
                    
                    if self.numberofscreen == Screens.startscreen {
                        
                        VStack(alignment: .center)
                        {
                        ScrollView(.vertical, showsIndicators: false)
                        {
                            VStack (alignment: .center, spacing: 10)
                            {
                                Spacer()
                                
                                if (StartActivity.logic.haveProgress()) {
                                    Button(action: {
                                        self.numberofscreen = Screens.gamingscreen
                                    }){
                                        Text("Resume Game").foregroundColor(MyColor.vipstatusgoldcolor)
                                    }.frame(width: StartActivity.screenwidth * 2/3).overlay(RoundedRectangle(cornerRadius: 10).stroke(MyColor.vipstatusgoldcolor, lineWidth: 4)).shadow(color: MyColor.vipstatusgoldcolor, radius: 10, x: 10, y: 10)
                                }
                                
                                Button (action: {
                                    StartActivity.logic = Logic()
                                    self.numberofscreen = Screens.gamingscreen
                                }){
                                    Text("Start Game").foregroundColor(Color.black)
                                }.frame(width: StartActivity.screenwidth * 2/3).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 4)).shadow(color: Color.black, radius: 10, x: 10, y: 10)
                                
                                Button(action: {
                                    self.numberofscreen = Screens.recordsscreen
                                }){
                                    Text("Records")
                                        .foregroundColor(Color.black)
                                }.frame(width: StartActivity.screenwidth * 2/3).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 4)).shadow(color: Color.black, radius: 10, x: 10, y: 10)
                                
                                Spacer()
                            }.font(.system(size: CGFloat(10))).lineLimit(1).frame(width: StartActivity.screenwidth, height: StartActivity.screenheight)
                        }
                        }.frame(width: StartActivity.screenwidth, height: StartActivity.screenheight)
                    }
                    else if self.numberofscreen == Screens.gamingscreen
                    {
                        GamingActivity().environmentObject(StartActivity.logic)
                    }
                    else if self.numberofscreen == Screens.recordsscreen
                    {
                        RecordList()
                    }
                    
                    if !StartActivity.hassafearea
                    {
                        Spacer()
                    }
                }
            
        }.gesture(drag).navigationBarBackButtonHidden(true).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).onReceive(StartActivity.publisher) { (name, object) in
            if name == "lose", let score = object as? Int
            {
                self.lose = true
                self.lastscore = score
                StartActivity.logic = Logic()
                self.numberofscreen = Screens.startscreen
            }
            else if name == "screen", let number = object as? Screens
            {
                self.numberofscreen = number
            }
        }.sheet(isPresented: self.$lose)
        {
            return ZStack {
                LinearGradient(gradient: Gradient(colors: [.black, .red]), startPoint: .topTrailing, endPoint: .bottomLeading).edgesIgnoringSafeArea(.all)
                VStack(alignment: .center) {
                    Group {
                        Spacer()
                        
                        Spacer()
                    }
                    
                    Group {
                        Text("Game Over!")
                        
                        Spacer()
                        
                        Text("Your Score: \(self.lastscore)")
                        
                        Spacer()
                        
                    }.foregroundColor(MyColor.vipstatusgoldcolor).font(.system(size: GamingActivity.fontsize, weight: .heavy, design: .default)).lineLimit(1)
                    
                    Group {
                        TextField("Your name", text: self.$winnername, onCommit: {
                            let _ = self.saveRecord()
                        }).multilineTextAlignment(.center).background(MyColor.halftransparentwhitecolor).cornerRadius(5).padding(.horizontal, 16)
                        
                        Spacer()
                        
                        Button(action: {
                            let _ = self.saveRecord()
                        }){
                            Text("Save your score!").padding(.horizontal, 8).padding(.vertical, 4).background(MyColor.vipstatusgoldcolor).foregroundColor(.white).cornerRadius(5)
                        }.buttonStyle(PlainButtonStyle())
                    }.foregroundColor(.white).font(.system(size: GamingActivity.fontsize, design: .default)).lineLimit(1)
                    
                    Group {
                        Spacer()
                        
                        Spacer()
                    }
                }
            }.onAppear {
                if let name = UserDefaults.standard.string(forKey: Record.mynamerecourcename)
                {
                    self.winnername = name
                }
            }.font(.system(size: CGFloat(10))).lineLimit(1).offset(y: 0).animation(.spring())
        }
    }
    
    private func saveRecord() -> Bool
    {
        if (self.winnername.count > 0)
        {
            Record.addRecord(Record(name: self.winnername, score: self.lastscore, date: Record.dateformatinbackup.string(from: Date()), now: true))
            StartActivity.publisher.send(("screen", Screens.recordsscreen))
            self.lose.toggle()
            return true
        }
        return false
    }
    
    public static func getStatusBarHeight() -> CGFloat
    {
        let screenwidth  = WKInterfaceDevice.current().screenBounds.width;
        let screenheight = WKInterfaceDevice.current().screenBounds.height;
        if screenwidth == 184.0 && screenheight == 224.0
        {
            //44
            return 31.0
        }
        else if screenwidth == 156.0 && screenheight == 195.0
        {
            //42
            return 21.0
        }
        else if screenwidth == 162.0 && screenheight == 197.0
        {
            //40
            return 28.0
        }
        else if screenwidth == 136.0 && screenheight == 170.0
        {
            //38
            return 19.0
        }
        return 0;
    }
    
    public static func hasSafeArea() -> Bool
    {
        let screenwidth  = WKInterfaceDevice.current().screenBounds.width;
        let screenheight = WKInterfaceDevice.current().screenBounds.height;
        if (screenwidth == 184.0 && screenheight == 224.0) || (screenwidth == 162.0 && screenheight == 197.0)
        {
            return true
        }
        return false
    }
    
    public static func getStringModel() -> String
    {
        let model = StartActivity.getCodeModel()
        switch model {
        case "Watch1,1":
            return "Apple Watch 28mm"
        case "Watch1,2":
            return "Apple Watch 42mm"
        case "Watch2,3":
            return "Apple Watch Series 2 38mm"
        case "Watch2,4":
            return "Apple Watch Series 2 42mmm"
        case "Watch2,6":
            return "Apple Watch Series 1 38mm"
        case "Watch2,7":
            return "Apple Watch Series 1 42mm"
        case "Watch3,1":
            return "Apple Watch Series 3 38mm Cellular"
        case "Watch3,2":
            return "Apple Watch Series 3 42mm Cellular"
        case "Watch3,3":
            return "Apple Watch Series 3 38mm"
        case "Watch3,4":
            return "Apple Watch Series 3 42mm"
        case "Watch4,1":
            return "Apple Watch Series 4 40mm"
        case "Watch4,2":
            return "Apple Watch Series 4 44mm"
        case "Watch4,3":
            return "Apple Watch Series 4 40mm Cellular"
        case "Watch4,4":
            return "Apple Watch Series 4 44mm Cellular"
        case "Watch5,1":
            return "Apple Watch Series 5 40mm"
        case "Watch5,2":
            return "Apple Watch Series 5 44mm"
        case "Watch5,3":
            return "Apple Watch Series 5 40mm Cellular"
        case "Watch5,4":
            return "Apple Watch Series 5 44mm Cellular"
        case "Watch5,9":
            return "Apple Watch Series SE 40mm"
        case "Watch5,10":
            return "Apple Watch Series SE 44mm"
        case "Watch5,11":
            return "Apple Watch Series SE 40mm Cellular"
        case "Watch5,12":
            return "Apple Watch Series SE 44mm Cellular"
        case "Watch6,1":
            return "Apple Watch Series 6 40mm"
        case "Watch6,2":
            return "Apple Watch Series 6 44mm"
        case "Watch6,3":
            return "Apple Watch Series 6 40mm Cellular"
        case "Watch6,4":
            return "Apple Watch Series 6 44mm Cellular"
        default:
            return "unknown"
        }
    }
    
    public static func getCodeModel() -> String
    {
        var size: size_t = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = CChar()
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        return String(cString: &machine, encoding: String.Encoding.utf8) ?? ""
    }
}

public enum Screens: Int
{
    case startscreen = 1
    case gamingscreen = 2
    case recordsscreen = 3
}

#if DEBUG
struct StartActivity_Previews: PreviewProvider {
    static var previews: some View {
        Group
        {
            StartActivity().previewDevice(PreviewDevice(rawValue: "Apple Watch Series 3 - 42mm"))
            
            StartActivity().previewDevice(PreviewDevice(rawValue: "Apple Watch Series 3 - 38mm"))
        }
    }
}
#endif
