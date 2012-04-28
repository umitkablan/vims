XPTemplate priority=lang


XPTvar $TRUE           1
XPTvar $FALSE          0
XPTvar $NULL           NULL

XPTvar $BRif           ' '
XPTvar $BRloop         ' '
XPTvar $BRstc          ' '
XPTvar $BRfun          \n

XPTvar $VOID_LINE      /* void */;
XPTvar $CURSOR_PH      /* cursor */

XPTinclude
      \ _common/common

XPTvar $CL  /*
XPTvar $CM   *
XPTvar $CR   */
XPTinclude
      \ _comment/doubleSign

XPTinclude
      \ _condition/c.like
      \ _func/c.like
      \ _loops/c.while.like
      \ _preprocessor/c.like
      \ _structures/c.like
      \ _printf/c.like

XPTinclude
      \ _loops/for


let s:f = g:XPTfuncs()



XPT _printfElts hidden 
XSET elts|pre=Echo('')
XSET elts=c_printf_elts( R( 'pattern' ), ',' )
"`pattern^"`elts^


XPT printf	" printf\(...)
printf(`:_printfElts:^)


XPT sprintf	" sprintf\(...)
sprintf(`str^,`$SPop^`:_printfElts:^)


XPT snprintf	" snprintf\(...)
snprintf(`str^,`$SPop^`size^,`$SPop^`:_printfElts:^)


XPT fprintf	" fprintf\(...)
fprintf(`stream^,`$SPop^`:_printfElts:^)

XPT memcpy " memcpy (..., ..., sizeof (...) ... )
memcpy(`dest^,`$SPop^`source^,`$SPop^sizeof(`type^int^)`$SPop^*`$SPop^`count^)

XPT memset " memset (..., ..., sizeof (...) ... )
memset(`buffer^,`$SPop^`what^0^,`$SPop^sizeof(`$SParg^`type^int^`$SParg^)`$SPop^*`$SPop^`count^)

XPT malloc " malloc ( ... );
(`type^int^*)malloc(sizeof(`$SParg^`type^`$SParg^)`$SPop^*`$SPop^`count^)

XPT assert	" assert (.., msg)
assert(`isTrue^,`$SPop^"`text^")


XPT fcomment
/**
 * @author : `$author^ | `$email^
 * @description
 *     `cursor^
 * @return {`int^} `desc^
 */


XPT para syn=comment	" comment parameter
@param {`Object^} `name^ `desc^

XPT filehead
XSET cursor|pre=CURSOR
/**-------------------------/// `sum^ \\\---------------------------
 *
 * <b>`function^</b>
 * @version : `1.0^
 * @since : `strftime("%Y %b %d")^
 *
 * @description :
 *     `cursor^
 * @usage :
 *
 * @author : `$author^ | `$email^
 * @copyright `.com.cn^
 * @TODO :
 *
 *--------------------------\\\ `sum^ ///---------------------------*/

..XPT


XPT call wraponly=param " ..( .. )
`name^(`$SParg^`param^`$SParg^)

