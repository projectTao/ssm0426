$(function () {
    $("#exitLogin").click(function () {
        var msg = confirm("请确认是否要退出系统");
        if (msg==true){
            window.location = '/workspace/users/delLogin';
        }
    })

    $("#salePrice").blur(salePrice);
    $("#saleNum").blur(saleNum);
    $("#v_index").blur(v_index);

    $("#submit").click(function () {
        var $v_index = $("#v_index");
        if ($v_index.val() == "" || $v_index.val() == "title" ){
            alert("请选择商品！");
        }
        var flag=true;
        if(!salePrice){flag=false;}
        if(!saleNum){flag=false;}
        if(!v_index){flag=false;;}
        return flag;
    });

        var salePrice = $(".sale_div_price");
        var saleNum = $(".sale_div_num");
        var priceNull = "<span id='span_a' >销售单价不能为空</span>";
        var NumNull = "<span id='span_c'>销售数量不能为空</span>";
        var NumInt ="<span id='span_d'>销售数量必须是整数</span>";
    function salePrice() {
        $("#salePrice").blur(function () {
            var $salePrice = $("#salePrice");
            var regPrice = /^[1-9]\d*$/;
            if ($salePrice.val() == "") {
                $("#span_a").remove()
                salePrice.append(priceNull);
                // alert("销售单价不能为空");
                return false;
            }
            $("#span_a").remove()
            return true;
        })
    }
    function saleNum(){
        var $saleNum=$("#saleNum");
        var regNum = /^[1-9]\d*$/;
        if($saleNum.val()==""){
            $("#span_c").remove();
            $("#span_d").remove()
            saleNum.append(NumNull);
            // alert("销售数量不能为空");
            return false;
        }
        if (regNum.test($saleNum.val())==false){
            $("#span_c").remove();
            $("#span_d").remove()
            saleNum.append(NumInt);
            // alert("销售数量必须是整数！")
            return false;
        }
        $("#span_c").remove();
        $("#span_d").remove()
        return true;
    }
    function v_index() {
       var $v_index = $("#v_index");
        if ($v_index.val() == "" || $v_index.val() == "title" ){
            alert("请选择商品！");
            return false;
        }
        return true;
    }
})