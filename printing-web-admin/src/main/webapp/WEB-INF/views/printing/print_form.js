var dialog;

function store() {
    dialog = modalDialog({
        title: '选择门店',
        width: 800,
        heigh: 300,
        url: 'store.jsp',
        buttons: [{
            text: 'Close',
            iconCls: 'icon-cancel',
            handler: function () {
                dialog.dialog('destroy');//关闭对话框
            }
        }],
        onDestroy: function () {

        }
    });
}