type 'a queue = 
	|Null
	|Node of int * 'a queue * 'a * 'a queue
 
let empty = Null

exception Empty

let is_empty x = x = Null

let height q1 = 
	match q1 with
	|Null -> -1
	|Node(d1, _, _, _) -> d1

let min_queue q1 q2 = 
	if height q1 >= height q2 then (q2, q1)
	else (q1, q2)
	
let rec join q1 q2 = 
	match (q1, q2) with
	|Null, _ -> q2
	|_, Null -> q1
	|Node(d1, l1, x1, r1), Node(d2, l2, x2, r2) ->
			if x1 < x2 then
				let res = join r1 q2 in
					let (minim, maxim) = min_queue l1 res in 
						Node((height minim) + 1, maxim, x1, minim)
			else
				let res = join q1 r2 in
					let (minim, maxim) = min_queue l2 res in 
						Node((height minim) + 1, maxim, x2, minim)
									
let add e q = 
	join q (Node(0, Null, e, Null))
	
let delete_min q = 
	match q with 
	|Node(d, l, x, r) -> (x, join l r)
	|Null -> raise Empty
