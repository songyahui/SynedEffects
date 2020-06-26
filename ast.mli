

type state = One | Zero 
type signal = (string * state)
type var = string
type name = string

(*signal set*)
type ss = signal list * signal list 
(*前面的是constrain， 后面的是signal*)

type es = Bot 
        | Emp 
        | Instance of ss 
        | Or of es * es 
        | Con of es * es
        | Kleene of es

type terms = Var of var   
           | Number of int 
           | Plus of terms * terms (*n+1*)
           | Minus of terms * terms     

type pure = TRUE
          | FALSE
          | Gt of terms * terms
          | Lt of terms * terms
          | GtEq of terms * terms
          | LtEq of terms * terms
          | Eq of terms * terms
          | PureOr of pure * pure
          | PureAnd of pure * pure
          | Neg of pure


type effect = (pure * es) list  

type prog = Nothing 
          | Pause 
          | Seq of prog * prog 
          | Par of prog * prog
          | Loop of prog
          | Declear of var * prog
          | Emit of var
          | Present of var * prog * prog
          | Trap of name * prog
          | Exit of name