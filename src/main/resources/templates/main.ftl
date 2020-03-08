<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
    <div>
    <@l.logout/>
    </div>

    <div>
    <form method="post" action="addUser">
    <input type="text" name="text" placeholder="Enter your message:"/>
    <input type="text" name="tag" placeholder="TAG:"/>
    <button type="submit">ADD MESSAGE</button>
    <div><input type="hidden" name="_csrf" value="${_csrf.token}"/></div>
    </form>
    </div>
    <div>LIST OF MESSAGES:</div>
    <form method="get" action="/main">
    <input type="text" name="tag" value="${tag}"/>
    <button type="submit">Find by TAG</button>
    </form>
    <#list messages as message>
        <div>
        <b>${message.id}</b>
        <span>${message.text}</span>
        <i>${message.tag}</i>
        <strong>${message.authorName}</strong>
        </div>
    <#else >
        No messages
    </#list>

    <div>
    <form method="post" action="/delete">
    <input type="text" name="id" placeholder="ID" action="delete"/>
    <button type="submit">DELETE MESSAGE BY ID</button>
    <div><input type="hidden" name="_csrf" value="${_csrf.token}"/></div>
    </form>
    </div>

</@c.page>