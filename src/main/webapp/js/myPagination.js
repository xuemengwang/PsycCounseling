//使用说明
/**
 * 依次引入jquery.js、bootstrap.js、bootstrap.css、该js
 * @param div 存放分页的容器
 * @param length 显示的分页按钮个数
 * @param curPage 激活按钮页码
 * @param allPage 总页数
 *
 * 示例：
 *
 * <div id="pagination"></div>
 *
 * $(function () {
 *       var div = $("#pagination");
 *       var curPage = ${pageBean.curPage};
 *       var allPage = ${pageBean.allPage};
 *       var length = 5;
 *       paginationConstructor(div, length, curPage, allPage);
 *   });
 *
 *
 */

function paginationConstructor(div, length, curPage, allPage) {
    //生成页面
    div.html(
        "<nav>" +
        "<ul class='pager'>" +
        "<li><a id='pageFirst'>首页</a></li>" +
        "<li><a id='PagePre'>上一页</a></li>" +
        "<li id='pageOrders'></li>" +
        "<li><a id='PageNext'>下一页</a></li>" +
        "<li><a id='pageLast'>尾页</a></li>" +
        "</ul>" +
        "</nav>"
    );
    for (var i = 0; i < length; i++) {
        $("#pageOrders").append(
            "<li><a class='pageOrder'></a></li>"
        );
    }

    //计算分页栏的第一页从哪开始，并确保length为偶数时，左边按钮比右边少一个，例如4：0100
    var firstPageId;
    firstPageId = (curPage - Math.floor((length - 1) / 2)) > 0 ? curPage - Math.floor((length - 1) / 2) : 1;
    if (curPage + Math.ceil((length - 1) / 2) > allPage) {
        firstPageId = allPage - (length - 1);
        if (firstPageId < 1) {
            firstPageId = 1;
        }
    }
    //获得按钮
    var first = $("#pageFirst");
    var pre = $("#PagePre");
    var pageList = $(".pageOrder");
    var next = $("#PageNext");
    var last = $("#pageLast");
    //按钮链接与文本处理
    first.attr("href", 1);
    pre.attr("href", curPage - 1);
    next.attr("href", curPage + 1);
    last.attr("href", allPage);
    pageList.each(function (i) {
        // 为按钮添加链接和文本
        $(this).attr("href", firstPageId + i);
        $(this).text(firstPageId + i);
        //使当前按钮不可点击
        if ($(this).text() === curPage.toString()) {
            $(this).css("pointer-events", "none").css("opacity", "0.6");
        }
        //使多余按钮不显示
        if (parseInt($(this).text()) > allPage) {
            $(this).css("display", "none");
        }

    });

    //分页按钮显示处理
    if (curPage === 1) {
        // 屏蔽上一页按钮
        pre.css("pointer-events", "none").css("opacity", "0.6");
    }
    if (curPage === allPage) {
        // 屏蔽下一页按钮
        next.css("pointer-events", "none").css("opacity", "0.6");
    }
}
