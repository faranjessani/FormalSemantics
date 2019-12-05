fun eval expression sigma = 
	case expression of
			Constant number		=> number
		|	Location loc			=> sigma(loc)
		| Add (a0, a1)			=> 
				let
					val (N v1) = (eval a0 sigma)
					val (N v2) = (eval a1 sigma)
				in
					N (v1 + v2)
				end
		| Sub (a0, a1)	=> 
				let
					val (N v1) = (eval a0 sigma)
					val (N v2) = (eval a1 sigma)
				in
					N (v1 - v2)
				end
		| Mult (a0, a1)	=> 
				let
					val (N v1) = (eval a0 sigma)
					val (N v2) = (eval a1 sigma)
				in
					N (v1 * v2)
				end


fun state loc = 
	case loc of
			_ 	 => (N 0)

val should_be_1 = eval (Constant(N 1)) state
val should_be_0 = eval (Location (Loc "Init")) state
val should_be_2 = eval (Add ((Constant (N 1)), (Constant (N 1)))) state
val should_be_6 = eval (Mult ((Constant (N 3)), (Constant (N 2)))) state
val should_be_3 = eval (Sub ((Constant (N 4)), (Constant (N 1)))) state