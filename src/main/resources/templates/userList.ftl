<#import "parts/common.ftl" as c>
<@c.page>
    List of users
    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Role</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.username}</td>
                <td><#list user.roles as role>${role}<#sep >, </#list></td>
                <td><a href="/user/${user.id}">edit</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
    <br>
    <div>
        <form method="get" action="/main">
            <button type="submit" style="font-weight:bold">Return to main page</button>
        </form>
    </div>
</@c.page>