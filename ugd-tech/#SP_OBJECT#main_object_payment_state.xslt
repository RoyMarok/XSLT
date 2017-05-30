<style>
    div#objPaymentStateWrp{
        padding: 10px 0 0 0;
        border-top: 1px solid rgb(228, 228, 228);
        margin: 10px 0 20px 0;
    }
        div#objPaymentStateWrp h2.objWrpHdr{
            font-size: 1.2em;
            line-height: 2em;
        }
        div#objPaymentStateWrp #objPaymentStateTbl {
            position: relative;
            width: 90%;
        }
            #objPaymentStateTbl td{
                text-align: left;
                vertical-align: top;
            }
                #objPaymentStateTbl .tdWrp{
                    padding: 20px 0 0 0;
                    position: relative;
                }
                    #objPaymentStateTbl .yearTitle{
                        font-size: 1.4em;
                        position: absolute;
                        top: -5px;
                        left: 0px;
                    }
                    #objPaymentStateTbl .objPaymentProgressWrp {
                        width: 100%; 
                        position:relative;                                     
                        margin: 0 0 10px;
                        box-shadow: inset 0px 0px 10px 1px #d9d9d9;                        
                        border-radius: 3px;
                        *border: 1px solid #d9d9d9;
                        border /*\**/: 1px solid #d9d9d9\9
                    }   
                         
                        #objPaymentStateTbl .objPaymentProgressBar {                    
                            height: .9em;
                            width: 66%;
                            margin: 0px;
                            border-radius: 3px;
                            border: 1px solid #357d91;
                            background-color: #57bb50;
                            background-image: linear-gradient(bottom, rgb(37,178,79) 5%, rgb(144,208,80) 50%, rgb(37,178,79) 95%);
                            background-image: -o-linear-gradient(bottom, rgb(37,178,79) 5%, rgb(144,208,80) 50%, rgb(37,178,79) 95%);
                            background-image: -moz-linear-gradient(bottom, rgb(37,178,79) 5%, rgb(144,208,80) 50%, rgb(37,178,79) 95%);
                            background-image: -webkit-linear-gradient(bottom, rgb(37,178,79) 5%, rgb(144,208,80) 50%, rgb(37,178,79) 95%);
                            background-image: -ms-linear-gradient(bottom, rgb(37,178,79) 5%, rgb(144,208,80) 50%, rgb(37,178,79) 95%);
                            background-image: -webkit-gradient(
                                linear,
                                left bottom,
                                left top,
                                color-stop(0.05, rgb(37,178,79)),
                                color-stop(0.5, rgb(144,208,80)),
                                color-stop(0.95, rgb(37,178,79))
                            );
                        }
                        #objPaymentStateTbl .objPaymentProgressVal {   
                            position: absolute;
                            width: 45px;
                            height: 20px;
                            color: #006600;
                            top: -20px;
                            left: 66%;
                            font-weight: bold;
                            font-size: 1.3em;
                            text-indent: -4px;
                            text-align: right;
                            margin-left: -27px;
                        }
                    
                    #objPaymentStateTbl p.objPaymentProgressText{
                        font-size: 0.9em;
                        line-height: 2em;
                    }
                        #objPaymentStateTbl p.objPaymentProgressText span{
                            padding: 0px;
                            display: inline-block;
                            text-align:right;
                            width: 130px;
                            *display: inline;
                            *zoom:1;
                        }
                        #objPaymentStateTbl p.objPaymentProgressText span.key{
                            
                            width: 60px;
                        }
        
        div#objPaymentStateWrp .objWrpAnnot{
            margin: 20px 0 0 0;
            font-size: 0.85em;
            color: #aaa;
        }
        div#objPaymentStateWrp .objWrpAnnot b{
            font-weight: bold;
            color: #333;
        }
        
</style>

<div id="objPaymentStateWrp">
    <h2 class="objWrpHdr">Состояние оплаты</h2>
    <table id="objPaymentStateTbl">
        <col width="100" />
        <col width="70" />
        <col width="auto" />
        <tbody>            
            <xsl:for-each select="/ROOT/PAIDTITULA/ROW_SET/ROW">
                <xsl:sort select="YEAR_TIT" data-type="text" order="descending" />
                <tr>
                    <td>
                        <div class="tdWrp">
                            <xsl:value-of select="DOC_TYPE_NAME" />
                            <xsl:if test="position() = 1 or not(YEAR_TIT=preceding-sibling::ROW/YEAR_TIT)">
                                <div class="yearTitle">
                                    <xsl:value-of select="YEAR_TIT" />                                    
                                </div>
                            </xsl:if>        
                        </div>
                    </td>
                    <td>
                        <div class="tdWrp">
                            <xsl:element name="a">
                                <!--xsl:attribute name="href">htmlcard.action?documentId=<xsl:value-of select="DOC_KEY" /></xsl:attribute-->
                                <xsl:attribute name="href">getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=<xsl:value-of select="DOC_KEY" /></xsl:attribute> 
                                <xsl:value-of select="NUMBER_TIT" />
                            </xsl:element>
                        </div>
                    </td>
                    <td>
                        <div class="tdWrp">
                            <xsl:element name="div">
                                <xsl:attribute name="class">objPaymentProgressWrp</xsl:attribute>
                                <xsl:attribute name="style">width:<xsl:value-of select="PER_SUMMA_KBK_TIT" />%;min-width: 30px;</xsl:attribute>
                                <xsl:element name="div">
                                    <xsl:attribute name="class">objPaymentProgressBar</xsl:attribute>
                                    <xsl:attribute name="style">width:<xsl:value-of select="PER_DOC_KEY_SHOW" />%</xsl:attribute>                                    
                                </xsl:element>
                                <xsl:element name="div">
                                    <xsl:attribute name="class">objPaymentProgressVal</xsl:attribute>
                                    <xsl:attribute name="style">left:<xsl:value-of select="PER_DOC_KEY_SHOW" />%</xsl:attribute>
                                    <xsl:value-of select="PER_DOC_KEY_SHOW" />%                                    
                                </xsl:element>
                            </xsl:element>
                            <p class="objPaymentProgressText">
                                <span class="key">Лимит:</span><span class="value"><b><xsl:value-of select="SUMMA_KBK_TIT" /></b> руб</span>
                            </p>
                            <p class="objPaymentProgressText">
                                <span class="key">Оплачено:</span><span class="value"><b><xsl:value-of select="SUMMA_PAY" /></b> руб</span>
                            </p>
                        </div>
                    </td>
                </tr>
            </xsl:for-each>
        </tbody>
    </table> 
    <p class="objWrpAnnot">
        По данным Департамента финансов города Москвы (Московское городское казначейство) по состоянию на дату: <b><xsl:value-of select="/ROOT/PAIDTITULA/ROW_SET/ROW/DATE_SOST" /></b>
        <br/>
        * лимит, поставленный на учет казначейством
    </p>
</div>