import Foundation

public class S: Shape
{
    override init()
    {
        super.init()
        self.moved = 0;
        self.symb = "S";
        self.squares.append(Square(x: 4, y: -3));
        self.squares.append(Square(x: 4, y: -2));
        self.squares.append(Square(x: 5, y: -2));
        self.squares.append(Square(x: 5, y: -1));
    }
    
    public static func getS() -> S
    {
        return S()
    }
    
    override public func left() -> Bool
    {
        if (moved == 0)
        {
            if (squares[0].x > 0 &&
                squares[3].y < 0)
            {
                for i in 0 ..< squares.count
                {
                    squares[i].x -= 1;
                }
                return true;
            }
            else if (squares[0].x > 0 &&
                squares[3].y == 0 &&
                StartActivity.logic.getFromArray(squares[3].x - 1, squares[3].y) == " ")
            {
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x -= 1;
                }
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, symb);
                return true;
            }
            else if (squares[0].x > 0 &&
                squares[3].y == 1 &&
                StartActivity.logic.getFromArray(squares[3].x - 1, squares[3].y) == " " &&
                StartActivity.logic.getFromArray(squares[1].x - 1, squares[1].y) == " ")
            {
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, " ");
                StartActivity.logic.setInArray(squares[2].x, squares[2].y, " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x -= 1;
                }
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, symb);
                StartActivity.logic.setInArray(squares[1].x, squares[1].y, symb);
                return true;
            }
            else if (squares[0].x > 0 &&
                StartActivity.logic.getFromArray(squares[3].x - 1, squares[3].y) == " " &&
                StartActivity.logic.getFromArray(squares[1].x - 1, squares[1].y) == " " &&
                StartActivity.logic.getFromArray(squares[0].x - 1, squares[0].y) == " ")
            {
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, " ");
                StartActivity.logic.setInArray(squares[2].x, squares[2].y, " ");
                StartActivity.logic.setInArray(squares[0].x, squares[0].y, " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x -= 1;
                }
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, symb);
                StartActivity.logic.setInArray(squares[1].x, squares[1].y, symb);
                StartActivity.logic.setInArray(squares[0].x, squares[0].y, symb);
                return true;
            }
        }
        else
        {
            if (squares[0].x > 0 &&
                StartActivity.logic.getFromArray(squares[0].x - 1, squares[0].y) == " " &&
                StartActivity.logic.getFromArray(squares[2].x - 1, squares[2].y) == " ")
            {
                StartActivity.logic.setInArray(squares[1].x, squares[1].y, " ");
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x -= 1;
                }
                StartActivity.logic.setInArray(squares[0].x, squares[0].y, symb);
                StartActivity.logic.setInArray(squares[2].x, squares[2].y, symb);
                return true;
            }
        }
        return false;
    }
    
    override public func right() -> Bool
    {
        if (moved == 0)
        {
            if (squares[3].x < 9 &&
                squares[3].y == -1)
            {
                for i in 0 ..< squares.count
                {
                    squares[i].x += 1;
                }
                return true;
            }
            else if (squares[3].x < 9 &&
                squares[3].y == 0 &&
                StartActivity.logic.getFromArray(squares[3].x + 1, squares[3].y) == " ")
            {
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x += 1;
                }
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, symb);
                return true;
            }
            else if (squares[3].x < 9 &&
                squares[3].y == 1 &&
                StartActivity.logic.getFromArray(squares[3].x + 1, squares[3].y) == " " &&
                StartActivity.logic.getFromArray(squares[2].x + 1, squares[2].y) == " ")
            {
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, " ");
                StartActivity.logic.setInArray(squares[1].x, squares[1].y, " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x += 1;
                }
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, symb);
                StartActivity.logic.setInArray(squares[2].x, squares[2].y, symb);
                return true;
            }
            else if (squares[3].x < 9 &&
                StartActivity.logic.getFromArray(squares[3].x + 1, squares[3].y) == " " &&
                StartActivity.logic.getFromArray(squares[2].x + 1, squares[2].y) == " " &&
                StartActivity.logic.getFromArray(squares[0].x + 1, squares[0].y) == " ")
            {
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, " ");
                StartActivity.logic.setInArray(squares[1].x, squares[1].y, " ");
                StartActivity.logic.setInArray(squares[0].x, squares[0].y, " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x += 1;
                }
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, symb);
                StartActivity.logic.setInArray(squares[2].x, squares[2].y, symb);
                StartActivity.logic.setInArray(squares[0].x, squares[0].y, symb);
                return true;
            }
        }
        else
        {
            if (squares[3].x < 9 &&
                StartActivity.logic.getFromArray(squares[1].x + 1, squares[1].y) == " " &&
                StartActivity.logic.getFromArray(squares[3].x + 1, squares[3].y) == " ")
            {
                StartActivity.logic.setInArray(squares[0].x, squares[0].y, " ");
                StartActivity.logic.setInArray(squares[2].x, squares[2].y, " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x += 1;
                }
                StartActivity.logic.setInArray(squares[1].x, squares[1].y, symb);
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, symb);
                return true;
            }
        }
        return false;
    }
    
    override public func move() -> Bool
    {
        if (moved == 0)
        {
            if (squares[0].x > 0 &&
                squares[0].y > -1 &&
                StartActivity.logic.getFromArray(squares[1].x - 1, squares[1].y) == " " &&
                StartActivity.logic.getFromArray(squares[0].x + 1, squares[0].y) == " ")
            {
                StartActivity.logic.setInArray(squares[2].x, squares[2].y, " ");
                squares[2].x = squares[0].x;
                squares[2].y = squares[0].y;
                squares[0].x = squares[1].x - 1;
                squares[0].y = squares[1].y;
                StartActivity.logic.setInArray(squares[0].x, squares[0].y, symb);
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, " ");
                squares[3].x = squares[2].x + 1;
                squares[3].y = squares[2].y;
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, symb);
                moved = 1;
                return true;
            }
        }
        else
        {
            if (squares[2].y > -1 &&
                squares[1].y < 19 &&
                StartActivity.logic.getFromArray(squares[3].x, squares[3].y + 1) == " " &&
                StartActivity.logic.getFromArray(squares[3].x, squares[3].y + 2) == " ")
            {
                StartActivity.logic.setInArray(squares[0].x, squares[0].y, " ");
                squares[0].x = squares[2].x;
                squares[0].y = squares[2].y;
                squares[2].x = squares[3].x;
                squares[2].y = squares[3].y + 1;
                StartActivity.logic.setInArray(squares[2].x, squares[2].y, symb);
                
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, " ");
                squares[3].y += 2;
                StartActivity.logic.setInArray(squares[3].x, squares[3].y, symb);
                moved = 0;
                return true;
            }
        }
        return false;
    }
    
    override public func stepsToDown() -> Int
    {
        var count = 0;
        if (moved == 0)
        {
            for y in squares[3].y + 1 ..< Logic.height
            {
                if (squares[1].y == -2)
                {
                    var downIsEmpty = true;
                    
                    if let temp = StartActivity.logic.getLastShape() {
                        for i in 0 ..< temp.squares.count
                        {
                            if (temp.squares[i].x == 4 && temp.squares[i].y == -1) {
                                downIsEmpty = false;
                                break;
                            }
                        }
                    }
                    if (StartActivity.logic.getFromArray(squares[3].x, y) == " " && downIsEmpty)
                    {
                        count += 1;
                    }
                    else
                    {
                        return count;
                    }
                }
                else if (StartActivity.logic.getFromArray(squares[3].x, y) == " " &&
                    StartActivity.logic.getFromArray(squares[1].x, y - 1) == " ")
                {
                    count += 1;
                }
                else
                {
                    return count;
                }
            }
        }
        else
        {
            var y1 = squares[0].y
            for y in squares[0].y + 1 ..< Logic.height
            {
                if (StartActivity.logic.getFromArray(squares[0].x, y) == " " &&
                    StartActivity.logic.getFromArray(squares[1].x, y) == " " &&
                    StartActivity.logic.getFromArray(squares[3].x, y1) == " ")
                {
                    count += 1;
                }
                else
                {
                    return count;
                }
                y1 += 1;
            }
        }
        return count;
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
            if (squares[2].y > -1)
            {
                StartActivity.logic.setInArray(squares[2], " ");
            }
            for i in 0 ..< squares.count
            {
                squares[i].y += 1;
            }
            if (squares[1].y > -1)
            {
                StartActivity.logic.setInArray(squares[1], symb);
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
                if (i != 1 && squares[i].y > -1)
                {
                    StartActivity.logic.setInArray(squares[i], " ");
                }
                squares[i].y += 1;
                if (i != 2 && squares[i].y > -1)
                {
                    StartActivity.logic.setInArray(squares[i], symb);
                }
            }
            return true;
        }
    }
}
