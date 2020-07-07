<?
<body>
  <a name="top" id="top"></a>

  <div id="Container">
    <div id="Content">
      <div class="c25">
      </div><a name="0"></a>

      <h3><a name="0">NAME</a></h3>

      <blockquote>
        <b>snum0(3f)</b> - [M_calculator] resolve a calculator expression into a <b>string</b>(return blank on errors) <b>(LICENSE:PD)</b>
      </blockquote><a name="contents" id="contents"></a>

      </blockquote><a name="8"></a>

      <h3><a name="8">SYNOPSIS</a></h3>

      <blockquote>
        <pre>
function <b>snum0</b>(inline0,ierr)
<br />   character(len=:),allocatable :: snum0(inline0)
   character(len=*),intent(in)  :: inline0                           ! input string
   integer,optional,intent(out) :: ierr
<br />
</pre>
      </blockquote><a name="2"></a>

      <h3><a name="2">DESCRIPTION</a></h3>

      <blockquote>
        <b>SNUM0</b>() is used to return a string value up to (iclen_calc=512) characters long from a string expression. <b>SNUM0</b>() uses the calculator
        routine <b>CALCULATOR</b>(3f)

        <table cellpadding="3">

          <tr valign="top">
            <td class="c26" colspan="2">inline0</td>
          </tr>

          <tr valign="top">
            <td width="6%"></td>

            <td>INLINE0 is a CHARACTER variable up to (iclen_calc=512) characters long that is similar to a FORTRAN 77 expression.</td>
          </tr>

          <tr valign="top">
            <td class="c26" width="6%" nowrap="nowrap">ierr</td>

            <td valign="bottom">error code. If zero, no error occurred</td>
          </tr>

        </table>
      </blockquote><a name="3"></a>

      <h3><a name="3">EXAMPLES</a></h3>

      <blockquote>
        Sample program:
        <pre>
    program demo_snum0
    use m_calculator, only: rnum0, snum0
    character(len=80)  :: ic,jc,kc
<br />    rdum=rnum0('A=83/2') ! set a variable in the calculator
    kc=snum0('$MYTITLE="This is my title variable"')
<br />    ic=snum0('$STR("VALUE IS [",A,"]")')
    jc=snum0('$MYTITLE')
<br />    write(*,*)'IC=',trim(ic)
    write(*,*)'JC=',trim(jc)
    write(*,*)'KC=',trim(kc)
<br />    end program demo_snum0
<br />
</pre>

        <blockquote>
          The output should look like
          <pre>
     IC=VALUE IS [41.5]
     JC=This is my title variable
     KC=This is my title variable
<br />
</pre>
        </blockquote>
      </blockquote><a name="4"></a>

      <h3><a name="4">DEPENDENCIES</a></h3>

      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td width="3%">o</td>

            <td>User-supplied routines: All programs that call the calculator routine can supply their own <b>substitute_subroutine</b>(3f) and
            <b>substitute_C</b>(3f) procedures. See the example program for samples.</td>
          </tr>

        </table>
      </blockquote><a name="5"></a>

      <h3><a name="5">SEE ALSO</a></h3>

      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td width="3%">o</td>

            <td>The syntax of an expression is described in the main document of the Calculator Library.</td>
          </tr>

          <tr valign="top">
            <td width="3%">o</td>

            <td>See <b>CALCULATOR</b>(), <b>RNUM0</b>(), <b>SNUM0</b>(), <b>EXPRESSION</b>().</td>
          </tr>

        </table>
      </blockquote><a name="6"></a>

    </div>
  </div>
</body>
</html>
