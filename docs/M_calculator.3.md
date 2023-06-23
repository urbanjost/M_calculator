## NAME
   M_calculator(3fm) - [M_calculator::INTRO] module of routines for parsing
   expressions and returning values
## SYNOPSIS
```fortran
    use M_calculator, only : calculator
    ! convenience routines
    use M_calculator, only : expression
    use M_calculator, only : inum0, rnum0, dnum0, snum0
```
## DESCRIPTION
   The M_calculator module and related functions evaluate CHARACTER
   strings containing FORTRAN-like expressions and returns numeric and
   string values.

   Using this interface it is easy to make free-format and
   order-independent input interfaces where values can be expressions
   and variable names instead of simple formatted numbers.

   The primary routine CALCULATOR(3f) acts like a powerful desk-top
   calculator. It supports named variables and has several arrays (of
   55555 elements each). Many standard FORTRAN functions are available,
   plus access to user-written functions is permitted via user-supplied
   routines via set_mysub(3f) and set_myfunc(3f).

   The programmer (generally) uses just the CALCULATOR(3f) routine or
   several convenience routines (INUM0,RNUM0,SNUM0,,EXPRESSION) that
   simplify making the most common type of calls to CALCULATOR(3f).

## PROCEDURES
   + [**calculator**](calculator.3.md):
     The procedure acts like a calculator
   + Convenience routines
     + [**inum0**](inum0.3.md):  resolve a calculator string into a whole integer number
     + [**rnum0**](rnum0.3.md):  resolve a calculator string into a real number (return 0 on errors)
     + [**dnum0**](dnum0.3.md):  resolve a calculator string into a doubleprecision number (return 0 on errors)
     + [**snum0**](snum0.3.md):  resolve a calculator expression into a string(return blank on errors)
     + [**expression**](expressions.md):  call calculator() calculator and display messages
## CONSTANTS
   The variables used to hold the X,Y,$X,$Y, ... arrays and the
   dictionaries of variable names and string names and their associated
   values:
   + integer,parameter,public :: iclen_calc=512 ! max length
     of expression or variable value as a string
   + integer,parameter,public :: ixy_calc=55555 ! number of
     variables in X() and Y() array
   + integer,parameter,public :: icname_calc=20 ! max length
     of a variable name
   + real(kind=dp),save,public :: x(ixy_calc)=0.0_dp ! x array
     for procedure funcs_
   + real(kind=dp),save,public :: y(ixy_calc)=0.0_dp ! y array
     for procedure funcs_
   + integer,save,public,allocatable :: values_len(:) !
     lengths of the string variable values
   + character(len=:),save,public,allocatable :: values(:) !
     string variable values

## USAGE
### Calculator Expressions 

   The calculator interface allows input values to be numeric or
   string expressions using Fortran-like syntax instead of just simple
   variables.

   Named variables may be created. Several arrays of 55555 elements
   each exist. The majority of FORTRAN intrinsic functions are
   available, Custom routines may be made available for each
   application using the interface.

   A summary of the syntax rules for the expressions follows:
     + The hierarchy of operations is the same as that of FORTRAN
       except that adjacent exponents are done from left to right,
       not right to left [i.e. in FORTRAN 3**2**4=3**(2**4), e.g.
       3**2**4=(3**2)**4]; and +- strings are resolved to a single
       sign (that is, 3+ -4 is acceptable instead of 3+(-4)).
     + Almost all the INTRINSIC mathematical functions defined in
       FORTRAN are available, as well as access to common extensions
       and user-written routines.
     + Embedded blanks are ignored during the processing of a
       calculation, but most applications using the calculator
       interface parse on spaces. Therefore, it is generally good
       practice to assume unquoted white-space ends an expression.
     + All numeric values are treated as FORTRAN type REAL
       variables.
     + Input lines should not normally be over 255 characters long,
     + There are three ways to store results to be used in future
       calculations:
          1. Variable names
          2. The current-value
          3. The x and y arrays
       Each of the types will be discussed separately.
