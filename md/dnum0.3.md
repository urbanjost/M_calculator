<?
<body>
  <a name="top" id="top"></a>

  <h5><a href="download.html">[UP]</a></h5>

  <div id="Container">
    <div id="Content">
      <div class="c9">
      </div><a name="0"></a>

      <h3><a name="0">NAME</a></h3>

      <blockquote>
        <b>dnum0(3f)</b> - [M_calculator] return double precision value from string expression using <b>calculator</b>(3f) <b>(LICENSE:PD)</b>
      </blockquote><a name="contents" id="contents"></a>

      <h3><a name="7">SYNOPSIS</a></h3>

      <blockquote>
        <pre>
doubleprecision function <b>dnum0</b>(inline,ierr)
<br />   character(len=*),intent(in) :: inline
   integer,optional,intent(out) :: ierr
<br />
</pre>
      </blockquote><a name="2"></a>

      <h3><a name="2">DESCRIPTION</a></h3>

      <blockquote>
        <b>DNUM0</b>() is used to return a DOUBLEPRECISION value from a CHARACTER string representing a numeric expression.

        <blockquote>
          <table cellpadding="3">

            <tr valign="top">
              <td width="3%">o</td>

              <td>If an error occurs in evaluating the expression <b>INUM</b>() returns <b>zero</b>(0).</td>
            </tr>

            <tr valign="top">
              <td width="3%">o</td>

              <td><b>DNUM0</b>() ultimately uses the calculator routine <b>CALCULATOR</b>(3f)</td>
            </tr>

          </table>
        </blockquote>

        <table cellpadding="3">
          <tr valign="top">
            <td class="c10" width="6%" nowrap="nowrap">inline</td>

            <td valign="bottom">
              INLINE is a CHARACTER variable up to (iclen_calc=255) characters long that is similar to a FORTRAN 77 numeric expression.

              <table width="100%" cellpadding="3">

                <tr valign="top">
                  <td class="c10" width="6%" nowrap="nowrap">ierr</td>

                  <td valign="bottom">error code. If zero, no error occurred</td>
                </tr>

              </table>
            </td>
          </tr>

        </table>
      </blockquote><a name="3"></a>

      <h3><a name="3">EXAMPLES</a></h3>

      <blockquote>
        Sample Program
        <pre>
    program demo_dnum0
    use M_calculator, only : dnum0
    doubleprecision x,y,z
    X=DNUM0('20/3.4')
    Y=DNUM0('CI = 10 * sin(3.1416/4)')
    Z=DNUM0('CI')
    write(*,*)x,y,z
    end program demo_dnum0
<br />
</pre>
      </blockquote><a name="4"></a>

      <h3><a name="4">SEE ALSO</a></h3>

      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td width="3%">o</td>

            <td>The syntax of an expression is as described in the main documentation of the Calculator Library.</td>
          </tr>

          <tr valign="top">
            <td width="3%">o</td>

            <td>See <b>EXPRESSION</b>(), <b>CALCULATOR</b>(), <b>RNUM0</b>(), <b>SNUM0</b>().</td>
          </tr>

        </table>
      </blockquote><a name="5"></a>

    </div>
  </div>
</body>
</html>
