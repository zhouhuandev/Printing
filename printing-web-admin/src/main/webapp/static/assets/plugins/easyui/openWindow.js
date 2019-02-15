newWin = null;

/**
 * 创建一个模式化的dialog
 *
 * @author 李红军
 *
 * @requires jQuery,EasyUI,easyui.css,icon.css
 *
 */
modalDialog = function (options) {
    var opts = $.extend({
        title: '&nbsp;',
        width: 640,
        height: 480,
        modal: true,
        onClose: function () {
            $(this).dialog('destroy');
        }
    }, options);
    opts.modal = true;// 强制此dialog为模式化，无视传递过来的modal参数
    if (options.url) {
        opts.content = '<iframe id="" src="' + options.url + '" allowTransparency="true" scrolling="auto" width="100%" height="98%" frameBorder="0" name=""></iframe>';
    }
    return $('<div/>').dialog(opts);
};

/**
 * 仿showModalDialog打开一个窗口
 */
function openWindow(url, iWidth, iHeight) {
    var iTop = (window.screen.availHeight - 30 - iHeight) / 2; //获得窗口的垂直位置;
    var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; //获得窗口的水平位置;
    newWin = window.open(url, "newWin", "height=" + iHeight + ", width=" + iWidth + ", top=" + iTop + ", left=" + iLeft + ", toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");
    if (newWin)
        window.wd.focus();//判断窗口是否打开,如果打开,窗口前置

}

window.onfocus = function () {
    if (newWin) {
        if (!newWin.closed)
            newWin.focus();

    }

};

window.document.onfocus = function () {
    if (newWin) {
        if (!newWin.closed)
            newWin.focus();

    }

};


window.document.onclick = function () {
    if (newWin) {
        if (!newWin.closed)
            newWin.focus();

    }

};

window.document.ondblclick = function () {
    if (newWin) {
        if (!newWin.closed)
            newWin.focus();

    }

}; 