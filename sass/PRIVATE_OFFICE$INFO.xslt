<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" omit-xml-declaration="yes" indent="no"/>
	{B{COMMON$BASE_STATIC}E}

	<xsl:template match="/">

		<xsl:call-template name="base_static">
			<xsl:with-param name="content">
				<style> 
					.blue-bt-wrap{
						text-align: center;	
					}

					.blue-bt{
						display: inline-block;  
            background : #0076FE;
            color: #FFF;

            font-family: sans-serif;

            font-size: 16px;
            line-height: 18px;

            padding: 15px 10px;
          }

          a{
            text-decoration: none;
            color: #0D86C5;
          }

          p{
            text-indent: 1.5em;
            margin: 26px 0;
          }
        </style>

        <div class="PRIVATE_OFFICE_INFO">
            <p>
              Для получения доступа к получению государственной услуги государственной экспертизы проектной документации вам необходимо войти в систему с подтвержденной учетной записью Портала государственных услуг <a href="www.gosuslugi.ru">www.gosuslugi.ru</a>.
            </p>
            <p>
              Подтвержденная учетная запись - учетная запись, прошедшая подтверждение в офисах Ростелекома, Почты России при обращении гражданина, или при вводе кода активации, полученного по почте, или с помощью универсальной электронной карты и квалифицированной электронной подписи.
            </p>
            <div class="blue-bt-wrap">
              <a class="blue-bt" href="https://esia-portal1.test.gosuslugi.ru/profile/user">Перейти к подтверждению</a>
            </div>
        </div>      
      </xsl:with-param>
    </xsl:call-template>

  </xsl:template>

</xsl:stylesheet>