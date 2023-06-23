## NAME
   expression(3f) - [M_calculator] return value from a string expression
   processing messages to simplify call to CALCULATOR(3f) (LICENSE:PD)
## SYNOPSIS
```fortran
     subroutine expression(inlin0,outval,outlin0,ierr,ilen)

     character(len=*), intent=(in)  :: inlin0
     doubleprecision, intent=(out)  :: outval
     character(len=*), intent=(out) :: outlin0
     integer, intent=(out)          :: ierr
     integer, intent=(out)          :: ilen
```
## DESCRIPTION
   expression() takes a string containing a FORTRAN-like expression and
   evaluates it and returns a numeric or string value as appropriate.
   The main purpose of expression() is to assume the burden of
   displaying the calculator messages for codes that make multiple calls
   to CALCULATOR(3f). CALCULATOR(3f) does not display error messages
   directly.

   o EXPRESSION(3f) calls the calculator routine CALCULATOR
     (3f) to evaluate the expressions.
   o Messages beginning with a # are considered comments and
     are not passed on to the calculator.

## OPTIONS
   inlin0:  INLIN0 is a string containing a numeric expression. The
            expression can be up to (iclen_calc=512) characters long. The
            syntax of an expression is as described in the main document
            of the Calc library. For example:
```text
                 'A=sin(3.1416/5)'
                 '# this is a comment'
                 '$STR("The value is ",40/3)'
```

   outval:  OUTVAL is a numeric value calculated from the expression in
            INLIN0 (when IERR returns 0). When a string value is returned
            (IERR=2) then OUTVAL is the length of the output string.
   outlin0:
            OUTLIN0 contains a string representation of the number
            returned in OUTVAL up to 23 characters long when INLIN0 is a
            numeric expression. It contains a string up to
            (iclen_calc=512) characters long when INLIN0 is a string
            expression.
   ierr:  IERR returns
          o -1 if an error occurred
          o 0 if a numeric value is returned (value is in OUTVAL, string
            representation of the value is in OUTLIN2).
          o 1 if no value was returned but a message was displayed (If a
            'dump' or 'funcs' command was passed to the calculator).
          o 2 if the expression evaluated to a string value instead of a
            numeric value (value is in OUTLIN0).
   ilen:   ILEN returns the length of the input string minus trailing
           blanks.
## DEPENDENCIES
   o User-supplied routines: All programs that call the calculator
     routine can supply their own substitute_subroutine(3f) and
     substitute_C(3f) procedures. See the example program for samples.
## EXAMPLES
   Sample program:
```fortran
    program demo_expression
    use M_calculator,      only : iclen_calc
    use M_calculator, only : expression
    character(len=iclen_calc) ::  outlin0
    doubleprecision :: outval
    call expression('A=3.4**5    ',outval,outlin0,ierr,ilen)
    write(*,*)'value of expression is ',outval
    write(*,*)'string representation of value is ',trim(outlin0)
    write(*,*)'error flag value is ',ierr
    write(*,*)'length of expression is ',ilen
    end program demo_expression
```
Results:
```text
    value of expression is    454.35424000000000
    string representation of value is 454.35424
    error flag value is            0
    length of expression is            8
```
## SEE ALSO
   See also: RNUM0(),CALCULATOR(),INUM0(),SNUM0()