#### VARIABLE NAMES
   Names must be 1 to 20 characters long, and are case-sensitive. The
   numbr of names permitted is only limited by the available memory.
   Numeric variable names should be composed of the letters a-z and
   underscores and numbers. String variables are similar but start
   with a dollar sign($). Names must not end in a "digit-E"
   combination. For example:
```text
       A=sin(3.1416/2)
       big=200.333E200
       $name="Thomas Jefferson"
```
   Variables may be defined by equating them to an expression. To
   define or redefine a variable called FRED, simply enter:
```text
       > FRED=300*4/500
```
   The last value assigned to a variable will be used to evaluate the
   expression on the left of the equals sign when this expression
   redefines the variable. For example:
```text
       > A=2
       2
       > A
       2
       > A=A+A
       4
       > A=A+A
       8
```
   To allow FORTRAN-type E-format numeric entry and yet not cause the
   calculator routine to do an excessive amount of checking, a
   variable name ending in the letter E must not have a digit
   (012345789) in front of that ending E. Attempting to define such a
   variable name will produce an error. This limitation prevents the
   calculator from becoming confused by whether 12E+3 is a variable
   called 12E plus 3 or the exponential number 12E3=12000.
## CURRENT VALUE
   The variable name '?' is automatically set by the program to
   contain the last calculated value. This current-value register may
   be used like any variable or number. It is 0 at program
   initialization. Example:
```text
      > (300+500)
      800
      > (1/4)*?
      200
      > ?+?
      400
```
## THE X AND Y ARRAYS
   Two arrays called X and Y are available that can contain up to
   55555 values each. The arrays are originally initialized to all
   zeros. To set values in the arrays, use the xstore (or ystore)
   command. The format of the commands is
```text
       xstore(start,ex1,ex2,ex3)
       ystore(start,ex1,ex2,ex3)
```
   where start=array address to start storing at and ex(i) are
   expressions.

   The current value is assigned the last value stored.
   In addition there are similar string arrays and functions that can
   hold up to 50 255-character strings:
   + $nstore(), $xstore(), $ystore()
   + $n() ,$x() ,$y()
   For example, to store into the locations 10,11,and 12 the values 1/
   10,2/10, and 3/10, the following could be entered:

```text
     xstore( 10 , 1/10 , 2/20 , 3/10 )
        ^
        !
        *-------Start storing evaluated expressions sequentially,
                beginning at x(10).
```
## REFERENCING AN ARRAY VALUE
   The values stored into the arrays may be referenced by subscript.
   For example:
```text
     xstore(1,10,20,30)
     > 30
     fred=x(1)+x(2)+x(3)
     > 60
```
   NOTES:
   1) x and y array values cannot be used on the left of equal
      signs.
```text
         x(10)=5   #  IS ILLEGAL
```
   2) The current value is set to the value of the last expression
      by the xstore and ystore commands
## INTRINSICS
#### supported Fortran intrinsics 
   The majority of intrinsic Fortran numeric functions are available.
   At a minimum the following are recognized (Deviations of the
   calculator routines from the standard intrinsics are noted):

##### Arc or anti-trigonometric functions

  + ACOS(arg) is a generic function that returns the
    arccosine of its argument in radians. The result of
    ACOS(real-arg) is real.
  + ASIN(arg) is a generic function that returns the
    arcsine of its argument in radians. The result of ASIN
    (real-arg) is real.
  + ATAN(arg) is a generic function that returns the
    arctangent of its argument in radians. The result of
    ATAN(real-arg) is real.
  + ATAN2(arg1, arg2) is a generic function that returns
    the arctangent of its argument in radians. The result
    of ATAN2(real-arg1, real-arg2) is real. The arguments
    must not both be 0.
  + ACOSH(arg) is a generic function that returns the
    hyperbolic arccosine of its argument in radians. The
    result of ACOSH(real-arg) is real.
  + ASINH(arg) is a generic function that returns the
    hyperbolic arcsine of its argument in radians. The
    result of ASIN(real-arg) is real.
  + ATANH(arg) is a generic function that returns the
    hyperbolic arctangent of its argument in radians. The
    result of ATANH(real-arg) is real.

