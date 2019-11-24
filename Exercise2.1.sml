datatype numbers = N of int
datatype tv = true | false
datatype location = Loc of string
datatype exp = Constant of numbers
						 | Loc of location
						 | Add of exp * exp
						 | Sub of exp * exp
						 | Mult of exp * exp
datatype bexp = Constant of tv
              | Equals of bexp * bexp
              | LTE of bexp * bexp
              | Negate of bexp
              | And of bexp * bexp
              | Or of bexp * bexp
datatype command = Skip
                 | Assign of location * exp
                 | Collate of command * command
                 | Cond of bexp * command * command
                 | While of bexp * command