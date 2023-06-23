## NAME
   snum0(3f) - [M_calculator] resolve a calculator expression into a
   string(return blank on errors) (LICENSE:PD)
## SYNOPSIS
```fortran
    function snum0(inline0,ierr)

    character(len=:),allocatable :: snum0
    character(len=*),intent(in)  :: inline0 
    integer,optional,intent(out) :: ierr
```

## DESCRIPTION
   SNUM0() is used to return a string value up to (iclen_calc=512)
   characters long from a string expression. SNUM0() uses the calculator
   routine CALCULATOR(3f)
## OPTIONS
   inline0:
          INLINE0 is a CHARACTER variable up to (iclen_calc=512)
          characters long that is similar to a FORTRAN 77 expression.
   ierr:  error code. If zero, no error occurred
## EXAMPLES
```fortran
     Sample program:
         program demo_snum0
         use m_calculator, only: rnum0, snum0
         character(len=80)  :: ic,jc,kc

         rdum=rnum0('A=83/2') ! set a variable in the calculator
         kc=snum0('$MYTITLE="This is my title variable"')

         ic=snum0('$STR("VALUE IS [",A,"]")')
         jc=snum0('$MYTITLE')

         write(*,*)'IC=',trim(ic)
         write(*,*)'JC=',trim(jc)
         write(*,*)'KC=',trim(kc)

         end program demo_snum0
```
   The output should look like
```text
       IC=VALUE IS [41.5]
       JC=This is my title variable
       KC=This is my title variable
```
## DEPENDENCIES
   User-supplied routines: 
   All programs that call the calculator
   routine can supply their own **substitute_subroutine(3f)** and
   **substitute_C(3f)** procedures. See the example programs for samples.
## SEE ALSO
   o The syntax of an expression is described in the main document of
     the Calculator Library.
   o See CALCULATOR(), RNUM0(), SNUM0(), EXPRESSION().
