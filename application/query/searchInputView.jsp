<%@ page contentType="text/html; charset=UTF-8" %>

<script type="text/javascript" src="/common/js/prototype.js"></script>
<script language="javascript" src="/common/js/autocomplete.js"></script>

<script type="text/JavaScript">
    function changeAction(theForm) {

        if (theForm.view[0].checked) {
            theForm.action = '<%=request.getContextPath()%>/query/searchThreadAction.shtml'
        } else if (theForm.view[1].checked) {
            theForm.action = '<%=request.getContextPath()%>/query/searchAction.shtml'

        }
    }

    function loadAcJS(thisId) {
        if (typeof(ac) == 'undefined') {
            $LAB
                .script('/common/js/autocomplete.js')
                .wait(function () {
                    ac(thisId, '<%=request.getContextPath()%>');
                })
        } else
            ac(thisId, '<%=request.getContextPath()%>');
    }

</script>


<logic:notPresent name="query">
    <bean:parameter name="query" id="query" value=""/>
</logic:notPresent>
<table class="table table-striped">
    <tbody>
    <tr>
        <td align="middle">
            <html:form action="/query/searchThreadAction.shtml" method="post"
                       styleClass="search" onsubmit="changeAction(this);">
                <input type="text" name="query"
                       value="<bean:write name="query"/>" id="queryId"
                       onfocus="javascript:loadAcJS(this.id)" size="40"/>
                <html:submit value="道场搜索"/>
                <input type="radio" name="view" checked="checked"/>查询主题
                <input type="radio" name="view"/>查询帖

            </html:form>
        </td>
    </tr>
    </tbody>
</table>

