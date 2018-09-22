# midris
New syntax for Idris

## Examples
### Idris
```idris
main : IO ()
main = putStrLn "Hello world"
```
### Midris
```
def main is IO Void:
    print "Hello world"
```
### Idris
```idris
add : (l, r : Nat) -> Nat
add Z r = r
add (S l) r = add l (S r)
```
### Midris
```
def add is Nat:
    param l, r is Nat
    match l:
        Z then return r
        1 + l' then rematch l' (1 + r)
```
