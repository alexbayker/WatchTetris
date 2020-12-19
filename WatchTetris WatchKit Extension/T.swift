import Foundation

public class T: Shape
{
    override init()
    {
        super.init()
        self.moved = 0;
        self.symb = "T";
        self.squares.append(Square(x: 5, y: -3));
        self.squares.append(Square(x: 4, y: -2));
        self.squares.append(Square(x: 5, y: -2));
        self.squares.append(Square(x: 5, y: -1));
    }
    
    public static func getT() -> T
    {
        return T();
    }
    
    override public func left() -> Bool
    {
        if (moved == 0)
        {
            if (squares[3].y < 0 &&
                squares[1].x > 0)
            {
                for i in 0 ..< squares.count
                {
                    squares[i].x -= 1;
                }
                return true;
            }
            else if (squares[3].y == 0 &&
                squares[1].x > 0 &&
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
                squares[1].x > 0 &&
                StartActivity.logic.getFromArray(squares[1].x - 1, squares[1].y) == " " &&
                StartActivity.logic.getFromArray(squares[3].x - 1, squares[3].y) == " ")
            {
                StartActivity.logic.setInArray(squares[2], " ");
                StartActivity.logic.setInArray(squares[3], " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x -= 1;
                }
                StartActivity.logic.setInArray(squares[1], symb);
                StartActivity.logic.setInArray(squares[3], symb);
                return true;
            }
            else if (squares[1].x > 0 &&
                StartActivity.logic.getFromArray(squares[0].x - 1, squares[0].y) == " " &&
                StartActivity.logic.getFromArray(squares[1].x - 1, squares[1].y) == " " &&
                StartActivity.logic.getFromArray(squares[3].x - 1, squares[3].y) == " ")
            {
                StartActivity.logic.setInArray(squares[0], " ");
                StartActivity.logic.setInArray(squares[2], " ");
                StartActivity.logic.setInArray(squares[3], " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x -= 1;
                }
                StartActivity.logic.setInArray(squares[0], symb);
                StartActivity.logic.setInArray(squares[1], symb);
                StartActivity.logic.setInArray(squares[3], symb);
                return true;
            }
        }
        else if (moved == 1)
        {
            if (squares[0].x > 0 &&
                StartActivity.logic.getFromArray(squares[0].x - 1, squares[0].y) == " " &&
                StartActivity.logic.getFromArray(squares[1].x - 1, squares[1].y) == " ")
            {
                StartActivity.logic.setInArray(squares[3], " ");
                StartActivity.logic.setInArray(squares[1], " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x -= 1;
                }
                StartActivity.logic.setInArray(squares[0], symb);
                StartActivity.logic.setInArray(squares[1], symb);
                return true;
            }
        }
        else if (moved == 2)
        {
            if (squares[3].x > 0 &&
                StartActivity.logic.getFromArray(squares[0].x - 1, squares[0].y) == " " &&
                StartActivity.logic.getFromArray(squares[2].x - 1, squares[2].y) == " " &&
                StartActivity.logic.getFromArray(squares[3].x - 1, squares[3].y) == " ")
            {
                StartActivity.logic.setInArray(squares[0], " ");
                StartActivity.logic.setInArray(squares[1], " ");
                StartActivity.logic.setInArray(squares[3], " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x -= 1;
                }
                StartActivity.logic.setInArray(squares[0], symb);
                StartActivity.logic.setInArray(squares[2], symb);
                StartActivity.logic.setInArray(squares[3], symb);
                return true;
            }
        }
        else
        {
            if (squares[3].x > 0 &&
                StartActivity.logic.getFromArray(squares[3].x - 1, squares[3].y) == " " &&
                StartActivity.logic.getFromArray(squares[1].x - 1, squares[1].y) == " ")
            {
                StartActivity.logic.setInArray(squares[0], " ");
                StartActivity.logic.setInArray(squares[1], " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x -= 1;
                }
                StartActivity.logic.setInArray(squares[1], symb);
                StartActivity.logic.setInArray(squares[3], symb);
                return true;
            }
        }
        return false;
    }
    
