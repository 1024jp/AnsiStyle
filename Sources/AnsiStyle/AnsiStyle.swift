//
//  AnsiStyle.swift
//
//
//  Created by 1024jp on 2021-08-30.
//
//  ---------------------------------------------------------------------------
//
//  The MIT License (MIT)
//
//  © 2021 1024jp
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

public extension StringProtocol {
    
    /// Style the receiver by surrounding it with ANSI escape sequences.
    ///
    /// - Parameter style: Attributes to style.
    /// - Returns: A string with ANSI escape sequences.
    func ansiStyled(_ style: String.AnsiStyle) -> String {
        
        guard !style.isEmpty else { return String(self) }
        
        return style.escapeSequence + self + String.AnsiStyle.reset.escapeSequence
    }
    
}


public extension String {
    
    /// Ansi style types.
    struct AnsiStyle: OptionSet {
        
        public let rawValue: Int
        
        public static let bold      = Self(rawValue: 1 << 0)
        public static let thin      = Self(rawValue: 1 << 1)
        public static let italic    = Self(rawValue: 1 << 2)
        public static let underline = Self(rawValue: 1 << 3)
        public static let blink     = Self(rawValue: 1 << 4)
        public static let inverse   = Self(rawValue: 1 << 5)
        
        public static let black     = Self(rawValue: 1 << 7)
        public static let red       = Self(rawValue: 1 << 8)
        public static let green     = Self(rawValue: 1 << 9)
        public static let yellow    = Self(rawValue: 1 << 10)
        public static let blue      = Self(rawValue: 1 << 11)
        public static let magenta   = Self(rawValue: 1 << 12)
        public static let cyan      = Self(rawValue: 1 << 13)
        public static let white     = Self(rawValue: 1 << 14)
        
        
        public init(rawValue: Int) {
            
            self.rawValue = rawValue
        }
        
    }
    
}



// MARK: Private

private extension String.AnsiStyle {
    
    static let reset: Self = []
    
    
    var escapeSequence: String {
        
        "\u{001B}[" + self.codes.map(String.init).joined(separator: ";") + "m"
    }
    
    
    private var codes: [Int] {
        
        if self == .reset { return [0] }
        
        var codes: [Int] = []
        
        if self.contains(.bold)      { codes.append(1) }
        if self.contains(.thin)      { codes.append(2) }
        if self.contains(.italic)    { codes.append(3) }
        if self.contains(.underline) { codes.append(4) }
        if self.contains(.blink)     { codes.append(5) }
        if self.contains(.inverse)   { codes.append(7) }
        
        if self.contains(.black)     { codes.append(30) }
        if self.contains(.red)       { codes.append(31) }
        if self.contains(.green)     { codes.append(32) }
        if self.contains(.yellow)    { codes.append(33) }
        if self.contains(.blue)      { codes.append(34) }
        if self.contains(.magenta)   { codes.append(35) }
        if self.contains(.cyan)      { codes.append(36) }
        if self.contains(.white)     { codes.append(37) }
        
        return codes
    }
    
}
