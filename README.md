# midris
New syntax for Idris

Examples
------------------------------

module Main

main : IO ()
main = putStrLn "Hello world"
------------------------------
module Main

def main is IO Void:
    print "Hello world"
