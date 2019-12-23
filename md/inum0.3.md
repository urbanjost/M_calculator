<?
<body>
  <a name="top" id="top"></a>

  <div id="Container">
    <div id="Content">
      <div class="c17">
      </div><a name="0"></a>

      <h3><a name="0">NAME</a></h3>

      <blockquote>
        <b>inum0(3f)</b> - [M_calculator] return integer value from calculator expression <b>(LICENSE:PD)</b>
      </blockquote><a name="contents" id="contents"></a>

      <h3><a name="9">SYNOPSIS</a></h3>

      <blockquote>
        <pre>
integer function <b>inum0</b>(inline,ierr)
<br />   character(len=*),intent(in)  :: inline
   integer,optional,intent(out) :: ierr
<br />
</pre>
      </blockquote><a name="2"></a>

      <h3><a name="2">SYNOPSIS</a></h3>

      <blockquote>
        <pre>
<b>INUM0</b>() evaluates a CHARACTER argument as a FORTRAN-like
calculator expression and returns an integer.
</pre>

        <blockquote>
          <table cellpadding="3">

            <tr valign="top">
              <td width="3%">o</td>

              <td><b>INUM0</b>() uses the calculator routine <b>CALCULATOR</b>(<i>3f</i>)</td>
            </tr>

            <tr valign="top">
              <td width="3%">o</td>

              <td>Remember that the calculator treats all values as DOUBLEPRECISION.</td>
            </tr>

          </table>
        </blockquote>
        <pre>

<br />Values returned are assumed to be very close to being whole integer
values. A small value (0.01) is added to the result before it is
returned to reduce roundoff error problems. This could introduce
errors if INUM0 is misused and is not being used to calculate
essentially integer results.
</pre>
      </blockquote><a name="3"></a>

      <h3><a name="3">DESCRIPTION</a></h3>

      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td class="c18" width="6%" nowrap="nowrap">inline</td>

            <td valign="bottom">INLINE is a CHARACTER variable up to 255 characters long that is similar to a FORTRAN 77 numeric expression. Keep it less
            than 80 characters when possible.</td>
          </tr>

          <tr valign="top">
            <td class="c18" width="6%" nowrap="nowrap">ierr</td>

            <td valign="bottom">zero (0) if no error occurs</td>
          </tr>

        </table>
      </blockquote><a name="4"></a>

      <h3><a name="4">DEPENDENCIES</a></h3>

      <blockquote>
        All programs that call the calculator routine can supply their own <b>substitute_subroutine</b>(<i>3f</i>) and <b>substitute_C</b>(<i>3f</i>)
        procedures. See the ../html/Example.html"&gt;example program for samples.
      </blockquote><a name="5"></a>

      <h3><a name="5">EXAMPLES</a></h3>

      <blockquote>
        Sample program:
        <pre>
      program demo_inum0
      use M_calculator, only : inum0
      i=inum0('20/3.4')
      j=inum0('CI = 13 * 3.1')
      k=inum0('CI')
      write(*,*)'Answers are ',I,J,K
      end program demo_inum0
<br />
</pre>
      </blockquote><a name="6"></a>

      <h3><a name="6">SEE ALSO</a></h3>

      <blockquote>
        The syntax of an expression is as described in the main document of the Calculator Library. See <b>CALCULATOR</b>(), <b>RNUM0</b>(), <b>DNUM0</b>(),
        <b>SNUM0</b>(), <b>EXPRESSION</b>()
      </blockquote><a name="7"></a>

    </div>
  </div>
</body>
</html>
