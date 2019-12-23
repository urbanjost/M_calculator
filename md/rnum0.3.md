<?
<body>
  <a name="top" id="top"></a>

  <div id="Container">
    <div id="Content">
      <div class="c21">
      </div><a name="0"></a>

      <h3><a name="0">NAME</a></h3>

      <blockquote>
        <b>rnum0(3f)</b> - [M_calculator] returns real number from string expression using <b>CALCULATOR</b>(3f) <b>(LICENSE:PD)</b>
      </blockquote><a name="contents" id="contents"></a>

      <h3><a name="8">SYNOPSIS</a></h3>

      <blockquote>
        <pre>
real function <b>rnum0</b>(<i>inline</i>)
<br />    character(len=*), intent=(in) :: inline
    integer,intent(out),optional  :: ierr
<br />
</pre>
      </blockquote><a name="2"></a>

      <h3><a name="2">DESCRIPTION</a></h3>

      <blockquote>
        <b>RNUM0</b>() is used to return a REAL value from a CHARACTER string representing a numeric expression. It uses the <b>M_calculator</b>(3fp)
        module.

        <table cellpadding="3">

          <tr valign="top">
            <td class="c22" width="6%" nowrap="nowrap">inline</td>

            <td valign="bottom">INLINE is a CHARACTER variable up to (iclen_calc=512) characters long that is similar to a FORTRAN 77 numeric
            expression.</td>
          </tr>

          <tr valign="top">
            <td class="c23" width="6%" nowrap="nowrap">ierr</td>

            <td valign="bottom">error code. If zero, no error occurred</td>
          </tr>

        </table>
      </blockquote><a name="3"></a>

      <h3><a name="3">DEPENDENCIES</a></h3>

      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td width="3%">o</td>

            <td>User-supplied routines: All programs that call the calculator routine can supply their own <b>substitute_subroutine</b>(3f) and
            <b>substitute_C</b>(3f) procedures. See the example program for samples.</td>
          </tr>

        </table>
      </blockquote><a name="4"></a>

      <h3><a name="4">EXAMPLES</a></h3>

      <blockquote>
        Sample program
        <pre>
    program demo_rnum0
    use M_calculator, only : rnum0
    x=rnum0('20/3.4')
    y=rnum0('CI = 10 * sin(3.1416/4)')
    z=rnum0('CI')
    write(*,*)x,y,z
    end program demo_rnum0
<br />
</pre>
      </blockquote><a name="5"></a>

      <h3><a name="5">SEE ALSO</a></h3>

      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td width="3%">o</td>

            <td>The syntax of an expression is as described in the main documentation of the Calculator Library.</td>
          </tr>

          <tr valign="top">
            <td width="3%">o</td>

            <td>See <b>EXPRESSION</b>(3f), <b>CALCULATOR</b>(3f), <b>INUM0</b>(3f), <b>DNUM0</b>(3f), <b>SNUM0</b>(3f).</td>
          </tr>

        </table>
      </blockquote><a name="6"></a>

    </div>
  </div>
</body>
</html>
