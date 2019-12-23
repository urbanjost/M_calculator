# M_calculator

## parse mathematical expressions

The M_calculator(3f) module contains A basic expression parser and
related convenience routines.

Expressions are similar to Fortran77 syntax except powers are processed
from left to right, and string variable names start with a dollar-sign,
and all numeric values are assumed to be DOUBLEPRECISION.

Note that although suitable for many uses, this is not a byte-code
interpreter and is designed for parsing basic unique expressions, not
for high volume repetition of the computations on a large volume of data.

    git clone https://github.com/urbanjost/M_calculator.git
    cd M_calculator/src
    # change Makefile if not using gfortran(1)
    make

This will compile the M_calculator module and build all the example programs from
the document pages in the PROGRAMS/ sub-directory.
