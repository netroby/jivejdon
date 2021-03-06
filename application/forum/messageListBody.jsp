<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<a name="<bean:write name="forumMessage" property="messageId"/>"></a>
<logic:equal name="i" value="0">
  <logic:notEmpty name="principal">
    <logic:equal name="loginAccount" property="roleName" value="Admin">
      <p> <a
        href="javascript:stickyThread('<bean:write name="forumMessage" property="forumThread.threadId"/>','announce_all','change','<bean:write name="forumMessage" property="forumThread.forum.forumId"/>')">全公告</a>
      <a href="javascript:stickyThread('<bean:write name="forumMessage" property="forumThread.threadId"/>','sticky_all','change','<bean:write name="forumMessage" property="forumThread.forum.forumId"/>')">全置顶</a>
      <a href="javascript:stickyThread('<bean:write name="forumMessage" property="forumThread.threadId"/>','sticky','change','<bean:write name="forumMessage" property="forumThread.forum.forumId"/>')">置顶</a>
      <a href="javascript:stickyThread('<bean:write name="forumMessage" property="forumThread.threadId"/>','announce','change','<bean:write name="forumMessage" property="forumThread.forum.forumId"/>')">公告</a>
      <a href="javascript:stickyThread('<bean:write name="forumMessage" property="forumThread.threadId"/>','announce_all','delete','<bean:write name="forumMessage" property="forumThread.forum.forumId"/>')">取消</a>
    </logic:equal>
  </logic:notEmpty>
</logic:equal>

<div class="row">
  <div class="col-md-12">
    <div class="box">
      <logic:equal name="forumMessage" property="root" value="false">
      <div class="frame-yy">
        </logic:equal>
        <div class="post_header">
          <div class="post_title">
            <logic:equal name="forumMessage" property="root" value="true">
              <div class="post_titlename">
                <h2>
                  <logic:notEmpty name="forumMessage" property="messageVO.linkUrl">
                    <a href="<bean:write name="forumMessage" property="messageVO.linkUrl" filter="false"/>" target="_blank">
                      <span id='subject_<bean:write name="forumMessage" property="messageId"/>'>
                        <bean:write name="forumMessage" property="messageVO.subject"/></span>
                    </a>
                  </logic:notEmpty>
                  <logic:empty name="forumMessage" property="messageVO.linkUrl">
                    <span id='subject_<bean:write name="forumMessage" property="messageId"/>'>
                      <bean:write name="forumMessage" property="messageVO.subject"/></span>
                  </logic:empty>
                </h2>
              </div>
            </logic:equal>

            <logic:equal name="forumMessage" property="root" value="true">
              <div class="post_titletag">
                <logic:iterate id="threadTag" name="forumThread" property="tags" indexId="tagsi">
                  <a href='<%=request.getContextPath() %>/tags/<bean:write name="threadTag" property="tagID"/>' target="_blank" class="post-tag">
                    <bean:write name="threadTag" property="title"/>
                  </a> &nbsp;&nbsp;&nbsp;&nbsp;
                </logic:iterate>
              </div>
            </logic:equal>

            <div class="post_title2">
              <div class="post_titleauthor info">
                <logic:notEmpty name="forumMessage" property="account">
					<i class="fa fa-user"></i>
				  <a href='<%=request.getContextPath()%>/blog/<bean:write name="forumMessage" property="account.username"/>' class="smallgray">
                    <bean:write name="forumMessage" property="account.username"/>
                  </a>
                </logic:notEmpty>
				  <span></span>  
			    <logic:equal name="forumMessage" property="root" value="true">
                    <i class="fa fa-calendar"></i>
                    <bean:define id="cdate" name="forumThread" property="creationDate"></bean:define>
                    <%String cdateS = (String) pageContext.getAttribute("cdate"); %><%=cdateS.substring(2, 11) %>
                  <span></span>
                  <a href="javascript:void(0);" onclick="loadWLJSWithP('<bean:write name="forumMessage" property="messageId"/>',loadWPostjs)">
                    <i class="fa fa-commenting-o"></i> </a>
               </logic:equal>
	  
              </div>

              <logic:equal name="forumMessage" property="root" value="false">
                <div class="post_titledate">
                  <div class="smallgray" id='creationDate_<bean:write name="forumMessage" property="messageId"/>'>
                    <bean:write name="forumMessage" property="creationDate"/>
                  </div>
                </div>
              </logic:equal>

              <div class="post_titleother">
                <logic:equal name="messageListForm" property='<%= "authenticated[" + i + "]" %>' value="true">
                  <a href='<html:rewrite page="/message/messageAction.shtml?action=edit" paramId="messageId" paramName="forumMessage" paramProperty="messageId" />' rel='nofollow'>
                    编辑
                  </a>
                  <logic:equal name="forumMessage" property="root" value="true">
                    <a href='<html:rewrite
            page="/message/updateViewAction.shtml?action=edit"
            paramId="threadId" paramName="forumMessage"
            paramProperty="forumThread.threadId" />' rel='nofollow'>编辑标题 </a>

                    <a href='<html:rewrite
            page="/message/tag/thread.shtml?action=edit"
            paramId="threadId" paramName="forumMessage"
            paramProperty="forumThread.threadId" />' rel='nofollow'>编辑标签 </a>
                  </logic:equal>
                </logic:equal>
              </div>
            </div>

          </div>
        </div>
        <div class="post_body">
          <div class="post_bodyin">
            <div class="post_body_content">
              <logic:present name="forumMessage" property="reBlogVO.messageFrom">
                <bean:define id="messageFrom" name="forumMessage" property="reBlogVO.messageFrom"/>
              <div class="reblogfrom"> 转自:<a
                  href="<%=request.getContextPath()%>/nav/<bean:write name="messageFrom" property="messageId"/>/<bean:write name="messageFrom" property="messageId"/>#<bean:write name="messageFrom" property="messageId"/>"
                  rel="nofollow">
                <bean:write name="messageFrom" property="forumThread.name"/>
              </a></div>
              </logic:present>
              <h1 class="tpc_content"
                  id='body_<bean:write name="forumMessage" property="messageId"/>'>
                <bean:write name="forumMessage" property="messageVO.body" filter="false"/>
              </h1>
              <logic:notEmpty name="forumMessage" property="reBlogVO.messageTos">
              <logic:iterate id="forumMessageTo" name="forumMessage" property="reBlogVO.messageTos">
              <div class="reblogto"> 转发至:<a
                  href="<%=request.getContextPath()%>/<bean:write name="forumMessageTo" property="forumThread.threadId"/>">
                <bean:write name="forumMessageTo" property="messageVO.subject"/>
              </a></div>
              </logic:iterate>
              </logic:notEmpty>
<p></p>
</div>
<logic:equal name="forumMessage" property="root" value="true">
  <div class=diggArea>
    <DIV class=diggNum id="digNumber_<bean:write name="forumMessage" property="messageId"/>">
      <logic:notEqual name="forumMessage" property="digCount" value="0">
        <bean:write name="forumMessage" property="digCount"/>
      </logic:notEqual>
    </DIV>
    <DIV class="diggLink top8"
         id="textArea_<bean:write name="forumMessage" property="messageId"/>"><a
        href="javascript:digMessage('<bean:write name="forumMessage" property="messageId"/>')">赞</a>
    </DIV>
  </div>
</logic:equal>

</div>
</div>
<logic:equal name="forumMessage" property="root" value="false">
  </div>
</logic:equal>
</div>
</div>
</div>
	
