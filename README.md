# AnsiStyle

A small library to style strings for the standard output.


## Examples

```swift
import AnsiStyle

print("moof!".ansiStyled([.bold, .underline, .green]))
// -> \u{001B}[1;4;32mmoof!\u{001B}[0m
```
