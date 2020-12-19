import Foundation

public class Shape
{
    var squares: [Square] = [Square]();
    var symb: Character = " ";
    var moved: Int = -1;

    public func down() -> Bool
    {
        preconditionFailure("This method must be overridden")
    }

    public func right() -> Bool
    {
        preconditionFailure("This method must be overridden")
    }

    public func left() -> Bool
    {
        preconditionFailure("This method must be overridden")
    }

    public func move() -> Bool
    {
        preconditionFailure("This method must be overridden")
    }

    public func stepsToDown() -> Int
    {
        preconditionFailure("This method must be overridden")
    }
    
    public func equals(two: Shape) -> Bool
    {
        for (number, _) in squares.enumerated()
        {
            if (self.squares[number].x != two.squares[number].x
                || self.squares[number].y != two.squares[number].y)
            {
                return false
            }
        }
        return true
    }

    public func printobj()
    {
        print("moved = \(self.moved)");
        for (i, square) in squares.enumerated()
        {
            print("\(i): x - \(square.x), y - \(square.y)");
        }
    }
}
