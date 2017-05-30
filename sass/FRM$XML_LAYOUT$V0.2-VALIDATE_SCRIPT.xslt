<![CDATA[
var modalExecs = 0;
function makeFileXmlTag(obj){
    obj = (obj)?obj:$('form').eq(0);
    obj.find('.fileButton input[type="file"]')
        .closest('.fileButton')
        .siblings('.attachmentsTableWrapper')
        .find('.attachmentFileRow')
        .each(function(indx, elm){
            var fileIdInputName = 'con_contract_document__file_id';
            fileIdInputName = $(elm).parents('.fileList').attr('data-name-filename');

            $(elm).find('.file_input_js input[name="'+fileIdInputName+'"]').remove();
            var fileIdInput = $(elm).find('.file_input_js input[name="'+fileIdInputName+'"]');
            if (fileIdInput.length==0){
                $(elm).find('.file_input_js').append('<input type="hidden" name="'+fileIdInputName+'"/>');
            }
            fileIdInput = $(elm).find('.file_input_js input[name="'+fileIdInputName+'"]');
            fileIdInput.val($(elm).attr('id'));
            fileIdInput.attr('xftag', fileIdInputName);
        });
}

function inputTextValidate(obj){
    var validate = true;
    if (obj.find('.inputWrap>input[type="text"], .inputWrap>input[type="email"]').length)
    {
        var validateArr = [];
        obj.find('.inputWrap>input[type="text"], .inputWrap>input[type="email"]').each(function(indx, elm){
            validateArr.push(!!$(elm).val());
        });
        validate = !(validateArr.indexOf(false)+1);
        if (!validate){
        }
    }
    return validate;
}
function checkboxValidate(obj){
    var validate = true;
    if (obj.find('.checkbox-wrap input[type="checkbox"]').length)
    {
        validate = !!obj.find('.checkbox-wrap input[type="checkbox"]:checked').length;
        if (!validate){
        }
    }
    console.log('GOT checkboxes'+' :'+obj.find('.checkbox-wrap input[type="checkbox"]').length);
    console.log('GOT checkbox checked'+' :'+obj.find('.checkbox-wrap input[type="checkbox"]:checked').length);
    console.log('GOT checkboxValidate'+' :'+validate);
    return validate;
}
function radioValidate(obj){
    var validate = true;
    if (obj.find('input[type="radio"]').length){
        validate = !!obj.find('.inputWrap input[type="radio"]:checked').length;
    }
    console.log('GOT radioValidate'+' :'+validate);
    return validate;
}
function textareaValidate(obj){
    var validate = true;
    if (obj.find('textarea').length){
        obj.find('textarea').each(function(indx, elm){
            if ($(elm).val().length==0){
                validate = false;
            }
        });
    }

    return validate;
}
function selectValidate(obj){
    var validate = true;
    if (obj.find('.inputWrap select').length && obj.find('.inputWrap option:selected').length==0){
        validate = false;
    }
    return validate;
}
function multiselectValidate(obj){
    var validate = true;
    if (obj.find('.hidden.tokenValues').length && obj.find('.token-input-token').length==0) {
        validate = false;
    }
    return validate;
}
function step_validate(obj){
    var validate = {result: true};
    var validateArr = [];
    obj.find('>.required, div:not(.sectionTemplate) .required').each(function(indx, elm){
        if (!$(elm).parents('.sectionTemplate').length){
            var lineValidate = [];
            /*console.log('Line: '+indx);*/
            /* input */
            lineValidate.push(inputTextValidate($(elm)));
            /* checkBox */
            lineValidate.push(checkboxValidate($(elm)));
            /* radio */
            lineValidate.push(radioValidate($(elm)));
            /* textarea */
            lineValidate.push(textareaValidate($(elm)));
            /* select */
            lineValidate.push(selectValidate($(elm)));
            /* multiselect */
            lineValidate.push(multiselectValidate($(elm)));
            if ((lineValidate.indexOf(false)+1)){
                $(elm).addClass('redField');
            }
            validateArr.push(!(lineValidate.indexOf(false)+1));
        }
    });
    $('.redField').click(function(){
        $(this).removeClass('redField');
    });
    validate.result = !(validateArr.indexOf(false)+1);
    return validate;
}
function callFileLoader(data){
        console.log('Got Answer!');
        console.log(data);
        $.ajax({
            url: '/customactions/loaderCreateBaseVersion.action',
            type: 'POST',
            data: {
                requestId: data.data
            }
        }).success(function(data2){
            console.log('Got 2nd Answer!');
            console.log(data2);
            var newLocation = {};
            newLocation.pathname = '/portal/getCardHtml.action';
            newLocation.search = '?cardId=WIN$LOADER&documentId='+data2.data;
            window.location.href = window.location.host+newLocation.pathname+newLocation.search;
        })
    }
function callFileLoaderNewWindow(data){
        $.colorbox.close();
        console.log('Got Answer!');
        console.log(data);
        $.ajax({
            url: '/customactions/loaderCreateBaseVersion.action',
            type: 'POST',
            data: {
                requestId: data.data
            }
        }).success(function(data2){
            console.log('Got 2nd Answer!');
            console.log(data2);
            var newLocation = {};
            newLocation.pathname = '/portal/getCardHtml.action';
            newLocation.search = '?cardId=WIN$LOADER&documentId='+data2.data;
            /*window.open(window.location.host+newLocation.pathname+newLocation.search,'_blank');*/
            f.openWin(window.location.host+newLocation.pathname+newLocation.search, 'Loader', window.innerWidth*0.75, window.innerHeight);
        })
    }
function defaultSuccessModal(message){
    var message = (message)?message:'Форма успешно сохранена';
    $('#good').remove();
    /*modalExecs++;
    console.log('modalExecs: '+modalExecs);*/
    $('form').eq(0).append('<div style="display: none"><div id="good" class="popup"><h2 style="font-size: 32px; text-align: center; font-weight: bold; margin-top: 18px;">'+message+'</h2></div></div>');
    $.colorbox({inline:true, href:"#good",  width:"500px", height: "300px"});
}
function defaultErrorModal(data, message){
    var message = (message)?message:'Ошибка';
    var data = (data)?data:{status:'', statusText:'', responseText:''};
    $('#bad').remove();
    $('form').eq(0).append('<div style="display: none"><div id="bad" class="popup"><h2 style="font-size: 32px;    font-family: sans-serif; text-align: center; font-weight: bold; margin-top: 18px;">'+message+'</h2></div></div>');
    $('#bad').append('<p>'+data.status+' '+data.statusText+'</p>');
    $('#bad').append('<pre>'+data.responseText+'</pre>');
    $.colorbox({inline:true, href:"#bad",  width:"500px", height: "500px"});
    console.log(data);
}
function saveFormUniversal(form, functions, alerts, action){
    var alerts = {
            success: (alerts && alerts.success)?alerts.success:defaultSuccessModal,
            error: (alerts && alerts.error)?alerts.error:defaultErrorModal
        };
    var functions = {
        success: (functions && functions.success)?functions.success:function(){},
        error: (functions && functions.error)?functions.error:function(){},
        complete: (functions && functions.complete)?functions.complete:function(){}
    };
    var xmlAsString = '';
    var $this = form;
    var customaction = (action)?true:false;
    var action = action || $this.attr('action');
    var thisFormId = $this.attr('id');

    console.log('functions: ',functions);
    console.log('alerts: ',alerts);

    $('.file_input_js input').each(function(indx, elm){
        if (!$(elm).attr('xftag')){
            $(elm).attr('xftag', ':name:')
        }
    });
    makeFileXmlTag();

    try{
        xmlAsString = xf_generateXML(thisFormId);
    }catch(e){
        alert('Ошибка ' + e.name + ":" + e.message + "\n" + e.stack); //
    }
    /*console.log(xmlAsString);*/
    $('#'+thisFormId+'_XML').val(xmlAsString);
    $.ajax({
        url: action,
        type : 'POST',
        data: $this.serialize()
    })
    .success(function(data){
        var $documentId = $this.find('[name="documentId"]');
        console.log('previus documentId: '+$documentId.val());
        if (!$documentId){
            $documentId = $('<input type="hidden" name="documentId">');
            $this.prepend($documentId);
        }
        if (!customaction) {$documentId.val(data.data);}
        console.log('now documentId: '+$documentId.val());
        alerts.success();
        if (window.opener){
            window.opener.location.reload();}

        functions.success(data)}

        )
    .error(function(data){
            alerts.error(data);
            functions.error(data);
        })
    .complete(function(data){functions.complete(data)});
}

$(function(){
    $('.fileList').addClass('processed');
    $('.sectionTemplate .fileList').removeClass('processed');
    $('.sectionBtnAdd').click(function(){
        $('.fileList:not(.processed)').html('').fileUp().addClass('processed');
        $('.sectionTemplate .fileList').removeClass('processed');
    });
    $('input, textarea').each(function(indx, elm){
        if ($(elm).attr('readonly')){
            $(elm).addClass('readOnly');
        }
    });
});

]]>