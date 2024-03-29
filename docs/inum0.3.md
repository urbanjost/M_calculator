## NAME
   inum0(3f) - [M\_calculator] return integer value from calculator
   expression (LICENSE:PD)
## SYNOPSIS
```fortran
     integer function inum0(inline,ierr)

     character(len=*),intent(in)  :: inline
     integer,optional,intent(out) :: ierr
```
## DESCRIPTIONS
   INUM0(3f) evaluates a CHARACTER argument as a FORTRAN-like
   calculator expression and returns an integer.

   + INUM0(3f) uses the calculator routine CALCULATOR(3f)
   + Remember that the calculator treats all values as
     DOUBLEPRECISION.

   Values returned are assumed to be very close to being whole integer
   values. A small value (0.01) is added to the result before it is
   returned to reduce roundoff error problems. This could introduce errors
   if INUM0 is misused and is not being used to calculate essentially
   integer results.

## OPTIONS
<dl>

  <dt>inline</dt>
  <dd>
  INLINE is a CHARACTER variable up to 255 characters long that
  is similar to a FORTRAN 77 numeric expression. Keep it less
  than 80 characters when possible.
  </dd>

  <dt>ierr</dt>
  <dd>
   zero (0) if no error occurs
  </dd>

</dl>

## DEPENDENCIES
   All programs that call the calculator routine can supply their own
   substitute\_subroutine(3f) and substitute\_C(3f) procedures, which allow
   adding procedures to the calculator without altering the M\_calculator
   module. See the example program for samples.
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
