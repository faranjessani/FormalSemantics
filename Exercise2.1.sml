datatype aexp = Constant of int
						 | Location of string
						 | Add of aexp * aexp
						 | Sub of aexp * aexp
						 | Mult of aexp * aexp
datatype bexp = True
              | False
              | Equals of bexp * bexp
              | LTE of aexp * aexp
              | Negate of bexp
              | And of bexp * bexp
              | Or of bexp * bexp
datatype cexp = Skip
               | Assign of aexp * aexp
               | Collate of cexp * cexp
               | If of bexp * cexp * cexp
               | While of bexp * cexp
