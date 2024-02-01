# Coding Task-1 for RISC-V lfx Sailing Downstream Project

This is the coding challenge specified by the lfx sailing downstream project.

This OCaml program defines a very simple interpreter for a basic ISA represented by the `instruction` type.
The instructions include addition (ADD) and subtraction (SUB) operations on integer registers. 
The interpreter processes a sequence of instructions and updates the program state accordingly.

# Dev-Environment

Uses [nix](https://github.com/NixOS/nix) a functional package manager, to set up the development environment.

To get started:

### Clone the project:
```
git clone https://github.com/snapdgn/RISC_V_Task
```
### Setup Development Environment:

```nix
nix develop
```
# Build and Run

Uses [dune](https://github.com/ocaml/dune) as build tool.

- To build:
```sh
dune build
```
then run the executable manually from the `_build` dir.

or use ```dune exec RISV_V_Task``` to build and run directly.