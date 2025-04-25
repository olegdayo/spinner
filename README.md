# Spinner

## Info

Spinner is a script that make your life easier when using Spin/Promela stack

## Installation

Clone the repo somewhere, we will use `${HOME}` as an example:

```sh
git clone https://github.com/olegdayo/spinner.git
```

Source contents of spinner.sh to your favourite shell, we will use bash as an example:

```sh
source ${HOME}/spinner/spinner.sh # Add the code to `.bashrc`
```

Don't forget to update your terminal session, you can do it simply executing the shell itself:

```sh
bash
```

## Commands

### LTL

Check LTLs in Promela program

`ltl <path-to-file> <ltl-1> ... <ltl-n>`

First argument - path to a Promela file

Other arguments - list of LTLs

## Examples

### LTL

Command:

```sh
ltl examples/example.pml p1 p2 p3 p4 p5 p6
```

Output:

```
Processing file examples/example.pml

> Checking LTL p1
> LTL p1 is correct: failed to find a counter example; state-vector bytes: 28, depth: 0, errors: 0

> Checking LTL p2
> LTL p2 is incorrect: found a counter example; state-vector bytes: 28, depth: 0, errors: 1

> Checking LTL p3
> LTL p3 is correct: failed to find a counter example; state-vector bytes: 28, depth: 2, errors: 0

> Checking LTL p4
> LTL p4 is correct: failed to find a counter example; state-vector bytes: 28, depth: 2, errors: 0

> Checking LTL p5
> LTL p5 is incorrect: found a counter example; state-vector bytes: 28, depth: 6, errors: 1

> Checking LTL p6
> LTL p6 is incorrect: found a counter example; state-vector bytes: 28, depth: 7, errors: 1
```
