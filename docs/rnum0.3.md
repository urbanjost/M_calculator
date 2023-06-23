## NAME
   rnum0(3f) - [M_calculator] returns real number from string expression
   using CALCULATOR(3f) (LICENSE:PD)
## SYNOPSIS
```fortran
    real function rnum0(inline)

    character(len=*), intent=(in) :: inline
    integer,intent(out),optional  :: ierr
```
## DESCRIPTION
    RNUM0() is used to return a REAL value from a CHARACTER string
    representing a numeric expression. It uses the M_calculator(3fp)
    module.
## OPTIONS
   inline:  INLINE is a CHARACTER variable up to (iclen_calc=512)
            characters long that is similar to a FORTRAN 77 numeric
            expression.
   ierr:    error code. If zero, no error occurred
## DEPENDENCIES
   User-supplied routines: 
   All programs that call the calculator routine can supply their own
   substitute_subroutine(3f) and substitute_C(3f) procedures. See the
   example program for samples.
## EXAMPLES
   Sample program
```fortran
    program demo_rnum0
    use M_calculator, only : rnum0
    x=rnum0('20/3.4')
    y=rnum0('CI = 10 * sin(3.1416/4)')
    z=rnum0('CI')
    write(*,*)x,y,z
    end program demo_rnum0
```
## SEE ALSO
   o The syntax of an expression is as described in the main
     documentation of the Calculator Library.
   o See EXPRESSION(3f), CALCULATOR(3f), INUM0(3f), DNUM0(3f), SNUM0(3f).