##### Trigonometric functions

            * COS(arg) is a generic function that returns the cosine
              of its argument in radians. The result of COS(real-arg)
              is real.
            * SIN(arg) is a generic function that returns the sine of
              its argument in radians. The result of SIN(real-arg) is
              real.
            * TAN(arg) is a generic function that returns the tangent
              of its argument in radians.
    Hyperbolic trigonometric functions

            * COSH(arg) is a generic function that returns the
              hyperbolic cosine of its argument. The result of COSH
              (real-arg) is real.
            * SINH(arg) is a generic function that returns the
              hyperbolic sine of its argument in radians. The result
              of SINH(real-arg) is real.
            * TANH(arg) is a generic function that returns the
              hyperbolic tangent of its argument in radians.
    Powers and logarithms


            * EXP(arg) is a generic function that returns the
              exponential of its argument. The result of EXP(real-
              arg) is real.
            * LOG(arg) is a generic function that returns the natural
              logarithm (base e) of its argument. The result of LOG
              (real-arg) is real.
            * HYPOT(arg1,arg2) returns the Euclidean distance
              calculated at HYPOT(X,Y)==SQRT(X**2+Y**2)
            * LOG10(arg) is a generic function that returns the
              common logarithm (base 10) of its argument. The result
              of LOG10(real-arg) is real.
            * SQRT(arg) is a generic function that returns the
              principal square root of its argument. The result of
                        SQRT(real-arg) is real.
    Maximum/Minimum


            * MAX(arg1, arg2 [,..., arg50]) is a generic function
              that returns the largest value in its argument list.
              The result of MAX(real-arg1, real-arg2 [,..., real-
              arg50]) is real. - (NON-STANDARD LIMIT: 50 instead of
              500 parameters allowed)
            * MIN(arg1, arg2 [,..., arg50]) is a generic function
              that returns the smallest value in its argument list.
              The result of MIN(real-arg1, real-arg2 [,..., real-
              arg50]) is real. NON-STANDARD LIMIT: 50 instead of 500
              parameters allowed)
    Directly effecting sign of value


            * ABS(arg) is a generic function that returns the
              absolute value of its argument. The result of ABS(real-
              arg) is real.
            * SIGN(arg1, arg2) is a generic function that returns a
              value after a sign transfer. The result of SIGN(real-
              arg1, real-arg2) is real. The result is |arg1| if arg2
              >= 0. The result is -|arg1| if arg2 < 0.
    Converting to a whole number


            * INT(arg) is a generic function that converts its
              argument to integer type. The result of INT(real-arg)
              is zero if |real-arg| < 1. The result is the largest
              integer with the same sign as real-arg that does not
              exceed the magnitude of real-arg if |real-arg| >= 1.
            * AINT(arg) is a generic function that returns a whole
              number after truncation of its argument. The result of
              AINT(real-arg) is real. The result is 0 if |arg| < 1.
              The result is the largest integer with the same sign as
              arg that does not exceed the magnitude of arg if |arg|
              >= 1.
            * ANINT(arg) is a generic function that returns the
              nearest whole number of its argument. The result of
              ANINT(real-arg) is real.
            * NINT(arg) is a generic function that returns the
              integer that is nearest to its argument. The result of
              NINT(real-arg) is integer. If arg >= 0, the result is
              (INT(arg+.5)). If arg < 0, the result is (INT(arg-.5)).
    Bessel functions


            * BESSEL_J0(X) - Bessel function of the first kind and
              order zero.
            * BESSEL_J1(X) - Bessel function of the first kind and
              order one.
            * BESSEL_Y0(X) - Bessel function of the second kind and
              order zero.
            * BESSEL_Y1(X) - Bessel function of the second kind and
              order one.
            * BESSEL_JN(N,X) - Bessel function of the first kind and
              order N.
            * BESSEL_YN(N,X) - Bessel function of the second kind and
              order N.
            * BESSEL_JN(N1,N2,X) - Bessel function of the first kind
              and order N.
            * BESSEL_YN(N1,N2,X) - Bessel function of the second kind
              and order N.
    Miscellaneous


            * DIM(arg1, arg2) is a generic function that returns the
              positive difference of its arguments. The result of DIM
              (real-arg1, real-arg2) is real. The result is arg1-arg2
              if arg1 > arg2, and the result is 0 if arg1 <= arg2.
            * MOD(arg1, arg2) is a generic function that returns the
              remainder of arg1 divided by arg2. The result of MOD
              (real-arg1, real-arg2) is real. The result is arg1 -
              (INT(arg1/arg2)*arg2). If arg2 = 0, the result is
              undefined. Arg1 and arg2 must not exceed 2**48-1.
            * REAL(arg) is a generic function that performs type
              conversion on its argument. The result of REAL(real-
              arg) is real.

    Error function

            * ERF(X) - Error function.
            * ERFC(X) - Complementary error function.
            * ERFC_SCALED(X) - Exponentially-scaled complementary
              error function.
