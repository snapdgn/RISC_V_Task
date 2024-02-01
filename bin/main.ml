(*Define some basic instructions, for now ADD & SUB*)
type instruction =
  | ADD of int * int
  | SUB of int * int

(* Setting Up the Interpreter *)
let rec interpret_program program state =
  match program with
  | [] -> state
  | instr :: rest ->
      let updated_state =
        match instr with
        | ADD (reg1, reg2) -> state + reg1 + reg2
        | SUB (reg1, reg2) -> state - reg1 - reg2
      in
      interpret_program rest updated_state

(* a test program, NOTE: More tests are included at the bottom*)
let example_program = [
  ADD (1, 2);
  SUB (3, 1);
  ADD (5, 5);
]

let start_state = 0

(* Getting and printing the result *)
let () =
  let result = interpret_program example_program start_state in
  print_endline ("Result: " ^ string_of_int result)

(* Unit Testing *)
(* I've used the OUnit2 for testing *)
(* https://cs3110.github.io/textbook/chapters/data/ounit.html *)

open OUnit2

let test_interpret_program _ =
  let program = [ADD (1, 2); SUB (3, 1); ADD (5, 5)] in
  let state = interpret_program program 0 in
  assert_equal ~printer:string_of_int 9 state

let test_empty_program _ =
  let program = [] in
  let state = interpret_program program 0 in
  assert_equal ~printer:string_of_int 0 state

let test_negative_numbers _ =
  let program = [SUB (2, 5); ADD (-3, 7)] in
  let state = interpret_program program 10 in
  assert_equal ~printer:string_of_int 7 state

let test_large_numbers _ =
  let program = [ADD (1000000, 2000000)] in
  let state = interpret_program program 0 in
  assert_equal ~printer:string_of_int 3000000 state

let suite =
  "suite" >::: [
    "test_interpret_program" >:: test_interpret_program;
    "test_empty_program" >:: test_empty_program;
    "test_negative_numbers" >:: test_negative_numbers;
    "test_large_numbers" >:: test_large_numbers;
  ]

let () = run_test_tt_main suite
