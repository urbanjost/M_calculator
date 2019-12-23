<?
<body>
  <a name="top" id="top"></a>

  <h5><a href="download.html">[UP]</a></h5>

  <div id="Container">
    <div id="Content">
      <div class="c5">
      </div><a name="0"></a>

      <h3><a name="0">NAME</a></h3>

      <blockquote>
        <b>calculator</b> - [M_calculator] parse calculator expression and return numeric or string value <b>(LICENSE:PD)</b>
      </blockquote><a name="contents" id="contents"></a>

      <h3><a name="8">SYNOPSIS</a></h3>

      <blockquote>
        <pre>
subroutine <b>calculator</b>(inline,outlin,mssg,slast,ierr)
<br />   character(len=*),intent=(in)           :: inline
   character(len=iclen_calc),intent=(out) :: outlin
   character(len=iclen_calc),intent=(out) :: mssg
   doubleprecision, intent=(out)          :: slast
   integer, intent=(out)                  :: ierr
<br />
</pre>
      </blockquote><a name="2"></a>

      <h3><a name="2">DESCRIPTION</a></h3>

      <blockquote>
        <b>CALCULATOR</b>(3f) evaluates FORTRAN-like expressions. It can be used to add calculator-like abilities to your program.
      </blockquote><a name="3"></a>

      <h3><a name="3">OPTIONS</a></h3>

      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td class="c6" width="6%" nowrap="nowrap">inline</td>

            <td valign="bottom">INLINE is a string expression up to (iclen_calc=512) characters long. The syntax of an expression is described in the main
            document of the Calculator Library.</td>
          </tr>

          <tr valign="top">
            <td class="c6" width="6%" nowrap="nowrap">outlin</td>

            <td valign="bottom">Returned numeric value as a string when IERR=0.</td>
          </tr>

          <tr valign="top">
            <td class="c6" width="6%" nowrap="nowrap">mssg</td>

            <td valign="bottom">
              MSSG is a string that can serve several purposes

              <table width="100%" cellpadding="3">

                <tr valign="top">
                  <td width="3%">o</td>

                  <td>Returned string value when IERR=2</td>
                </tr>

                <tr valign="top">
                  <td width="3%">o</td>

                  <td>Error message string when IERR=<b>-1</b></td>
                </tr>

                <tr valign="top">
                  <td width="3%">o</td>

                  <td>Message from 'funcs' or 'dump' command when IERR=1</td>
                </tr>

              </table>
            </td>
          </tr>

          <tr valign="top">
            <td class="c6" width="3%" nowrap="nowrap">slast</td>

            <td valign="bottom">
              SLAST has different meanings depending on whether a string or number is being returned

              <table width="100%" cellpadding="3">

                <tr valign="top">
                  <td width="3%">o</td>

                  <td>REAL value set to last successfully calculated value when IERR=0</td>
                </tr>

                <tr valign="top">
                  <td width="3%">o</td>

                  <td>Number of characters in returned string variable when IERR=2</td>
                </tr>

              </table>
            </td>
          </tr>

          <tr valign="top">
            <td class="c6" width="3%" nowrap="nowrap">ierr</td>

            <td valign="bottom">
              status flag.

              <table width="100%" cellpadding="3">

                <tr valign="top">
                  <td class="c6" width="6%" nowrap="nowrap">-1</td>

                  <td valign="bottom">
                    An error occurred

                    <table width="100%" cellpadding="3">

                      <tr valign="top">
                        <td class="c6" width="6%" nowrap="nowrap">0</td>

                        <td valign="bottom">A numeric value was returned</td>
                      </tr>

                      <tr valign="top">
                        <td class="c6" width="6%" nowrap="nowrap">1</td>

                        <td valign="bottom">A message was returned</td>
                      </tr>

                      <tr valign="top">
                        <td class="c6" width="6%" nowrap="nowrap">2</td>

                        <td valign="bottom">A string value was returned</td>
                      </tr>

                    </table>
                  </td>
                </tr>

              </table>
            </td>
          </tr>

        </table>
      </blockquote><a name="4"></a>

      <h3><a name="4">EXAMPLES</a></h3>

      <blockquote>
        Example calculator program
        <pre>
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
           write(*,'(a,a)')'message===&gt;',trim(event(:len_trim(event)))
         case(-1)
         ! an error has occurred
           write(*,'(a,a)')'error===&gt;',trim(event(:len_trim(event)))
         case default
         ! this should not occur
           WRITE(6,'(A,i10)')'*CALCULATOR* UNEXPECTED IERR VALUE ',IERR
         end select
      enddo INFINITE
      999 continue
      end program demo_calculator
<br />
</pre>
      </blockquote><a name="5"></a>

      <h3><a name="5">SEE ALSO</a></h3>

      <blockquote>
        see <b>INUM0</b>(),RNUM0(),SNUM0(),EXPRESSION().
      </blockquote><a name="6"></a>

    </div>
  </div>
</body>
</html>
