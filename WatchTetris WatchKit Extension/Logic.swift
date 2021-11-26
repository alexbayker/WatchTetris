import Foundation
import Combine
import SwiftUI

public class Logic: ObservableObject
{
    //public var publisher = PassthroughSubject<Void, Never>()
    
    public static let height       = 20;
    public static let width        = 10;
    public static let previewwidth = 4;
    public static let startspeed   = 700;
    
    @Published public var fallen: Shape;
    
    @Published public var preview: Shape;
    
    @Published private var timing: Int;
    @Published public var pause = false;
    @Published public var score: Int;
    @Published public var running = false;
    @Published public var lose = false {
        willSet {
            StartActivity.publisher.send(("lose", self.score))
        }
    }
    @Published private var array: [[Character]];
    @Published private var previewarray: [[Character]];
    
    private var first = true
    
    @Published private var shapes: [Shape];
    @Published public var level = 1;
    
    public var lock: NSLock;
    
    init()
    {
        self.timing = Logic.startspeed;
        self.score = 0;
        self.array =   Array(repeating: Array(repeating: " ", count: Logic.height), count: Logic.width);
        self.previewarray = Array(repeating: Array(repeating: " ", count: Logic.previewwidth), count: Logic.previewwidth);
        self.shapes = [Shape]();
        self.fallen = Logic.generateNewFigure();
        self.preview = Logic.generateNewFigure();
        self.lock = NSLock();
        
        self.generatePreviewArray();
        self.shapes.append(self.fallen);
    }
    
    public static func getLogic() -> Logic
    {
        return Logic();
    }
    
    public func printobj()
    {
        for i in 0 ..< Logic.height
        {
            for j in 0 ..< Logic.width
            {
                print("'\(array[j][i])'", terminator: " ");
            }
            print("\n");
        }
        print("Done!");
    }
    
    public func clear()
    {
        self.timing = 80;
        self.score = 0;
        self.array = Array(repeating: Array(repeating: " ", count: Logic.height), count: Logic.width);
        self.shapes = [Shape]();
        self.fallen = Logic.generateNewFigure();
        self.shapes.append(fallen);
    }
    
    public func haveProgress() -> Bool
    {
        if (self.score > 0 || self.level > 1)
        {
            return true
        }
        for i in 0 ..< array.count
        {
            for j in 0 ..< array[i].count
            {
                if (array[i][j] != " ")
                {
                    return true
                }
            }
        }
        return false
    }
    
    public func getpause() -> Bool
    {
        return self.pause;
    }
    
    public func setpause(_ pause: Bool)
    {
        self.pause = pause;
    }
    
    public func pausetoggle()
    {
        self.pause = !self.pause
    }
    
    public func lockobj()
    {
        self.lock.lock()
    }
    
    public func unlockobj()
    {
        self.lock.unlock()
    }
    
    public func getRunning() -> Bool
    {
        return self.running
    }
    
    public func setRunning(_ value: Bool)
    {
        self.running = value;
    }
    
    public func getLastShape() -> Shape?
    {
        return (shapes.count == 1) ? nil : shapes[shapes.count - 2]
    }
    
    public func getFromPreview(_ x: Int, _ y: Int) -> Character
    {
        if x > -1 && y > -1 && x < Logic.previewwidth && y < Logic.previewwidth
        {
            return self.previewarray[x][y];
        }
        return " "
    }
    
    public func getFromArray(_ x: Int, _ y: Int) -> Character
    {
        if x > -1 && y > -1 && x < Logic.width && y < Logic.height
        {
            return self.array[x][y];
        }
        return " "
    }
    
    public func setInArray(_ x: Int, _ y: Int, _ symb: Character)
    {
        self.array[x][y] = symb;
    }
    
    public func setInArray(_ s: Square, _ symb: Character)
    {
        self.setInArray(s.x, s.y, symb)
    }
    
