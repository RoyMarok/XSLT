

<xsl:template name="call2actionDash" >
{B{SCRIPT$RICOS_DROP}E}
<style>
.rDropTarget{
    border-radius: 3px;
    position: fixed;
    bottom: 80px;
}
.rDropTarget .call2actionList+.arrow.bottom{
    bottom: -9px;
}
.call2action .rDrop{
    position: fixed;
    right: 20px;
    bottom: 20px;
    width: 48px;
    height: 48px;
    border-radius: 50%;
    background-color: #2074BA;
    transition: all .1s;
    background-image: url(/portal_static/img/icons/dashboard/gear.png);
    background-repeat: no-repeat;
    cursor: pointer;
    -moz-box-shadow: 0px 5px 5px rgba(0, 51, 102, 0.25);
    -webkit-box-shadow: 0px 5px 5px rgba(0, 51, 102, 0.25);
    box-shadow: 0px 5px 5px rgba(0, 51, 102, 0.25);
    background-position: 50% 50%;
}
.call2action:hover .rDrop,
.call2action.showed .rDrop{
    -moz-box-shadow: 0px 5px 16px rgba(0, 51, 102, 0.25);
    -webkit-box-shadow: 0px 5px 16px rgba(0, 51, 102, 0.25);
    box-shadow: 0px 5px 16px rgba(0, 51, 102, 0.25);
    bottom: 21px;
    background-color: #0072FF;
}
.call2action:hover .rDrop, .call2actionList li:hover{
    background-color: #0072FF;
    transition: all .1s;
    color: white;
}
ul.call2actionList{
    display: flex;
    flex-direction: column;
    /*padding: 6px 0;*/
}
.call2actionList li{
    color: #7D8FA4;
    position: relative;
    cursor: pointer;
    padding: 10px;
    list-style-type: none;
    padding-left: 45px;
    padding-right: 20px;
    transition: all .1s;
}
.call2actionList li:first-child{
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}
.call2actionList li:last-child{
    border-bottom-left-radius: 3px;
    border-bottom-right-radius: 3px;
}
.call2actionList li a,
.call2actionList li:hover a
{
    text-decoration: none;
    color: inherit;
}

.call2actionList li:before{
    content: '';
    width: 23px;
    height: 23px;
    position: absolute;
    margin-left: -30px;
    background-image: url(/portal_static/img/icons/docDown_grey.png);
    background-repeat: no-repeat;
    top: 7px;
}

.call2actionList li:hover:before{
    background-image: url(/portal_static/img/icons/docDown_white.png);

}

.call2actionList li.printIcon:before,
.call2actionList li.printIcon:hover:before
{
    background-image: url(/portal_static/img/icons/dashboard/print.png);
    background-repeat: no-repeat;
}
.call2actionList li.saveIcon:before,
.call2actionList li.saveIcon:hover:before
{
    background-image: url(/portal_static/img/icons/dashboard/disk.png);
    background-repeat: no-repeat;
}
.rDropTarget .arrow:after{
    transition: all .1s;
}
.rDropTarget .arrow.bottom.blueColor:after{
    border-color: #0072ff transparent;
    transition: all .1s;
}
</style>

<script>
<![CDATA[
$(function(){
    $('.call2action').ricosDrop();
    $('.rDrop').click(function(){
        $('.call2actionList').parents('.rDropTarget').css('top', '');
    });
    $(document).on('mouseenter', '.ricosDropWrapper .call2actionList li:last-child', function(){
        $('.rDropTarget .arrow.bottom').addClass('blueColor');

    });
    $(document).on('mouseleave', '.ricosDropWrapper .call2actionList li:last-child', function(){
        $('.rDropTarget .arrow.bottom').removeClass('blueColor');
    });

});
]]>
</script>
<!--xsl:if test="normalize-space(//IS_CAB_BUILDER) = '1'"-->
<div class="call2action">
    <div class="rDrop"></div>
    <div class="rDropTarget"  style="display: none;">
        <ul class="call2actionList">
            <li class="printIcon"><a href="/ugd/submit/simpleSubmit.action" onclick="">Распечатать сводку</a></li>
            <li class="saveIcon"><a href="/ugd/submit/simpleSubmit.action" onclick="">Сохранить отчет</a></li>
        </ul>
    </div>
</div>
<!--/xsl:if-->
</xsl:template>

