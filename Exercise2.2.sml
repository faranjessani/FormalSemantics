fun aexp expression sigma = 
	case expression of
			Constant number		=> number
		|	Location loc			=> sigma(loc)
		| Add (a0, a1)			=> 
				let
					val v1 = (aexp a0 sigma)
					val v2 = (aexp a1 sigma)
				in
					v1 + v2
				end
		| Sub (a0, a1)	=> 
				let
					val v1 = (aexp a0 sigma)
					val v2 = (aexp a1 sigma)
				in
					v1 - v2
				end
		| Mult (a0, a1)	=> 
				let
					val v1 = (aexp a0 sigma)
					val v2 = (aexp a1 sigma)
				in
					v1 * v2
				end

fun state (loc: string) : int = 
	case loc of _ => 0

val should_be_1 = aexp (Constant 1) state
val should_be_0 = aexp (Location "Init") state
val should_be_2 = aexp (Add ((Constant 1), (Constant 1))) state
val should_be_6 = aexp (Mult ((Constant 3), (Constant 2))) state
val should_be_3 = aexp (Sub ((Constant 4), (Constant 1))) state