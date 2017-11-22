//获取屏幕可视区域宽高
function getWindowSize() {
    var cHeight = document.documentElement.clientHeight || document.body.clientHeight,
        cWidth = document.documentElement.clientWidth || document.body.clientWidth,
        obj = {
            width: cWidth,
            height: cHeight
        };
    return obj;
}