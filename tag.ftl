<#include "header.ftl">
<@header title="${tag.name} - ${blog_title!}"></@header>
<div class="container-fluid">
    <div class="row">
        <div class="archive-header">
            <span>- Tag · ${tag.name} -</span>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <div id="main" role="main">
            <ul class="post-list clearfix">
                <#if posts.content?size gt 0>
                <#list posts.content as post>
                <li class="post-item grid-item" itemscope itemtype="http://schema.org/BlogPosting">
                    <a class="post-link" href="${post.fullPath!}">
                        <h3 class="post-title"><time class="index-time" datetime="${post.createTime}" itemprop="datePublished">${post.createTime?string('MMM d,yyyy')}</time><br>${post.title!}</h3>
                        <div class="post-meta">
                            <#if post.categories?? && post.categories?size gt 0>
                                ${post.categories[0].name}
                            </#if>
                        </div>
                    </a>
                </li>
                </#list>
                <#else >
                <br><br>
                <h2 class="post-title"><center>(´°̥̥̥̥̥̥̥̥ω°̥̥̥̥̥̥̥̥｀) 什么都没有找到唉...</center></h2>
                </#if>
            </ul>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <#if posts.totalPages gt 1>
            <div class="nav-page">
                <ol class="page-navigator">
                    <@paginationTag method="tagPosts" page="${posts.number}" total="${posts.totalPages}" display="3" slug="${tag.slug!}">
                        <#if pagination.hasPrev>
                            <li class="prev">
                                <a href="${pagination.prevPageFullPath!}">&laquo;</a>
                            </li>
                        </#if>
                        <li>
                            <a href="#">${posts.number+1}</a>
                        </li>
                        <#if pagination.hasNext>
                            <li class="next">
                                <a href="${pagination.nextPageFullPath!}">&raquo;</a>
                            </li>
                        </#if>
                    </@paginationTag>
                </ol>
            </div>
        </#if>
    </div>
</div>
<#include "footer.ftl">