===================================================================
### ADDITIONAL PROCEDURES 
   In addition to standard Fortran intrinsics, many other functions
   are supported ...
##### conversion functions 
                * r2d(arg) - converts from radians to degrees
                * d2r(arg) - converts from degrees to radians
                * f2c() - convert Fahrenheit to Celsius
                * c2f() - convert Celsius to Fahrenheit
##### logical functions 
                * ge(val1,val2) - return TRUE if VAL1 is greater than or equal
                  to VAL2, else return FALSE
                * gt(val1,val2) - return TRUE if VAL1 is greater than to VAL2,
                  else return FALSE
                * eq(val1,val2) - return TRUE if VAL1 is equal to VAL2, else
                  return FALSE
                * le(val1,val2) - return TRUE if VAL1 is less than or equal to
                  VAL2, else return FALSE
                * lt(val1,val2) - return TRUE if VAL1 is less than VAL2, else
                  return FALSE
                * ne(val1,val2) - return TRUE if VAL1 is not equal to VAL2,
                  else return FALSE
                * if(expression,val1,val2) - If expression is TRUE, return VAL1
                  else return VAL2
            For example:
                 a=if(ge(b,c),a,d)
            means return a if b is greater than or equal to c else return d.
##### lexical logical functions
                * lge($str1,$str2) - return TRUE if $STR1 is lexically greater
                  than or equal to $STR2, else return FALSE
                * lgt($str1,$str2) - return TRUE if $STR1 is lexically greater
                  than to $STR2, else return FALSE
                * leq($str1,$strN) - return TRUE if $STR1 is lexically equal to
                  any of the other strings, else return FALSE
                * lle($str1,$str2) - return TRUE if $STR1 is lexically less
                  than or equal to $STR2, else return FALSE
                * llt($str1,$str2) - return TRUE if $STR1 is lexically less
                  than $STR2, else return FALSE
                * lne($str1,$strN) - return TRUE if $STR1 is not equal to all
                  following strings.
                * $if(expression,$str1,$str2) - If expression is TRUE, return
                  $STR1 else return $STR2
##### miscellaneous functions 
                * ownmode() - ownmode(3f) enables calls to user-supplied
                  functions via set_mysub(3f) and set_myfunc(3f).
                * c(val1) - user-supplied function
                * ceiling(val1) - ceiling(3f)or ceil(3f) returns the least
                  integral value greater than or equal to VAL1.
                * floor(val1) - floor(3f) returns the greatest integral value
                  less than or equal to VAL1.
                * in(val1,val2,val3) - returns TRUE if VAL1 is between VAL2 and
                  VAL3 else returns FALSE
                * round(val1,val2) - round VAL1 to VAL2 significant digits.
                  Warning: this function is not ready yet.
