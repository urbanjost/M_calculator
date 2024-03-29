## NAME
   calculator - [M\_calculator] parse calculator expression and return
   numeric or string value (LICENSE:PD)
## SYNOPSIS
```fortran
     subroutine calculator(inline,outlin,mssg,slast,ierr)

     character(len=*),intent=(in)           :: inline
     character(len=iclen_calc),intent=(out) :: outlin
     character(len=iclen_calc),intent=(out) :: mssg
     doubleprecision, intent=(out)          :: slast
     integer, intent=(out)                  :: ierr
```
## DESCRIPTION
   CALCULATOR(3f) evaluates FORTRAN-like expressions. It can be used to
   add calculator-like abilities to your program.
## OPTIONS
<dl>

  <dt>inline</dt> <dd>
      INLINE is a string expression up to (iclen\_calc=512)
      characters long. The syntax of an expression is described in
      the main document of the Calculator Library.
  </dd>
  <dt>outlin</dt> <dd>
      Returned numeric value as a string when IERR=0.
  </dd>
  <dt>mssg</dt> <dd>
      MSSG is a string that can serve several purposes
      <ul>
      <li> Returned string value when IERR=2 </li>
      <li> Error message string when IERR=-1 </li>
      <li> Message from 'funcs' or 'dump' command when IERR=1 </li>
      <ul>
  </dd>
  <dt>slast</dt> <dd>
      has different meanings depending on whether a string or
      number is being returned
      <ul>
      <li> REAL value set to last successfully calculated value when IERR=0 </li>
      <li> Number of characters in returned string variable when IERR=2 </li>
      /ul>
  </dd>
  <dt>ierr</dt> <dd>
     status flag.
     <ul>
     <li> -1 -- An error occurred </li>
     <li>  0 -- A numeric value was returned </li>
     <li>  1 -- A message was returned </li>
     <li>  2 -- A string value was returned </li>
     </ul>
  </dd>

</dl>
## EXAMPLES
     Example calculator program
```fortran
   program demo_calculator
   !compute(1f): line mode calculator program (that calls calculator(3f))
   use M_calculator, only: calculator,iclen_calc
   ! iclen_calc : max length of expression or variable value as a string
   implicit none
   integer,parameter         :: dp=kind(0.0d0)
   character(len=iclen_calc) :: line
   character(len=iclen_calc) :: outlin
   character(len=iclen_calc) :: event
   real(kind=dp)             :: rvalue
   integer                   :: ierr
   ierr=0
   call calculator('ownmode(1)',outlin,event,rvalue,ierr)
   ! activate user-defined function interface
   INFINITE: do
      read(*,'(a)',end=999)line
      if(line.eq.'.')stop
      call calculator(line,outlin,event,rvalue,ierr)
      select case (ierr)
      ! several different meanings to the error flag returned by calculator
      case(0)
      ! a numeric value was returned without error
        write(*,'(a,a,a)')trim(outlin),' = ',trim(line)
      case(2)
      ! a string value was returned without error
        write(*,'(a)')trim(event(:int(rvalue)))
      case(1)
      ! a request for a message has been returned (from DUMP or FUNC)
        write(*,'(a,a)')'message===>',trim(event(:len_trim(event)))
      case(-1)
      ! an error has occurred
        write(*,'(a,a)')'error===>',trim(event(:len_trim(event)))
      case default
      ! this should not occur
        WRITE(6,'(A,i10)')'*CALCULATOR* UNEXPECTED IERR VALUE ',IERR
      end select
   enddo INFINITE
   999 continue
   end program demo_calculator
```
## SEE ALSO
   see INUM0(),RNUM0(),SNUM0(),EXPRESSION().
