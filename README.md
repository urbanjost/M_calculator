# M_calculator

## parse mathematical expressions

   The M_calculator(3f) module contains a basic expression parser and
   related convenience routines.
   
   Expressions are similar to Fortran77 syntax except powers are processed
   from left to right, and string variable names start with a dollar-sign,
   and all numeric values are assumed to be DOUBLEPRECISION.
   
   Note that although suitable for many uses, this is not a byte-code
   interpreter and is designed for parsing basic unique expressions, not
   for high volume repetition of the computations on a large volume of data.

## DOWNLOAD
```bash
    git clone https://github.com/urbanjost/M_calculator.git
    cd M_calculator/src
    # change Makefile if not using gfortran(1)
    make
```
   This will compile the M_calculator module and build all the example
   programs from the document pages in the PROGRAMS/ sub-directory.
   
   ## SUPPORTS FPM 
   #### (registered at the [fpm(1) registry](https://github.com/fortran-lang/fpm-registry) )
   
   Alternatively, download the github repository and build it with 
   fpm ( as described at [Fortran Package Manager](https://github.com/fortran-lang/fpm) )

```bash
     git clone https://github.com/urbanjost/M_calculator.git
     cd M_calculator
     fpm build
     fpm test
```

   or just list it as a dependency in your fpm.toml project file.

```toml
     [dependencies]
     calculator        = { git = "https://github.com/urbanjost/M_calculator.git" }
```

## DOCUMENTATION

   The [documentation](md/M_calculator.3.md) describes the many functions available.

## EXAMPLE
```fortran
      program demo_dnum0
         use M_calculator, only : dnum0
         implicit none
         doubleprecision              :: x,y,z, answer
         integer                      :: i
         character(len=:),allocatable :: strings(:)
      
         strings= [ character(len=128) ::             &
            '20/3.4                                 ',&
            'CI=10*sin(3.1416/4)                    ',&
            'a=CI**2+sqrt(90)                       ',&
            'x=a/CI-atan(a)                         ',&
            'y=x+CI/333                             ',&
            '                                       ']
      
         do i=1,size(strings)
            answer=dnum0(strings(i))
         enddo
      
         x=dnum0('x')
         y=dnum0('y')
         z=dnum0('CI')
         write(*,*)x,y,z
      
      end program demo_dnum0
```
