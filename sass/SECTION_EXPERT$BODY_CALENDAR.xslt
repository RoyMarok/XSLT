<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">

        <div class="widgetBlock whiteBlock">
                        <div class="widgetCaption showHide">Календарь выдачи заключений</div>
                        <div class="widgetBody">
                            <div class="paddingBlock calendar" style="padding: 0 20px 20px 20px;">
                                <div class="month">
                                    <span class="left" onclick="showMonth(this)" date="Mon Aug 01 2016 00:00:00 GMT+0300 (RTZ 2 (зима))">Август</span>
                                    <h3 date="Thu Sep 01 2016 00:00:00 GMT+0300 (RTZ 2 (зима))">Сентябрь</h3>
                                    <span class="right" onclick="showMonth(this)" date="Sat Oct 01 2016 00:00:00 GMT+0300 (RTZ 2 (зима))">Октябрь</span>
                                </div>
                                <div id="calendar"><table class="calendar_tasks"><tbody><tr><th>пн</th><th>вт</th><th>ср</th><th>чт</th><th>пт</th><th>сб</th><th>вс</th></tr><tr><td></td><td></td><td></td><td onclick="showTask(this)" class="have_task " day="1" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">1</div><div class="tasks"><div class="task expired"></div><div class="task expired"></div><div class="task expired"></div></div></div></td><td day="2" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">2</div></div></td><td day="3" class="" style="background: rgb(248, 248, 248);"><div class="day_block"><div class="day">3</div></div></td><td day="4" class="" style="background: rgb(248, 248, 248);"><div class="day_block"><div class="day">4</div></div></td></tr><tr><td day="5" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">5</div></div></td><td day="6" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">6</div></div></td><td day="7" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">7</div></div></td><td day="8" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">8</div></div></td><td day="9" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">9</div></div></td><td day="10" class="" style="background: rgb(248, 248, 248);"><div class="day_block"><div class="day">10</div></div></td><td day="11" class="" style="background: rgb(248, 248, 248);"><div class="day_block"><div class="day">11</div></div></td></tr><tr><td day="12" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">12</div></div></td><td day="13" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">13</div></div></td><td day="14" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">14</div></div></td><td day="15" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">15</div></div></td><td day="16" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">16</div></div></td><td day="17" class="" style="background: rgb(248, 248, 248);"><div class="day_block"><div class="day">17</div></div></td><td day="18" class="" style="background: rgb(248, 248, 248);"><div class="day_block"><div class="day">18</div></div></td></tr><tr><td day="19" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">19</div></div></td><td day="20" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">20</div></div></td><td day="21" class="today" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">21</div></div></td><td day="22" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">22</div></div></td><td day="23" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">23</div></div></td><td day="24" class="" style="background: rgb(248, 248, 248);"><div class="day_block"><div class="day">24</div></div></td><td day="25" class="" style="background: rgb(248, 248, 248);"><div class="day_block"><div class="day">25</div></div></td></tr><tr><td day="26" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">26</div></div></td><td day="27" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">27</div></div></td><td day="28" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">28</div></div></td><td day="29" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">29</div></div></td><td day="30" class="" style="background: rgb(255, 255, 255);"><div class="day_block"><div class="day">30</div></div></td><td></td><td></td></tr></tbody></table></div>
                            </div>
                        </div>
                    </div>

    </xsl:template>
</xsl:stylesheet>