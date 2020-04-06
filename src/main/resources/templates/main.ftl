<#import "parts/common.ftl" as c>
<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="tag" class="form-control" value="${tag?if_exists}"
                       placeholder="Search by tag"/>
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        Add new Message
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" action="addUser" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control" name="text" placeholder="Enter your message:"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="tag" placeholder="TAG:"/>
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                </div>
                <div><input type="hidden" name="_csrf" value="${_csrf.token}"/></div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">ADD MESSAGE</button>
                </div>
            </form>
        </div>
    </div>
    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <div>
                    <#if message.filename??>
                        <img src="/img/${message.filename}" class="card-img-top">
                    </#if>
                </div>
                <div class="m-2">
                    <b>${message.id}</b>
                    <span>${message.text}</span>
                    <i>${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    <strong>${message.authorName}</strong>
                </div>

            </div>
        <#else >
            No messages
        </#list>
    </div>
    <div>
    </div>
    <div>
        <form method="post" action="/delete">
            <input type="text" name="id" placeholder="ID" action="delete"/>
            <button type="submit">DELETE MESSAGE BY ID</button>
            <div><input type="hidden" name="_csrf" value="${_csrf.token}"/></div>
        </form>
    </div>
</@c.page>