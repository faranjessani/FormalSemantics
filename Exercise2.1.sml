datatype a = Constant of int
						 | Location of string
						 | Add of a * a
						 | Sub of a * a
						 | Mult of a * a
datatype b = True
              | False
              | Equals of b * b
              | LTE of a * a
              | Negate of b
              | And of b * b
              | Or of b * b
datatype c = Skip
               | Assign of a * a
               | Collate of c * c
               | If of b * c * c
               | While of b * c
