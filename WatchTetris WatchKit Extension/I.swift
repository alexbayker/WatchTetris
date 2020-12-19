import Foundation

public class I: Shape
{
    override init()
    {
        super.init()
        self.moved = 0;
        self.symb = "I";
        var j = -4
        for _ in 0 ..< 4
        {
            self.squares.append(Square(x: 4, y: j));
            j += 1
        }
    }
    
    public static func getI() -> I {
        return I();
    }
    
    override public func left() -> Bool
    {
        if (moved == 1)
        {
            if (squares[0].x > 0 &&
                StartActivity.logic.getFromArray(squares[0].x - 1, squares[0].y) == " ")
            {
                StartActivity.logic.setInArray(squares[3], " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x -= 1;
                }
                StartActivity.logic.setInArray(squares[0], symb);
                return true;
            }
            return false;
        }
        else {
            if (squares[0].x > 0)
            {
                if (squares[3].y == -1)
                {
                    for i in 0 ..< squares.count
                    {
                        squares[i].x -= 1;
                    }
                    return true;
                }
                else if (squares[3].y == 0 &&
                    StartActivity.logic.getFromArray(squares[3].x - 1, squares[3].y) == " ")
                {
                    StartActivity.logic.setInArray(squares[3], " ");
                    for i in 0 ..< squares.count
                    {
                        squares[i].x -= 1;
                    }
                    StartActivity.logic.setInArray(squares[3], symb);
                    return true;
                }
                else if (squares[3].y == 1 &&
                    StartActivity.logic.getFromArray(squares[2].x - 1, squares[2].y) == " " &&
                    StartActivity.logic.getFromArray(squares[3].x - 1, squares[3].y) == " ")
                {
                    StartActivity.logic.setInArray(squares[3], " ");
                    StartActivity.logic.setInArray(squares[2], " ");
                    for i in 0 ..< squares.count
                    {
                        squares[i].x -= 1;
                    }
                    StartActivity.logic.setInArray(squares[2], symb);
                    StartActivity.logic.setInArray(squares[3], symb);
                    return true;
                }
                else if (squares[3].y == 2 &&
                    StartActivity.logic.getFromArray(squares[1].x - 1, squares[1].y) == " " &&
                    StartActivity.logic.getFromArray(squares[2].x - 1, squares[2].y) == " " &&
                    StartActivity.logic.getFromArray(squares[3].x - 1, squares[3].y) == " ")
                {
                    StartActivity.logic.setInArray(squares[3], " ");
                    StartActivity.logic.setInArray(squares[2], " ");
                    StartActivity.logic.setInArray(squares[1], " ");
                    for i in 0 ..< squares.count
                    {
                        squares[i].x -= 1;
                    }
                    StartActivity.logic.setInArray(squares[1], symb);
                    StartActivity.logic.setInArray(squares[2], symb);
                    StartActivity.logic.setInArray(squares[3], symb);
                    return true;
                }
                else if (StartActivity.logic.getFromArray(squares[0].x - 1, squares[0].y) == " " &&
                    StartActivity.logic.getFromArray(squares[1].x - 1, squares[1].y) == " " &&
                    StartActivity.logic.getFromArray(squares[2].x - 1, squares[2].y) == " " &&
                    StartActivity.logic.getFromArray(squares[3].x - 1, squares[3].y) == " ")
                {
                    StartActivity.logic.setInArray(squares[3], " ");
                    StartActivity.logic.setInArray(squares[2], " ");
                    StartActivity.logic.setInArray(squares[1], " ");
                    StartActivity.logic.setInArray(squares[0], " ");
                    for i in 0 ..< squares.count
                    {
                        squares[i].x -= 1;
                    }
                    StartActivity.logic.setInArray(squares[0], symb);
                    StartActivity.logic.setInArray(squares[1], symb);
                    StartActivity.logic.setInArray(squares[2], symb);
                    StartActivity.logic.setInArray(squares[3], symb);
                    return true;
                }
            }
            return false;
        }
    }
    
