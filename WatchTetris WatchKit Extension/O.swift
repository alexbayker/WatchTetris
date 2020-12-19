import Foundation

public class O: Shape
{
    override init()
    {
        super.init()
        self.symb = "O";
        self.squares.append(Square(x: 4, y: -2));
        self.squares.append(Square(x: 5, y: -2));
        self.squares.append(Square(x: 4, y: -1));
        self.squares.append(Square(x: 5, y: -1));
    }
    
    public static func getO() -> O
    {
        return O()
    }
    
    override public func left() -> Bool
    {
        if (squares[0].x > 0)
        {
            if (squares[0].y == -2 &&
                squares[2].x > 0)
            {
                for i in 0 ..< squares.count
                {
                    squares[i].x -= 1;
                }
                return true;
            }
            else if (squares[0].y == -1 &&
                squares[2].x > 0 &&
                StartActivity.logic.getFromArray(squares[0].x - 1, squares[2].y) == " ")
            {
                StartActivity.logic.setInArray(squares[3], " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x -= 1;
                }
                StartActivity.logic.setInArray(squares[2], symb);
                return true;
            }
            else if (squares[0].y > -1 &&
                squares[2].y > -1 &&
                squares[2].x > 0 &&
                StartActivity.logic.getFromArray(squares[0].x - 1, squares[0].y) == " " &&
                StartActivity.logic.getFromArray(squares[2].x - 1, squares[2].y) == " ")
            {
                StartActivity.logic.setInArray(squares[1], " ");
                StartActivity.logic.setInArray(squares[3], " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x -= 1;
                }
                StartActivity.logic.setInArray(squares[0], symb);
                StartActivity.logic.setInArray(squares[2], symb);
                return true;
            }
        }
        return false;
    }
    
    override public func right() -> Bool
    {
        if (squares[1].x < 9)
        {
            if (squares[1].y == -2 &&
                squares[3].x < 9)
            {
                for i in 0 ..< squares.count
                {
                    squares[i].x += 1;
                }
                return true;
            }
            else if (squares[1].y == -1 &&
                squares[1].x < 9 &&
                StartActivity.logic.getFromArray(squares[1].x + 1, squares[3].y) == " ")
            {
                StartActivity.logic.setInArray(squares[2], " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x += 1;
                }
                StartActivity.logic.setInArray(squares[3], symb);
                return true;
            }
            else if (squares[1].y > -1 &&
                squares[3].y > -1 &&
                squares[3].x < 9 &&
                StartActivity.logic.getFromArray(squares[1].x + 1, squares[1].y) == " " &&
                StartActivity.logic.getFromArray(squares[3].x + 1, squares[3].y) == " ")
            {
                StartActivity.logic.setInArray(squares[0], " ");
                StartActivity.logic.setInArray(squares[2], " ");
                for i in 0 ..< squares.count
                {
                    squares[i].x += 1;
                }
                StartActivity.logic.setInArray(squares[1], symb);
                StartActivity.logic.setInArray(squares[3], symb);
                return true;
            }
        }
        
        return false;
    }
    
    override public func move() -> Bool
    {
        return true;
    }
    
    override public func stepsToDown() -> Int
    {
        var count = 0;
        for y in squares[2].y + 1 ..< Logic.height
        {
            for i in 0 ..< 2
            {
                if (StartActivity.logic.getFromArray(squares[2 + i].x, y) != " ")
                {
                    return count;
                }
            }
            count += 1;
        }
        return count;
    }
    
    override public func down() -> Bool
    {
        if (stepsToDown() == 0)
        {
            return false;
        }
        if (squares[0].y > -1)
        {
            StartActivity.logic.setInArray(squares[0], " ");
        }
        if (squares[1].y > -1)
        {
            StartActivity.logic.setInArray(squares[1], " ");
        }
        for square in squares
        {
            square.y += 1;
        }
        if (squares[2].y > -1)
        {
            StartActivity.logic.setInArray(squares[2], symb);
        }
        if (squares[3].y > -1)
        {
            StartActivity.logic.setInArray(squares[3], symb);
        }
        return true;
    }
}
