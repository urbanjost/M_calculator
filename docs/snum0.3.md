## NAME
   snum0(3f) - [M\_calculator] resolve a calculator expression into a
   string(return blank on errors) (LICENSE:PD)
## SYNOPSIS
```fortran
    function snum0(inline0,ierr)

    character(len=:),allocatable :: snum0
    character(len=*),intent(in)  :: inline0 
    integer,optional,intent(out) :: ierr
```

## DESCRIPTION
   SNUM0() is used to return a string value up to (iclen\_calc=512)
   characters long from a string expression. SNUM0() uses the calculator
   routine CALCULATOR(3f)
## OPTIONS
<dl>

  <dt>inline0</dt>
  <dd>
  INLINE0 is a CHARACTER variable up to (iclen\_calc=512)
  characters long that is similar to a FORTRAN 77 expression.
  </dd>

  <dt>ierr</dt>
  <dd>
   error code. If zero, no error occurred
  </dd>

</dl>
## EXAMPLES
   Sample program:
```fortran
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
   All programs that call the calculator routine can supply their own
   substitute\_subroutine(3f) and substitute\_C(3f) procedures, which allow
   adding procedures to the calculator without altering the M\_calculator
   module. See the example program for samples.
   
## SEE ALSO
  + The syntax of an expression is described in the main document of
    the Calculator Library.
  + See CALCULATOR(), RNUM0(), SNUM0(), EXPRESSION().
