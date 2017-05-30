<script>
<!--![CDATA[
            function getMoneyFormat(value, suffix) {
                var val = value.replace(/[^\.,\d]/g, ''),
                    val2 = '',
                    spacer = ', ';

                val = val.split(/[\.,]/);
                val2 = spacer + (!!val[1] ? val[1] : '00');

                val = val[0].split('').reverse();

                for (var i=0; i<val.length; i++) {
                    val2 = val[i] + (i > 0 && i % 3 == 0 ? ' ' : '') + val2;
                }

                return val2 + ' руб.';
            }
            $(function() {
                var docSum=0;
                $('.invoce_item_sum_field').each(function(indx, elm){
                    var thisRow = $(elm).parents('tr');
                    $(elm).text(+thisRow.find('.priceForPiece').text()*+thisRow.find('.quantity').text());
                    docSum+=+($(elm).text());
                });
                $('.doc_sum_field').html(docSum);
                $('.numberFormat').each(function() {
                    var $t = $(this),
                        format = $t.attr('data-format'),
                        flagClass = 'numberFormatInited';

                    if (!!$t.hasClass(flagClass)) return false;

                    switch(format) {
                        case 'rub':
                            $t.html(getMoneyFormat($t.html(), ' руб.'));
                        break;

                        case 'percent':
                            $t.html($t.html().replace(/[^\.,\d]/g, '') + ' %')
                        break;

                        default:
                        break;
                    }

                    $t.addClass(flagClass);
                });
            });
        ]]-->
</script>
