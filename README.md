# midris
New syntax for Idris

## Examples
### Idris
```idris
main : Eff () STDIO
main = putStrLn "Hello world"
```
### Midris
```
def main is eff none stdio:
    put "Hello world"
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
        0 then return r
        1 + l' then rematch l' (1 + r)
```
### Idris
```idris
data Maybe : (a : Type) -> Type where
    Nothing : Maybe a
    Just : (x : a) -> Maybe a
```
### Midris
```
data Maybe is Type:
    param any is Type
    atom Nothing is Maybe any
    atom Just is Maybe any:
        param x is any
```
