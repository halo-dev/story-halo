<#--
归档页面

@package custom
-->
<#include "header.ftl">
<@header title="Archive - ${blog_title!}"></@header>
<div class="container-fluid">
    <div class="row">
        <div id="main" class="col-12 clearfix" role="main">
            <article class="posti" itemscope itemtype="http://schema.org/BlogPosting">
                <!-- 总分类&标签 -->
                <h3>Something</h3>
                <div class="post-tags">
                    <!-- 分类 -->
                    <h4>Category</h4>
                    <ul>
                    <@categoryTag method="list">
                        <#if categories?size gt 0>
                            <#list categories as category>
                                <li rel="tag"><a href="${category.fullPath!}">${category.name}</a></li>
                            </#list>
                        </#if>
                    </@categoryTag>
                    </ul>
                    <!-- 标签 -->
                    <h4>Tag</h4>
                    <ul>
                    <@tagTag method="list">
                        <#if categories?size gt 0>
                            <#list tags as tag>
                                <li rel="tag"><a href="${tag.fullPath!}">${tag.name}</a></li>
                            </#list>
                        </#if>
                    </@tagTag>
                    </ul>
                </div>

                <h3>Post</h3>
                <div id="archives">
                <@postTag method="archiveYear">
                    <#list archives as archive>
                    <h4>${archive.year} 年</h4>
                    <ul>
                        <#list archive.posts?sort_by("createTime")?reverse as post>
                            <li>${post.createTime?string('MM月dd日')}：
                                <a href="${post.fullPath!}">${post.title!}</a>
                            </li>
                        </#list>
                    </ul>
                    </#list>
                </@postTag>
                </div>
            </article>
        </div>
    </div>
</div>
<#include "footer.ftl">
