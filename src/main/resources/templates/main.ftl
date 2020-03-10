<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
    <br>
    <div>
    <@l.logout/>
    <br>
    <span><a href="/user">List of users</a> </span>
    </div>
    <br>
    <div>
    <form method="post" action="addUser">
    <input type="text" name="text" placeholder="Enter your message:"/>
    <input type="text" name="tag" placeholder="TAG:"/>
    <button type="submit">ADD MESSAGE</button>
    <div><input type="hidden" name="_csrf" value="${_csrf.token}"/></div>
    </form>
    <br>
    </div>
    <div>LIST OF MESSAGES:</div>
    <br>
    <form method="get" action="/main">
    <input type="text" name="tag" value="${tag?if_exists}"/>
    <button type="submit">Find by TAG</button>
    </form>
    <br>
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
        <br>
        <br>
    </div>
    <div>
    <form method="post" action="/delete">
    <input type="text" name="id" placeholder="ID" action="delete"/>
    <button type="submit">DELETE MESSAGE BY ID</button>
    <div><input type="hidden" name="_csrf" value="${_csrf.token}"/></div>
    </form>
    </div>

</@c.page>