    public func run()
    {
        var downanswer = true
        if (!self.getRunning())
        {
            DispatchQueue.main.sync {
                self.setRunning(true)
            }
            
            while (!lose)
            {
                repeat {
                    while (pause) {
                        usleep(100_000);
                    }
                    if (!first)
                    {
                        usleep(useconds_t(self.timing * 1000));
                    }
                    else
                    {
                        first = false
                    }
                    
                    DispatchQueue.main.sync {
                        
                        self.lock.lock()
                        var del: Bool;
                        for x in 0 ..< Logic.width
                        {
                            for y in 0 ..< Logic.height
                            {
                                self.setInArray(x, y, " ");
                            }
                        }
                        
                        //print("Count: \(StartActivity.logic.shapes.count)")
                        for temp in self.shapes {
                            //print("I: \(i)")
                            del = true;
                            for j in 0 ..< temp.squares.count {
                                if ((temp.squares[j].x < Logic.width) && (temp.squares[j].y < Logic.height) && (temp.squares[j].x > -1) && (temp.squares[j].y > -1)) {
                                    del = false;
                                    self.setInArray(temp.squares[j], temp.symb);
                                }
                            }
                            if (del && (!temp.equals(two: self.fallen))) {
                                self.shapes.removeAll{ $0.equals(two: temp) };
                            }
                        }
                        self.lock.unlock()
                        downanswer = self.fallen.down()
                    }
                }
                while (downanswer);
                DispatchQueue.main.sync {
                    self.lock.lock()
                    self.checkFullLine();
                    DispatchQueue.global(qos: .background).async {
                        usleep(100_000)
                        DispatchQueue.main.async {
                            self.checkFullLine()
                        }
                    }
                    var has100 = false
                    for square in self.fallen.squares
                    {
                        if (square.y == 100)
                        {
                            has100 = true
                            break
                        }
                    }
                    if !has100 && self.checkLose()
                    {
                        self.lose = true;
                    }
                    else
                    {
                        self.fallen = self.preview;
                        self.preview = Logic.generateNewFigure();
                        self.generatePreviewArray()
                        self.shapes.append(self.fallen);
                    }
                    
                    self.lock.unlock()
                }
            }
            DispatchQueue.main.sync {
                self.setRunning(false)
            }
        }
        //catch
        //{
            //print("ERROR IN LOGIC THREAD: \(error)")
        //}
    }
    
    public func generatePreviewArray()
    {
        for x in 0 ..< Logic.previewwidth
        {
            for y in 0 ..< Logic.previewwidth
            {
                self.previewarray[x][y] = " "
            }
        }
        
        for square in preview.squares
        {
            self.previewarray[square.x - 3][square.y + 4] = self.preview.symb;
        }
    }
    
    private static func generateNewFigure() -> Shape
    {
        switch (Int.random(in: 0...6))
        {
            case (0) : return I.getI();
            case (1) : return O.getO()
            case (2) : return S.getS();
            case (3) : return Z.getZ();
            case (4) : return T.getT();
            case (5) : return J.getJ();
            default  : return L.getL()
        }
    }
    
    private func checkLose() -> Bool
    {
        if self.fallen.stepsToDown() == 0
        {
            for s in self.fallen.squares
            {
                if s.x < 0 || s.y < 0
                {
                    return true
                }
            }
        }
        
        return false
    }
    
    private func checkFullLine()
    {
        var count = 0;
        var oneline: Bool;
        
        for var y in (0 ..< Logic.height).reversed()
        {
            oneline = true;
            for x in 0 ..< Logic.width
            {
                if (array[x][y] == " ")
                {
                    oneline = false;
                    break;
                }
            }
            if (oneline)
            {
                count += 1;
            }
            if (!oneline && count > 0)
            {
                for y1 in (count ... (y + count)).reversed()
                {
                    for x1 in 0 ..< Logic.width
                    {
                        array[x1][y1] = array[x1][y1 - count];
                    }
                }
                var i = 0;
                for y1 in (0 ... (y + count)).reversed()
                {
                    for x in 0 ..< Logic.width
                    {
                        for s in shapes
                        {
                            for sq in s.squares
                            {
                                if (sq.x == x && sq.y == y1)
                                {
                                    sq.y = 100;
                                }
                            }
                        }
                    }
                    i += 1;
                    if (i == count)
                    {
                        break;
                    }
                }
                for y1 in (0...y).reversed()
                {
                    for x in 0 ..< Logic.width
                    {
                        for s in shapes
                        {
                            for sq in s.squares
                            {
                                if (sq.x == x && sq.y == y1)
                                {
                                    sq.y = sq.y + count;
                                }
                            }
                        }
                    }
                }
                for c in 0 ..< count
                {
                    for x in 0 ..< Logic.width
                    {
                        array[x][c] = " ";
                    }
                }
                y += count
                score += count * 100;
                score += 1;
                if ((score > 1000 && level == 1)
                    || (score > 2000 && level == 2)
                    || (score > 3000 && level == 3)
                    || (score > 4000 && level == 4)
                    || (score > 5000 && level == 5)
                    || (score > 6000 && level == 6)
                    || (score > 7000 && level == 7)
                    || (score > 8000 && level == 8)
                    || (score > 9000 && level == 9)
                    || (score > 10000 && level == 10)
                    || (score > 11000 && level == 11)
                    || (score > 12000 && level == 12)
                    || (score > 13000 && level == 13)
                    || (score > 14000 && level == 14))
                {
                    level += 1;
                    if timing >= 50
                    {
                        timing -= 50;
                    }
                }
                score -= 1;
                //GUI.setScoreInTitle(score, level);
                count = 0;
            }
        }
    }
    
    public static func replaceAll(_ string: String, _ pattern: String, _ template: String) -> String
    {
        do
        {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            return regex.stringByReplacingMatches(in: string, options: [], range: NSMakeRange(0, string.count), withTemplate: template)
        }
        catch
        {
            print("Ошибка парсинга регулярного выражения replaceAll(): \(error)")
        }
        return string;
    }
}
