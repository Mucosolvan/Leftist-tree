type 'a queue
(** Type of priority queue *)

val empty : 'a queue
(** Empty priority queue *)

val add : 'a -> 'a queue -> 'a queue 
(** [add e q] returns queue created by adding [e] to [q] *)

exception Empty
(** Exception raised by [delete_min] when the queue is empty *)

val delete_min : 'a queue -> 'a * 'a queue
(** For non-empty [q], [delete_min q] returns pair [(e,q')] in which [e]
    is minimum element in [q] and [q'] is [q] with [e] removed.
    If [q] is empty raises Exception [Empty]. *)

val join : 'a queue -> 'a queue -> 'a queue
(** [join q1 q2] returns [q1] and [q2] merged *) 

val is_empty : 'a queue -> bool
(** Returns [true] if queue is empty. If not - returns [false] *)