##### String-related 
                * $char(v1,v2,....) - return characters indicated by numeric
                  ADE (ASCII decimal equivalent) values passed.
                * delimx(istore,$str1,$delimiters) - parse string into tokens
                  in array $x()
                * $f(fortran_format,value) - create string from value using
                  specified Fortran FORMAT statement
                * ichar($char) - return the ADE (ASCII Decimal Equivalent)
                  value of a letter
                * index($str1,$str2) - return column number where $str2 begins
                  in $str1 or zero(0).
                * $l($str1) - convert string to lowercase
                * len($str1) - return the length of the string
                * $(ex,ex,ex,...) or $str(ex,ex,ex,...) - generate a string
                  from a series of strings and numbers. The expressions may be
                  numeric or string.
                * str(ex,ex,ex,...) - same as $str() but convert resulting
                  string to a number IF the string is a simple numeric value
                * $substr(string,i,j) - return a string that is columns i thru
                  j of the input string (first character is called column 1).
                * $u($str1) - convert string to uppercase
##### calendar(Time-related)
                * ye(),year() - return current year
                * mo(),month() - return current month
                * da(),day() - return current day of month
                * ho(),hour() - return current hour (0 -23)
                * tz(),timezone() - timezone in minutes
                * mi(),minute() - return current minute
                * se(),second() - return current second
                * $dw([0-7]) - day of week as a string
                * $mo([1-12]) - month as a string
##### Random numbers
                * rand() - return random number from 0.0 to 1.0
                * srand(number) - set seed for rand(). Seeds should be whole
                  numbers
## MISCELLANEOUS COMMANDS
   Displaying variable values: dump

   The current value and all defined variable names are
   displayed via the dump command.

   Listing Available Functions: funcs

   A display of all available functions can be obtained when
   executing CALCULATOR(3f) by entering the command 'funcs'. No
   descriptions are provided.

### ADDING FUNCTIONS 
   Any program that calls CALCULATOR(3f) directly or indirectly (via JUCALX
   (), INUM0(), RNUM0(), SNUM0()) can extend the functions available by
   supplying two routines:

    1. SUBSTITUTE_SUBROUTINE(3f) - This user-supplied routine is a hook
       for programmers to add their own functions to CALCULATOR(3f)
       without having to change CALCULATOR(3f) directly. It is passed the
       name of unknown functions and their parameter lists if the
       expression 'ownmode(1)' is passed to the calculator. If you do not
       need to add custom functions to the calculator this is not
       required. A user-defined function call be created and called with
       call set_mysub(SUBROUTINE_NAME) The routine must be defined with an
       explicit interface available in the calling unit.
    2. SUBSTITUTE_C(3f) - This user-supplied function is here to optimize
       performance of a particular program and everyone else should
       typically ignore it. In a special case a non-standard function
       needed added that was called so heavily that it was important that
       it be called more efficiently than a user defined function placed
       in SUBSTITUTE_SUBROUTINE(3f) is. It allows for the function "c" to
       be defined and given an array and an array size as arguments. By
       default the "c" function just returns zero. A replacement can be
       defined by creating a function with similar arguments and calling
       call set_myfunc(FUNCTION_NAME). The routine must be defined with an
       explicit interface available in the calling unit.

   The following program shows a simple but complete line-mode calculator
   program.
