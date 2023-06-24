program test_suite_M_calculator
use, intrinsic :: iso_fortran_env, only: &
& stdin => input_unit,   &
& stdout => output_unit, &
& stderr => error_unit
use M_framework,  only : unit_test_start, unit_test, unit_test_end, unit_test_msg, unit_test_stop
use M_framework, only : unit_test_mode, unit_test_level, unit_test_flags
use M_framework,  only : almost
use M_calculator, only : calculator
! convenience routines
use M_calculator, only : inum0, rnum0, dnum0, snum0, expression
! constants
use M_calculator, only : iclen_calc, ixy_calc, icname_calc, x, y, values_len, values
!!use M_calculator, only : read_config
implicit none
logical, parameter :: T=.true., F=.false.
integer,parameter :: bug=0 ! gfortran-11 bug where function calls as arguments cause errors, but expressions do not

! optional call to change default modes
   call unit_test_mode(   &
       keep_going=T,      &
       flags=[0],         &
       luns=[stdout],     &
       command='',        &
       brief=T,           &
       match='',          &
       interactive=F,     &
       CMDLINE=T,         &
       debug=F)

   unit_test_level=0

call test_calculator()
!!call test_jucals()
!!call test_squeeze_()

!!call test_a_to_d_()

call test_dnum0()
call test_inum0()
call test_expression()
call test_rnum0()
call test_snum0()

call test_c()
call test_juown1()

call unit_test_stop()

contains
!TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
subroutine test_calculator()
! iclen_calc : max length of expression or variable value as a string
integer, parameter         :: dp = kind(0.0d0)
character(len=iclen_calc) :: line
character(len=iclen_calc) :: outlin
character(len=iclen_calc) :: event
real(kind=dp)             :: rvalue
integer                   :: ierr

   call unit_test_start('calculator',msg='')

   ierr = 0
   call calculator('ownmode(1)', outlin, event, rvalue, ierr)

   ! activate user-defined function interface
   !!call unit_test('calculator', 0.eq.0, 'checking',100)

   line='1.3/sind(90)+1-20*2/3'
   call calculator(line, outlin, event, rvalue, ierr)
   select case (ierr)
      ! several different meanings to the error flag returned by calculator
   case (0)
      ! a numeric value was returned without error
      write (*, '(a,a,a)') trim(outlin), ' = ', trim(line)
   case (2)
      ! a string value was returned without error
      write (*, '(a)') trim(event(:int(rvalue)))
   case (1)
      ! a request for a message has been returned (from DUMP or FUNC)
      write (*, '(a,a)') 'message===>', trim(event(:len_trim(event)))
   case (-1)
      ! an error has occurred
      write (*, '(a,a)') 'error===>', trim(event(:len_trim(event)))
   case default
      ! this should not occur
      WRITE (6, '(A,i10)') '*CALCULATOR* UNEXPECTED IERR VALUE ', IERR
   end select

   call unit_test_end('calculator',msg='')
end subroutine test_calculator
!TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
subroutine test_c()

   call unit_test_start('c',msg='')
   !!call unit_test('c', 0.eq.0, 'checking',100)
   call unit_test_end('c',msg='')
end subroutine test_c
!TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
subroutine test_juown1()

   call unit_test_start('juown1',msg='')
   !!call unit_test('juown1', 0.eq.0, 'checking',100)
   call unit_test_end('juown1',msg='')
end subroutine test_juown1
!TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
subroutine test_dnum0()
doubleprecision :: y, z
   Y=DNUM0('CI = 10 * sin(3.1416/4)')
   Z=DNUM0('CI')
   call unit_test_start('dnum0',msg='')
   !!JUST PRINT VALUES!!if(almost(z,10*sin(3.1416d0/4.0d0),35,verbose=.true.))continue
   call unit_test('dnum0', y.eq.z.and.almost(y,10*sin(3.1416d0/4d0),15),&
           & 'checking CI',dnum0('CI')+bug,dnum0('10*sin(3.1416/4)')+bug,10*sin(3.1416d0/4.0d0))
   call unit_test_end('dnum0',msg='')
end subroutine test_dnum0
!TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
subroutine test_inum0()
character(len=:),allocatable :: string
   call unit_test_start('inum0',msg='')

   string='10/3'
   call unit_test('inum0', inum0(string).eq.3, 'checking',string,'==>',inum0(string)+bug,'expected',3)

   string='(444/111+1)*10-5.0'
   call unit_test('inum0', inum0(string).eq.45, 'checking',string,'==>',inum0(string)+bug,'expected',45)

   string='-10'
   call unit_test('inum0', inum0(string).eq.-10, 'checking',string,'==>',inum0(string)+bug,'expected',-10)

   call unit_test_end('inum0',msg='')
end subroutine test_inum0
!TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
subroutine test_expression()
character(len=iclen_calc) ::  outlin0
doubleprecision :: outval
character(len=:),allocatable :: string
integer :: ierr, ilen

   call unit_test_start('expression',msg='')

   string='A=3.4**5    '
   call expression(string,outval,outlin0,ierr,ilen)
   call unit_test('expression', ierr==0, 'error flag should be zero',ierr)
   call unit_test('expression', ilen==8, 'trimmed expression length should be eight',ilen)
   call unit_test_end('expression',msg='')

   string='$STR("The value is ",nint(40/4))'
   call expression(string,outval,outlin0,ierr,ilen)
   call unit_test('expression', ierr==2, 'string returned',trim(outlin0)//'')

   string='# this is a comment'
   !call unit_test('expression', ierr==1, 'expression is a comment',ierr)

end subroutine test_expression
!
!   string='A=sin(3.1416/5)'
!   !  -1 if an error occurred
!   !  0 if a numeric value is returned (value is in OUTVAL, string representation of the value is in OUTLIN2).
!   !  1 if no value was returned but a message was displayed (If a 'dump' or 'funcs' command was passed to the calculator).
!   !  2 if the expression evaluated to a string value instead of a numeric value (value is in OUTLIN0).
!   write(*,*)'value of expression is ',outval
!   write(*,*)'string representation of value is ',trim(outlin0)
!   
!   ! value of expression is    454.35424000000000
!   ! string representation of value is 454.35424
!TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
subroutine test_rnum0()
character(len=:),allocatable :: string

   call unit_test_start('rnum0',msg='')
   string='10/2'
   call unit_test('rnum0', rnum0(string).eq.5, 'checking',string,'==>',rnum0(string)+bug,'expected',5)
   call unit_test_end('rnum0',msg='')
end subroutine test_rnum0
!TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
subroutine test_snum0()
character(len=:),allocatable :: string
   call unit_test_start('snum0',msg='')
   string='$str(10/2)'
   call unit_test('snum0', snum0(string).eq.'5', 'checking',string,'==>',snum0(string)//'','expected','5')
   call unit_test_end('snum0',msg='')
end subroutine test_snum0
!TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
end program test_suite_M_calculator
