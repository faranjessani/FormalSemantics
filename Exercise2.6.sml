fun bexp expr state = 
	case expr of
		True => True
	|	False => False
	|	Equals (b0, b1) => 
			let
				val v1 = bexp b0 state
				val v2 = bexp b1 state
			in
				if v1 = v2 then True else False
			end
	|	LTE (a0, a1) =>
			let
				val v1 = aexp a0 state
				val v2 = aexp a1 state
			in
					if v1 <= v2 then True else False
			end
	| Negate b0 =>
		let
			val v1 = bexp b0 state
		in
			if v1 = True then False else True
		end
	| And (b0, b1) => 
			let
				val v1 = bexp b0 state
			in
				if v1 = False 
				then False 
				else 
					let
						val v2 = bexp b1 state
					in
						if v2 = False then False else True
					end
			end
	| Or (b0, b1) => 
			let
				val v1 = bexp b0 state
			in
				if v1 = True 
				then True 
				else 
					let
						val v2 = bexp b1 state
					in
						if v2 = True then True else False
					end
			end

fun cexp expr state =
	case expr of
		Skip => state
	| Assign (Location l0 : a, a0 : a) => 
		let 
			fun new_state (loc: string) : int = 
				if loc = l0 
				then aexp a0 state
				else state(loc)
		in
			new_state
		end

val bexp_True = bexp True state
val bexp_Equals_True = bexp (Equals (False, False)) state
val bexp_False = bexp False state
val bexp_Equals_False = bexp (Equals (True, False)) state
val bexp_LTE_True = bexp (LTE ((Constant 1), (Constant 2))) state
val bexp_Negate_True = bexp (Negate False) state
val bexp_Negate_False = bexp (Negate True) state
val bexp_And_True = bexp (And (True, True)) state
val bexp_And_False = bexp (And (False, True)) state
val bexp_Or_True = bexp (Or (False, True)) state
val bexp_Or_False = bexp (Or (False, False)) state
val new_state = cexp (Assign ((Location "a"), (Constant 3))) state
val skip = cexp Skip state
val state1 = state
val assign_and_get = aexp (Location "a") new_state
val assign_and_get2 = aexp (Location "c") new_state