```text
    ./compute # run example program
    a=10 a/2 3**4
    sin(3.1416/4)
    PI=2*asin(1)
    diameter=20.3+8/4
    circumference=PI*diameter
    funcs dump
    # use end-of-file (typically control-D) to exit program ctrl-D
```
```fortran
     program demo_M_calculator

     !     line mode calculator that calls calculator
     !
     use M_calculator, only: calculator,iclen_calc
     use M_calculator, only : rnum0
     use M_calculator, only : set_mysub, set_myfunc
     implicit none
     integer, parameter        :: k_dbl = SELECTED_REAL_KIND(15,300) ! real*8
     character(len=iclen_calc) :: event, line
     character(len=iclen_calc) :: outlin
     integer                   :: ios
     integer                   :: ierr
     real(kind=k_dbl)          :: rvalue
     character(len=80)         :: string
        INFINITE: do
          read(*,'(a)',iostat=ios)line
          if(ios.ne.0)exit INFINITE
          call calculator(line,outlin,event,rvalue,ierr)
          ! line   -- input expression
          ! outlin -- result as a string
          ! event  --
          ! rvalue -- result as a numeric value
          ! ierr   -- return status
          !
          ! several different meaning to the status flag ...
          select case(ierr)
          case(0)  ! a numeric value was returned without error
            write(6,'(a,a,a)')trim(outlin),' = ',trim(line)
          case(2)  ! a string value was returned without error
            write(6,'(a)')trim(event)
          case(1)  ! a request for a message has been returned
              ! (from DUMP or FUNC)
            write(6,'(a,a)')'message===>',trim(event)
          case(-1) ! an error has occurred
            write(6,'(a,a)')'error===>',trim(event)
          case default ! this should not occur
            write(6,'(a)')'warning===> unexpected ierr value from calculator'
          end select
            enddo INFINITE

            string='A=sind(30)'
            rvalue=rnum0(string,ierr)
            if(ierr.eq.0)then
          write(*,*) rvalue
            else
          write(*,*) 'error evaluating '//trim(string)
            endif
            rvalue=rnum0('A',ierr)
            write(*,*) rvalue

            ! OPTIONAL: contains example routines for adding user-defined
            !           functions.
            !
            call set_mysub(my_functions)
            call set_myfunc(c)
    contains
    subroutine my_functions(func,iflen,args,iargstp,n,fval,ctmp,ier)
    ! extend functions available to the calculator routine
    !
    !  if the function ownmode(1) is called this subroutine
    !  will be accessed to do user-written functions.
    !
    !  func(iend-1)=procedure name.  func should not be changed.
    !  iflen=length of procedure name.
    !  args=array of 100 elements containing procedure arguments.
    !  iargstp=type of argument(1=numeric value,2=position of string value)
    !  n=integer number of parameters
    !  x=array of 55555 x values
    !  y=array of 55555 y values
    !  fval=value to replace function call
    !  ctmp=string to return when returning a string value
    !  ier=returned error flag value.
    !      set to -1 if an error occurs.
    !      set to  0 if a number is returned
    !      set to  2 if a string is returned
    !
    use M_calculator, only: x,y,values,values_len,iclen_calc
    integer, parameter           :: k_dbl = SELECTED_REAL_KIND(15,300) ! real*8
    ! values: the values of string variables
    ! values_len: the lengths of the string variable values
    character(len=*),intent(in)  :: func
    integer,intent(in)           :: iflen
    real(kind=k_dbl),intent(in)  :: args(100)
    integer,intent(in)           :: iargstp(100)
    integer,intent(in)           :: n
    real(kind=k_dbl)             :: fval
    character(len=*)             :: ctmp
    integer                      :: ier

    integer                      :: iwhich
    integer                      :: i10
    integer                      :: ilen
    character(len=iclen_calc)    :: temp1
       fval=0.0d0
       !-----------------------------------------------------------------------
       write(*,*)'*my_functions* unknown function ', func(1:iflen)
       write(*,*)'function name length is..',iflen
       write(*,*)'number of arguments .....',n
       do i10=1,n
          if(iargstp(i10).eq.0)then
             write(*,*)i10,' VALUE=',args(i10)
          elseif(iargstp(i10).eq.2)then
             iwhich=int(args(i10))
             ilen=values_len(iwhich)
             write(*,*)i10,' STRING='//values(iwhich)(:ilen)
          else
             write(*,*)'unknown parameter type is ',iargstp(i10)
          endif
       enddo
    end subroutine my_functions
    !
    real function c(fval,n)
    implicit none
    !  a built-in calculator function called c must be satisfied.
    !  write whatever you want here as a function
    integer, parameter          :: k_dbl = SELECTED_REAL_KIND(15,300) !  real*8
    integer,intent(in)          :: n
    real(kind=k_dbl),intent(in) :: fval(n)
       c=0.0_k_dbl
    end function c
    !
    end program demo_M_calculator
```
