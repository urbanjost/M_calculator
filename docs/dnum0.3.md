## NAME
   dnum0(3f) - [M_calculator] return double precision value from string
   expression using calculator(3f) (LICENSE:PD)
## SYNOPSIS
```fortran
     doubleprecision function dnum0(inline,ierr)

     character(len=*),intent(in) :: inline
     integer,optional,intent(out) :: ierr
```
## DESCRIPTION
   DNUM0(3f) is used to return a DOUBLEPRECISION value from a CHARACTER
   string representing a numeric expression.

   o If an error occurs in evaluating the expression INUM(3f)
     returns zero(0).
   o DNUM0(3f) ultimately uses the calculator routine CALCULATOR(3f)

## OPTIONS
   inline:  INLINE is a CHARACTER variable up to (iclen_calc=255)
            characters long that is similar to a FORTRAN 77 numeric
            expression.
   ierr:    error code. If zero, no error occurred
## EXAMPLES
   Sample Program
```fortran
   program demo_dnum0
   use M_calculator, only : dnum0
   doubleprecision x,y,z
   X=DNUM0('20/3.4')
   Y=DNUM0('CI = 10 * sin(3.1416/4)')
   Z=DNUM0('CI')
   write(*,*)x,y,z
   end program demo_dnum0
```
## SEE ALSO
   o The syntax of an expression is as described in the main
     documentation of the Calculator Library.
   o See EXPRESSION(3f), CALCULATOR(3f), RNUM0(3f), SNUM0(3f).
