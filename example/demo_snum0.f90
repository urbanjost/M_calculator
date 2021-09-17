program demo_snum0
use m_calculator, only: rnum0, snum0
implicit none
character(len=80)  :: ic,jc,kc
real :: rnum

   kc=snum0('$MYTITLE="This is my title variable"')

   ic=snum0('$STR("VALUE IS [",A,"]")')
   jc=snum0('$MYTITLE')

   write(*,*)'IC=',trim(ic)
   write(*,*)'JC=',trim(jc)
   write(*,*)'KC=',trim(kc)

end program demo_snum0