    override public func right() -> Bool
    {
        if (moved == 1)
        {
            if (squares[3].x < 9 &&
                StartActivity.logic.getFromArray(squares[3].x + 1, squares[3].y) == " ")
            {
                StartActivity.logic.setInArray(squares[0], " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x += 1;
                }
                StartActivity.logic.setInArray(squares[3], symb);
                return true;
            }
            return false;
        }
        else {
            if (squares[3].x < 9)
            {
                if (squares[3].y == -1)
                {
                    for i in 0 ..< squares.count
                    {
                        squares[i].x += 1;
                    }
                    return true;
                }
                else if (squares[3].y == 0 &&
                    StartActivity.logic.getFromArray(squares[3].x + 1, squares[3].y) == " ")
                {
                    StartActivity.logic.setInArray(squares[3], " ");
                    for i in 0 ..< squares.count
                    {
                        squares[i].x += 1;
                    }
                    StartActivity.logic.setInArray(squares[3], symb);
                    return true;
                }
                else if (squares[3].y == 1 &&
                    StartActivity.logic.getFromArray(squares[2].x + 1, squares[2].y) == " " &&
                    StartActivity.logic.getFromArray(squares[3].x + 1, squares[3].y) == " ")
                {
                    StartActivity.logic.setInArray(squares[3], " ");
                    StartActivity.logic.setInArray(squares[2], " ");
                    for i in 0 ..< squares.count
                    {
                        squares[i].x += 1;
                    }
                    StartActivity.logic.setInArray(squares[2], symb);
                    StartActivity.logic.setInArray(squares[3], symb);
                    return true;
                }
                else if (squares[3].y == 2 &&
                    StartActivity.logic.getFromArray(squares[1].x + 1, squares[1].y) == " " &&
                    StartActivity.logic.getFromArray(squares[2].x + 1, squares[2].y) == " " &&
                    StartActivity.logic.getFromArray(squares[3].x + 1, squares[3].y) == " ")
                {
                    StartActivity.logic.setInArray(squares[3], " ");
                    StartActivity.logic.setInArray(squares[2], " ");
                    StartActivity.logic.setInArray(squares[1], " ");
                    for i in 0 ..< squares.count
                    {
                        squares[i].x += 1;
                    }
                    StartActivity.logic.setInArray(squares[1], symb);
                    StartActivity.logic.setInArray(squares[2], symb);
                    StartActivity.logic.setInArray(squares[3], symb);
                    return true;
                }
                else if (StartActivity.logic.getFromArray(squares[0].x + 1, squares[0].y) == " " &&
                    StartActivity.logic.getFromArray(squares[1].x + 1, squares[1].y) == " " &&
                    StartActivity.logic.getFromArray(squares[2].x + 1, squares[2].y) == " " &&
                    StartActivity.logic.getFromArray(squares[3].x + 1, squares[3].y) == " ")
                {
                    StartActivity.logic.setInArray(squares[3], " ");
                    StartActivity.logic.setInArray(squares[2], " ");
                    StartActivity.logic.setInArray(squares[1], " ");
                    StartActivity.logic.setInArray(squares[0], " ");
                    for i in 0 ..< squares.count
                    {
                        squares[i].x += 1;
                    }
                    StartActivity.logic.setInArray(squares[0], symb);
                    StartActivity.logic.setInArray(squares[1], symb);
                    StartActivity.logic.setInArray(squares[2], symb);
                    StartActivity.logic.setInArray(squares[3], symb);
                    return true;
                }
                
            }
            return false;
        }
    }
    
    override public func move() -> Bool
    {
        if (moved == 1)
        {
            if (squares[0].y - 2 > -1 &&
                squares[0].y + 1 < Logic.height &&
                StartActivity.logic.getFromArray(squares[1].x, squares[1].y - 2) == " " &&
                StartActivity.logic.getFromArray(squares[1].x, squares[1].y - 1) == " " &&
                StartActivity.logic.getFromArray(squares[1].x, squares[1].y + 1) == " ") {
                StartActivity.logic.setInArray(squares[0].x, squares[0].y, " ");
                squares[0].x += 1;
                squares[0].y -= 2;
                StartActivity.logic.setInArray(squares[0].x, squares[0].y, symb);
                StartActivity.logic.setInArray(squares[2].x, squares[2].y, " ");
                squares[2].x -= 1;
                squares[2].y -= 1;
                StartActivity.logic.setInArray(squares[2].x, squares[2].y, symb);
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, " ");
                squares[3].y += 1;
                squares[3].x -= 2;
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, symb);
                let temp = squares[1].y;
                squares[1].y = squares[2].y;
                squares[2].y = temp;
                moved = 0;
                return true;
            }
        }
        else
        {
            if (squares[0].y > -1 &&
                squares[2].x - 1 > -1 &&
                squares[2].x + 2 < Logic.width &&
                StartActivity.logic.getFromArray(squares[2].x - 1, squares[2].y) == " " &&
                StartActivity.logic.getFromArray(squares[2].x + 1, squares[2].y) == " " &&
                StartActivity.logic.getFromArray(squares[2].x + 2, squares[2].y) == " ")
            {
                StartActivity.logic.setInArray(squares[0].x, squares[0].y, " ");
                squares[0].x -= 1;
                squares[0].y += 2;
                StartActivity.logic.setInArray(squares[0].x, squares[0].y, symb);
                StartActivity.logic.setInArray(squares[1].x, squares[1].y, " ");
                squares[1].x += 1;
                squares[1].y += 1;
                StartActivity.logic.setInArray(squares[1].x, squares[1].y, symb);
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, " ");
                squares[3].y -= 1;
                squares[3].x += 2;
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, symb);
                let temp = squares[1].x;
                squares[1].x = squares[2].x;
                squares[2].x = temp;
                moved = 1;
                return true;
            }
        }
        return false;
    }
    
    override public func stepsToDown() -> Int
    {
        if (moved == 0)
        {
            var count = 0;
            for y in squares[3].y + 1 ..< Logic.height
            {
                if (StartActivity.logic.getFromArray(squares[0].x, y) == " ") {
                    count += 1;
                }
                else
                {
                    return count;
                }
            }
            return count;
            
        }
        else
        {
            var count = 0;
            for y in squares[2].y + 1 ..< Logic.height
            {
                for i in 0 ..< squares.count
                {
                    if (StartActivity.logic.getFromArray(squares[i].x, y) != " ")
                    {
                        return count;
                    }
                }
                count += 1;
            }
            return count;
        }
    }
    
    override public func down() -> Bool
    {
        if (stepsToDown() == 0)
        {
            return false;
        }
        if (moved == 0) {
            if (squares[0].y > -1)
            {
                StartActivity.logic.setInArray(squares[0], " ");
            }
            for i in 0 ..< squares.count
            {
                squares[i].y += 1;
            }
            if (squares[3].y > -1)
            {
                StartActivity.logic.setInArray(squares[3], symb);
            }
            return true;
        }
        else
        {
            for i in 0 ..< squares.count
            {
                if (squares[i].y > 0)
                {
                    StartActivity.logic.setInArray(squares[i], " ");
                }
                squares[i].y += 1;
                if (squares[i].y > 0)
                {
                    StartActivity.logic.setInArray(squares[i], symb);
                }
            }
            return true;
        }
    }
}
