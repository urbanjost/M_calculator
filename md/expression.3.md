<?
<body>
  <a name="top" id="top"></a>

  <h5><a href="download.html">[UP]</a></h5>

  <div id="Container">
    <div id="Content">
      <div class="c13">
      </div><a name="0"></a>

      <h3><a name="0">NAME</a></h3>

      <blockquote>
        <b>expression(3f)</b> - [M_calculator] return value from a string expression processing messages to simplify call to <b>CALCULATOR</b>(3f)
        <b>(LICENSE:PD)</b>
      </blockquote><a name="contents" id="contents"></a>

      <h3><a name="8">SYNOPSIS</a></h3>

      <blockquote>
        <pre>
subroutine <b>expression</b>(inlin0,outval,outlin0,ierr,ilen)
<br />    character(len=*), intent=(in)  :: inlin0
    doubleprecision, intent=(out)  :: outval
    character(len=*), intent=(out) :: outlin0
    integer, intent=(out)          :: ierr
    integer, intent=(out)          :: ilen
<br />
</pre>
      </blockquote><a name="2"></a>

      <h3><a name="2">DESCRIPTION</a></h3>

      <blockquote>
        <b>expression</b>() takes a string containing a FORTRAN-like expression and evaluates it and returns a numeric or string value as appropriate. The
        main purpose of <b>expression</b>() is to assume the burden of displaying the calculator messages for codes that make multiple calls to
        <b>CALCULATOR</b>(3f). <b>CALCULATOR</b>(3f) does not display error messages directly.

        <blockquote>
          <table cellpadding="3">

            <tr valign="top">
              <td width="3%">o</td>

              <td><b>EXPRESSION</b>(3f) calls the calculator routine <b>CALCULATOR</b>(3f) to evaluate the expressions.</td>
            </tr>

            <tr valign="top">
              <td width="3%">o</td>

              <td>Messages beginning with a # are considered comments and are not passed on to the calculator.</td>
            </tr>

          </table>
        </blockquote>

        <table cellpadding="3">
          <tr valign="top">
            <td class="c14" width="6%" nowrap="nowrap">inlin0</td>

            <td valign="bottom">INLIN0 is a string containing a numeric expression. The expression can be up to (iclen_calc=512) characters long. The syntax
            of an expression is as described in the main document of the Calc library. For example:</td>
          </tr>

          <tr>
            <td colspan="2">
              <pre>
              'A=sin(3.1416/5)'
              '# this is a comment'
              '$STR("The value is ",40/3)'
<br />
</pre>
            </td>
          </tr>

          <tr valign="top">
            <td class="c14" width="6%" nowrap="nowrap">outval</td>

            <td valign="bottom">OUTVAL is a numeric value calculated from the expression in INLIN0 (when IERR returns 0). When a string value is returned
            (IERR=2) then OUTVAL is the length of the output string.</td>
          </tr>

          <tr valign="top">
            <td class="c14" colspan="2">outlin0</td>
          </tr>

          <tr valign="top">
            <td width="6%"></td>

            <td>OUTLIN0 contains a string representation of the number returned in OUTVAL up to 23 characters long when INLIN0 is a numeric expression. It
            contains a string up to (iclen_calc=512) characters long when INLIN0 is a string expression.</td>
          </tr>

          <tr valign="top">
            <td class="c14" width="6%" nowrap="nowrap">ierr</td>

            <td valign="bottom">
              IERR returns

              <table width="100%" cellpadding="3">

                <tr valign="top">
                  <td width="3%">o</td>

                  <td><b>-1</b> if an error occurred</td>
                </tr>

                <tr valign="top">
                  <td width="3%">o</td>

                  <td>0 if a numeric value is returned (value is in OUTVAL, string representation of the value is in OUTLIN2).</td>
                </tr>

                <tr valign="top">
                  <td width="3%">o</td>

                  <td>1 if no value was returned but a message was displayed (If a 'dump' or 'funcs' command was passed to the calculator).</td>
                </tr>

                <tr valign="top">
                  <td width="3%">o</td>

                  <td>2 if the expression evaluated to a string value instead of a numeric value (value is in OUTLIN0).</td>
                </tr>

              </table>
            </td>
          </tr>

          <tr valign="top">
            <td class="c14" width="3%" nowrap="nowrap">ilen</td>

            <td valign="bottom">ILEN returns the length of the input string minus trailing blanks.</td>
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
        Sample program:
        <pre>
    program demo_expression
    use M_calculator,      only : iclen_calc
    use M_calculator, only : expression
    character(len=iclen_calc) ::  outlin0
    doubleprecision :: outval
    call expression('A=3.4**5    ',outval,outlin0,ierr,ilen)
    write(*,*)'value of expression is ',outval
    write(*,*)'string representation of value is ',trim(outlin0)
    write(*,*)'error flag value is ',ierr
    write(*,*)'length of expression is ',ilen
    end program demo_expression
<br />
</pre>
      </blockquote>Results:
      <pre>
    value of expression is    454.35424000000000
    string representation of value is 454.35424
    error flag value is            0
    length of expression is            8
<br />
</pre><a name="5"></a>

      <h3><a name="5">SEE ALSO</a></h3>

      <blockquote>
        See also: RNUM0(),<b>CALCULATOR</b>(),INUM0(),SNUM0()
      </blockquote><a name="6"></a>

    </div>
  </div>
</body>
</html>