    override public func right() -> Bool
    {
        if (moved == 0)
        {
            if (squares[3].y < 0 &&
                squares[0].x < 9)
            {
                for i in 0 ..< squares.count
                {
                    squares[i].x += 1;
                }
                return true;
            }
            else if (squares[1].y == -1 &&
                squares[0].x < 9 &&
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
            else if (squares[0].y == -1 &&
                squares[0].x < 9 &&
                StartActivity.logic.getFromArray(squares[2].x + 1, squares[2].y) == " " &&
                StartActivity.logic.getFromArray(squares[3].x + 1, squares[3].y) == " ")
            {
                StartActivity.logic.setInArray(squares[1], " ");
                StartActivity.logic.setInArray(squares[3], " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x += 1;
                }
                StartActivity.logic.setInArray(squares[2], symb);
                StartActivity.logic.setInArray(squares[3], symb);
                return true;
            }
            else if (squares[0].x < 9 &&
                StartActivity.logic.getFromArray(squares[0].x + 1, squares[0].y) == " " &&
                StartActivity.logic.getFromArray(squares[2].x + 1, squares[2].y) == " " &&
                StartActivity.logic.getFromArray(squares[3].x + 1, squares[3].y) == " ")
            {
                StartActivity.logic.setInArray(squares[0], " ");
                StartActivity.logic.setInArray(squares[1], " ");
                StartActivity.logic.setInArray(squares[3], " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x += 1;
                }
                StartActivity.logic.setInArray(squares[0], symb);
                StartActivity.logic.setInArray(squares[2], symb);
                StartActivity.logic.setInArray(squares[3], symb);
                return true;
            }
        }
        else if (moved == 1)
        {
            if (squares[3].x < 9 &&
                StartActivity.logic.getFromArray(squares[3].x + 1, squares[3].y) == " " &&
                StartActivity.logic.getFromArray(squares[1].x + 1, squares[1].y) == " ")
            {
                StartActivity.logic.setInArray(squares[0], " ");
                StartActivity.logic.setInArray(squares[1], " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x += 1;
                }
                StartActivity.logic.setInArray(squares[1], symb);
                StartActivity.logic.setInArray(squares[3], symb);
                return true;
            }
        }
        else if (moved == 2)
        {
            if (squares[1].x < 9 &&
                StartActivity.logic.getFromArray(squares[0].x + 1, squares[0].y) == " " &&
                StartActivity.logic.getFromArray(squares[1].x + 1, squares[1].y) == " " &&
                StartActivity.logic.getFromArray(squares[3].x + 1, squares[3].y) == " ")
            {
                StartActivity.logic.setInArray(squares[0], " ");
                StartActivity.logic.setInArray(squares[2], " ");
                StartActivity.logic.setInArray(squares[3], " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x += 1;
                }
                StartActivity.logic.setInArray(squares[0], symb);
                StartActivity.logic.setInArray(squares[1], symb);
                StartActivity.logic.setInArray(squares[3], symb);
                return true;
            }
        }
        else
        {
            if (squares[0].x < 9 &&
                StartActivity.logic.getFromArray(squares[0].x + 1, squares[0].y) == " " &&
                StartActivity.logic.getFromArray(squares[1].x + 1, squares[1].y) == " ")
            {
                StartActivity.logic.setInArray(squares[3], " ");
                StartActivity.logic.setInArray(squares[1], " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x += 1;
                }
                StartActivity.logic.setInArray(squares[0], symb);
                StartActivity.logic.setInArray(squares[1], symb);
                return true;
            }
        }
        return false;
    }
    
    override public func move() -> Bool
    {
        if (moved == 0)
        {
            if (squares[0].y > -1 &&
                squares[0].x < 9 &&
                StartActivity.logic.getFromArray(squares[2].x + 1, squares[2].y) == " ")
            {
                StartActivity.logic.setInArray(squares[0], " ");
                squares[0].x = squares[1].x;
                squares[0].y = squares[1].y;
                squares[1].x = squares[3].x;
                squares[1].y = squares[3].y;
                squares[3].x = squares[2].x + 1;
                squares[3].y = squares[2].y;
                StartActivity.logic.setInArray(squares[3], symb);
                moved = 1;
                return true;
            }
        }
        else if (moved == 1)
        {
            if (squares[0].y > 0 &&
                StartActivity.logic.getFromArray(squares[2].x, squares[2].y - 1) == " ")
            {
                StartActivity.logic.setInArray(squares[0], " ");
                squares[0].x = squares[1].x;
                squares[0].y = squares[1].y;
                squares[1].x = squares[3].x;
                squares[1].y = squares[3].y;
                squares[3].x = squares[2].x;
                squares[3].y = squares[2].y - 1;
                StartActivity.logic.setInArray(squares[3], symb);
                moved = 2;
                return true;
            }
        }
        else if (moved == 2)
        {
            if (squares[0].x > 0 &&
                StartActivity.logic.getFromArray(squares[2].x - 1, squares[2].y) == " ")
            {
                StartActivity.logic.setInArray(squares[0], " ");
                squares[0].x = squares[1].x;
                squares[0].y = squares[1].y;
                squares[1].x = squares[3].x;
                squares[1].y = squares[3].y;
                squares[3].x = squares[2].x - 1;
                squares[3].y = squares[2].y;
                StartActivity.logic.setInArray(squares[3], symb);
                moved = 3;
                return true;
            }
        }
        else
        {
            if (squares[2].y < 19 &&
                StartActivity.logic.getFromArray(squares[2].x, squares[2].y + 1) == " ")
            {
                StartActivity.logic.setInArray(squares[0], " ");
                squares[0].x = squares[1].x;
                squares[0].y = squares[1].y;
                squares[1].x = squares[3].x;
                squares[1].y = squares[3].y;
                squares[3].x = squares[2].x;
                squares[3].y = squares[2].y + 1;
                StartActivity.logic.setInArray(squares[3], symb);
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
            var y = squares[1].y + 1
            for y1 in squares[3].y + 1 ..< Logic.height
            {
                if (squares[1].y == -2)
                {
                    var downIsEmpty = true;
                    
                    if let temp = StartActivity.logic.getLastShape()
                    {
                        for i in 0 ..< squares.count
                        {
                            if (temp.squares[i].x == 4 && temp.squares[i].y == -1)
                            {
                                downIsEmpty = false;
                                break;
                            }
                        }
                    }
                    if (StartActivity.logic.getFromArray(squares[3].x, y1) == " " && downIsEmpty)
                    {
                        count += 1;
                    }
                    else
                    {
                        return count;
                    }
                }
                else if (StartActivity.logic.getFromArray(squares[1].x, y) == " " &&
                    StartActivity.logic.getFromArray(squares[3].x, y1) == " ")
                {
                    count += 1;
                }
                else
                {
                    return count;
                }
                y += 1
            }
        }
        else if (moved == 1)
        {
            var y = squares[0].y + 1
            for y1 in squares[1].y + 1 ..< Logic.height
            {
                if (StartActivity.logic.getFromArray(squares[0].x, y) == " " &&
                    StartActivity.logic.getFromArray(squares[1].x, y1) == " " &&
                    StartActivity.logic.getFromArray(squares[3].x, y) == " ")
                {
                    count += 1;
                }
                else
                {
                    return count;
                }
                y += 1
            }
        }
        else if (moved == 2)
        {
            var y1 = squares[1].y + 1
            for y in squares[0].y + 1 ..< Logic.height
            {
                if (StartActivity.logic.getFromArray(squares[0].x, y) == " " &&
                    StartActivity.logic.getFromArray(squares[1].x, y1) == " ")
                {
                    count += 1;
                }
                else
                {
                    return count;
                }
                y1 += 1
            }
        }
        else
        {
            for y in squares[2].y + 1 ..< Logic.height
            {
                if (StartActivity.logic.getFromArray(squares[0].x, y) == " " &&
                    StartActivity.logic.getFromArray(squares[2].x, y) == " " &&
                    StartActivity.logic.getFromArray(squares[3].x, y) == " ")
                {
                    count += 1;
                }
                else
                {
                    return count;
                }
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
        if (moved == 0)
        {
            if (squares[0].y > -1)
            {
                StartActivity.logic.setInArray(squares[0], " ");
            }
            if (squares[1].y > -1)
            {
                StartActivity.logic.setInArray(squares[1], " ");
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
        else if (moved == 1)
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
        else if (moved == 2)
        {
            if (squares[1].y > -1)
            {
                StartActivity.logic.setInArray(squares[1], " ");
            }
            if (squares[3].y > -1)
            {
                StartActivity.logic.setInArray(squares[3], " ");
            }
            for i in 0 ..< squares.count
            {
                squares[i].y += 1;
            }
            if (squares[1].y > -1)
            {
                StartActivity.logic.setInArray(squares[1], symb);
            }
            if (squares[0].y > -1)
            {
                StartActivity.logic.setInArray(squares[0], symb);
            }
            return true;
        }
        else
        {
            for i in 0 ..< squares.count
            {
                if (i != 2 && squares[i].y > -1)
                {
                    StartActivity.logic.setInArray(squares[i], " ");
                }
                squares[i].y += 1;
                if (i != 1 && squares[i].y > -1)
                {
                    StartActivity.logic.setInArray(squares[i], symb);
                }
            }
            return true;
        }
    }
}
