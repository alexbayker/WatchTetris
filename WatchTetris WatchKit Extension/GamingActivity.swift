import SwiftUI
import Combine

struct GamingActivity: View {
    
    public static let fontsize: CGFloat = 14;
    public static let paddingbutton: CGFloat = 3;
    public static let buttonborder: CGFloat = 1;
    
    public static let publisher = PassthroughSubject<(String, Any), Never>()
    
    @EnvironmentObject var logic: Logic
    
    @State var needchange = false
    
    @State var scrollamount = 0.0
    @State var oldamount = 0.0
    @State var olddate = currentTimeInMiliseconds()
    
    public static func currentTimeInMiliseconds() -> Int64 {
        let currentDate = Date()
        let since1970 = currentDate.timeIntervalSince1970
        return Int64(since1970 * 1000)
    }
    
    var body: some View {
        
        DispatchQueue.main.async {
            //print("SELF AMOUNT: \(self.scrollamount) \(abs(self.scrollamount - self.oldamount))")
            if abs(self.scrollamount - self.oldamount) > 10 && abs(GamingActivity.currentTimeInMiliseconds() - self.olddate) > 10
            {
                if self.scrollamount > self.oldamount
                {
                    self.right()
                }
                else if self.scrollamount < self.oldamount
                {
                    self.left()
                }
                self.oldamount = self.scrollamount
            }
        }
        
        return ZStack (alignment: .center) {
            VStack (alignment: .center, spacing: 0)
            {
                VStack (alignment: .center, spacing: 0)
                {
                    HStack(alignment: .center, spacing: 0)
                    {
                        if StartActivity.hassafearea
                        {
                            Spacer()
                        }
                        
                        HStack(spacing: 0) {
                            ForEach (0 ..< Logic.width) { i in
                                VStack(spacing: 0) {
                                    ForEach (0 ..< Logic.height) { j in
                                        Rectangle().fill(self.getColorByChar(self.logic.getFromArray(i, j))).frame(width: self.getSizeSquare(StartActivity.screenwidth, StartActivity.screenheight), height: self.getSizeSquare(StartActivity.screenwidth, StartActivity.screenheight)).border(self.logic.pause ? Color.gray : Color.blue, width: 1)
                                    }
                                }
                            }
                        }.frame(width: CGFloat(Logic.width) * self.getSizeSquare(StartActivity.screenwidth, StartActivity.screenheight), height: CGFloat(Logic.height) * self.getSizeSquare(StartActivity.screenwidth, StartActivity.screenheight)).background(Color.black).border(self.logic.pause ? Color.gray : Color.blue, width: 1).focusable(true).digitalCrownRotation(self.$scrollamount/*, from: 0, through: 1, isHapticFeedbackEnabled: true*/).onTapGesture {
                            self.pause()
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 0)
                        {
                            Spacer()
                            
                            Text("Level:").foregroundColor(MyColor.bazanetredcolor).font(.system(size: GamingActivity.fontsize, design: .default)).lineLimit(1)
                            
                            Text("\(self.logic.level)").foregroundColor(MyColor.bazanetredcolor).font(.system(size: GamingActivity.fontsize, weight: .heavy, design: .default)).lineLimit(1)
                            
                            Text("Score:").foregroundColor(MyColor.vipstatusgoldcolor).font(.system(size: GamingActivity.fontsize, design: .default)).lineLimit(1)
                            
                            Text("\(self.logic.score)").foregroundColor(MyColor.vipstatusgoldcolor).font(.system(size: GamingActivity.fontsize, weight: .heavy, design: .default)).lineLimit(1)
                            
                            Spacer()
                            
                            HStack(spacing: 0) {
                                ForEach (0 ..< Logic.previewwidth) { i in
                                    VStack(spacing: 0) {
                                        ForEach (0 ..< Logic.previewwidth) { j in
                                            Rectangle().fill(self.getColorByChar(self.logic.getFromPreview(i, j))).frame(width: self.getSizeSquare(StartActivity.screenwidth, StartActivity.screenheight), height: self.getSizeSquare(StartActivity.screenwidth, StartActivity.screenheight)).border(Color.blue, width: 1).onTapGesture { }
                                        }
                                    }
                                }
                            }.frame(width: 4 * self.getSizeSquare(StartActivity.screenwidth, StartActivity.screenheight), height: 4 * self.getSizeSquare(StartActivity.screenwidth, StartActivity.screenheight)).background(Color.black).border(Color.blue, width: 1)
                            
                            VStack (alignment: .center)
                            {
                                /*Button(action: {
                                    self.pause()
                                }){
                                    Image(systemName: StartActivity.logic.pause ? "play.fill" : "pause.fill").resizable().padding(GamingActivity.paddingbutton).overlay(
                                        Circle().stroke(StartActivity.logic.pause ? Color.yellow : Color.green, lineWidth: GamingActivity.buttonborder)
                                    ).frame(width: self.getSizeButton(StartActivity.screenwidth), height: self.getSizeButton(StartActivity.screenwidth)).foregroundColor(StartActivity.logic.pause ? Color.yellow : Color.green)
                                }
                                
                                Spacer()*/
                                
                                Spacer()
                                
                                Button(action: {
                                    self.move()
                                }){
                                    Image(systemName: "arrow.2.circlepath").resizable().padding(GamingActivity.paddingbutton).overlay(Circle().stroke(Color.white, lineWidth: GamingActivity.buttonborder))
                                }.frame(width: self.getSizeButton(StartActivity.screenwidth), height: self.getSizeButton(StartActivity.screenwidth)).foregroundColor(Color.white)
                                
                                Spacer()
                                
                                /*HStack() {
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        self.left()
                                    }){
                                        Image(systemName: "arrow.left").resizable().padding(GamingActivity.paddingbutton).overlay(Circle().stroke(Color.white, lineWidth: GamingActivity.buttonborder))
                                    }.frame(width: self.getSizeButton(StartActivity.screenwidth), height: self.getSizeButton(StartActivity.screenwidth)).foregroundColor(Color.white)
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        self.right()
                                    }){
                                        Image(systemName: "arrow.right").resizable().padding(GamingActivity.paddingbutton).overlay(Circle().stroke(Color.white, lineWidth: GamingActivity.buttonborder))
                                    }.frame(width: self.getSizeButton(StartActivity.screenwidth), height: self.getSizeButton(StartActivity.screenwidth)).foregroundColor(Color.white)
                                    
                                    Spacer()
                                }*/
                                
                                Button(action: {
                                    self.down()
                                }){
                                    Image(systemName: "arrow.down").resizable().padding(GamingActivity.paddingbutton).overlay(Circle().stroke(Color.white, lineWidth: GamingActivity.buttonborder))
                                }.frame(width: self.getSizeButton(StartActivity.screenwidth), height: self.getSizeButton(StartActivity.screenwidth)).foregroundColor(Color.white)
                                
                                Spacer()
                            }.buttonStyle(PlainButtonStyle())
                        }
                        
                        Spacer()
                    }
                }.frame(height: StartActivity.screenheight)
                
            }.onReceive(GamingActivity.publisher) { (name, object) in
                if name == "change"
                {
                    self.needchange.toggle()
                }
            }
            
            /*VStack {
                Spacer().frame(height: StartActivity.getStatusBarHeight())
                
                HStack {
                    Button(action: {
                        StartActivity.logic.setpause(true)
                        StartActivity.publisher.send(("screen", Screens.startscreen))
                    }){
                        Image(systemName: "chevron.left").foregroundColor(.black).imageScale(.large).padding([.top, .leading], GamingActivity.paddingbutton)
                    }.buttonStyle(PlainButtonStyle()).frame(width: self.getSizeButton(StartActivity.screenwidth), height: self.getSizeButton(StartActivity.screenwidth))
                    
                    Spacer()
                }
                
                Spacer()
            }*/
        }.frame(width: StartActivity.screenwidth, height: StartActivity.screenheight).onAppear {
            DispatchQueue.global(qos: .userInteractive).async {
                if (!self.logic.getRunning())
                {
                    StartActivity.logic.run()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    func getSizeButton(_ widthcontainer: CGFloat) -> CGFloat
    {
        return widthcontainer * 1/8
    }
    
    func getSizeSquare(_ widthcontainer: CGFloat, _ heightcontainer: CGFloat) -> CGFloat
    {
        return heightcontainer * 1/20
    }
    
    func getRandomColor() -> Character
    {
        switch (Int.random(in: 0...6)) {
        case (0) : return "I";
        case (1) : return "O";
        case (2) : return "S";
        case (3) : return "Z";
        case (4) : return "T";
        case (5) : return "J";
        default  : return " ";
        }
    }
    
    func getColorByChar(_ arg: Character) -> Color
    {
        switch (String(arg))
        {
        case "I": return MyColor.bazanetmaincolor
        case "O": return Color.yellow
        case "S": return Color.green
        case "Z": return Color.red
        case "T": return MyColor.tcolor
        case "L": return Color.orange
        case "J": return MyColor.tarifsbluebackground
        default:  return Color.black
        }
    }
    
    func pause() {
        DispatchQueue.global(qos: .userInteractive).async {
            DispatchQueue.main.sync {
                self.logic.lockobj()
                self.logic.pausetoggle()
                self.logic.unlockobj()
            }
        }
    }
    
    func move() {
        DispatchQueue.global(qos: .userInteractive).async {
            DispatchQueue.main.sync {
                self.logic.lockobj()
                if (!self.logic.getpause())
                {
                    let _ = self.logic.fallen.move()
                }
                else
                {
                    self.logic.setpause(false)
                }
                self.logic.unlockobj()
            }
        }
    }
    
    func left() {
        DispatchQueue.global(qos: .userInteractive).async {
            DispatchQueue.main.sync {
                WKInterfaceDevice().play(.click)
                
                self.logic.lockobj()
                if (!self.logic.getpause())
                {
                    let _ = self.logic.fallen.left()
                }
                else
                {
                    self.logic.setpause(false)
                }
                self.logic.unlockobj()
            }
        }
    }
    
    func right() {
        DispatchQueue.global(qos: .userInteractive).async {
            DispatchQueue.main.sync {
                WKInterfaceDevice().play(.click)
                self.logic.lockobj()
                if (!self.logic.getpause())
                {
                    let _ = self.logic.fallen.right()
                }
                else
                {
                    self.logic.setpause(false)
                }
                self.logic.unlockobj()
            }
        }
    }
    
    func down() {
        DispatchQueue.global(qos: .userInteractive).async {
            DispatchQueue.main.sync {
                self.logic.lockobj()
                if (!self.logic.getpause())
                {
                    if (self.logic.fallen.stepsToDown() > 1)
                    {
                        for _ in 0 ..< self.logic.fallen.stepsToDown() - 1
                        {
                            let _ = self.logic.fallen.down()
                        }
                    }
                    else
                    {
                        let _ = self.logic.fallen.down()
                    }
                }
                else
                {
                    self.logic.setpause(false)
                }
                self.logic.unlockobj()
            }
        }
    }
}

#if DEBUG
struct GamingActivity_Previews: PreviewProvider {
    static var previews: some View {
        GamingActivity().environmentObject(Logic())
    }
}
#endif
