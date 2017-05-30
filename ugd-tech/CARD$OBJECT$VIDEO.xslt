
<xsl:template name="video">     
        
   <xsl:param name = "type"/>
   <xsl:param name="number"/>
   <xsl:param name = "id_address"/>
   <xsl:param name = "name"/>   
   
        <div style="display: none;">[Type: <xsl:value-of select="$type" />, Number: <xsl:value-of select="$number" />]</div>
   
        <xsl:choose>
              <xsl:when test="$type = 'flashvideo'">
              
                <script type="text/javascript" src="/portal_static/js/video/umsplayer.js" charset="utf-8"></script>    
                
                <div id="player-container_{$number}"></div>   
                <script type="text/javascript">
                  embedPlayer('player-container_<xsl:value-of select="$number"/>', {
                    flashvars : {
                      'rtmp' : '<xsl:value-of select="$id_address"/>',         
                      'autoplay' : false,                                                          
                      'showMetadata': true,                                                      
                      'showLiveCaption' : true,                                                 
                      'livelabelshowbg': false,                                                
                      'showErrorInPlayer' : true                                               
                    },
                    size : { width: 360, height: 240 },
                    playerStyle : 'quick'
                  });
                </script>
              </xsl:when>
              
              <xsl:when test="$type = 'mjpeg'">   
         
                  <img src="$id_address" width="360px" id="Player_1"/>  
                  
                  <OBJECT id="Player" height="300" width="300" border="1" codebase="codebase/AMC.cab#Version=5,6" classid="CLSID:745395C8-D0E1-4227-8586-624CA9A10A8D">
                    <param name="AutoStart" value="0"/>
                    <param name="UIMode" value="none"/>
                    <param name="MediaType" value="mjpeg"/>
                    <param name="NetworkTimeout" value="5000"/>
                    <param name="MediaURL" value="{$id_address}"/>
                    <param name="MediaType" value="mjpeg-unicast"/>
                    <param name="StretchToFit" value="true"/>
                    <param name="MaintainAspectRatio" value="true"/>
                    <param name="MediaUsername" value="null"/>
                    <param name="MediaPassword" value="null"/>
                 </OBJECT>
                 <SCRIPT>
                      var browser = navigator.userAgent.toLowerCase();

                      if ((browser.indexOf('msie') != -1)||(browser.indexOf("trident") != -1)) {
                        document.getElementById("Player").Play();
                        $("#Player_1").remove();
                      } 
                      else
                      {
                        $("#Player").remove();
                      }
                  </SCRIPT>                   
              </xsl:when>
              
              <xsl:when test="$type = 'flowplayer'">   <!--UGDII-1799 -->              
                
                <xsl:if test="$number = 1">
                  <script src="/portal_static/js/video/FLVPlayer/flowplayer-3.2.6.min.js"></script>
                </xsl:if>
                
                <div id='rtmp_player_{$number}' style="height:300px; margin-bottom:15px"> </div>
                
                <script type="text/javascript">
                try {
                  flowplayer('rtmp_player_<xsl:value-of select="$number"/>', "/portal_static/js/video/FLVPlayer/flowplayer-3.2.7.swf", {
                    clip: {
                         autoPlay: false         // applies to all Clips in the playlist
                    },
                    playlist: [                 // an array of Clip objects
                          '<xsl:value-of select="$id_address"/>',          // simple Clip object: movie to play
                      {                       // Clip object
                        url: '<xsl:value-of select="$id_address"/>',
                        autoPlay: true      // override Common Clip for this clip
                      }
                    ]
                  });
                } catch (e) {
                  console.log('Соизвольте подключить JS (flowplayer)');
                }
                </script>
              </xsl:when>
              
              <xsl:otherwise>  
                <div>Данный тип видео не реализован</div>               
              </xsl:otherwise>
              
         </xsl:choose>
            
 </xsl:template>                
                 




                 
                 