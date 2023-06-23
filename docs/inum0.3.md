## NAME
   inum0(3f) - [M_calculator] return integer value from calculator
   expression (LICENSE:PD)
## SYNOPSIS
```fortran
     integer function inum0(inline,ierr)

     character(len=*),intent(in)  :: inline
     integer,optional,intent(out) :: ierr
```
## SYNOPSIS
   INUM0(3f) evaluates a CHARACTER argument as a FORTRAN-like
   calculator expression and returns an integer.

   o INUM0(3f) uses the calculator routine CALCULATOR(3f)
   o Remember that the calculator treats all values as
     DOUBLEPRECISION.

   Values returned are assumed to be very close to being whole integer
   values. A small value (0.01) is added to the result before it is
   returned to reduce roundoff error problems. This could introduce errors
   if INUM0 is misused and is not being used to calculate essentially
   integer results.
## DESCRIPTION
   inline:  INLINE is a CHARACTER variable up to 255 characters long that
            is similar to a FORTRAN 77 numeric expression. Keep it less
            than 80 characters when possible.

   ierr:    zero (0) if no error occurs
## DEPENDENCIES
   All programs that call the calculator routine can supply their own
   substitute_subroutine(3f) and substitute_C(3f) procedures. See the
   example program for samples.
## EXAMPLES
   Sample program:
```text
    program demo_inum0
    use M_calculator, only : inum0
       i=inum0('20/3.4')
       j=inum0('CI = 13 * 3.1')
       k=inum0('CI')
       write(*,*)'Answers are ',I,J,K
    end program demo_inum0
``` 
## SEE ALSO
   The syntax of an expression is as described in the main document of
   the Calculator Library. See CALCULATOR(3f), RNUM0(3f), DNUM0(3f), SNUM0(3f),
   EXPRESSION(3f)
