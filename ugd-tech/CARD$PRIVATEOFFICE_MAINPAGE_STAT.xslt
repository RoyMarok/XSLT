 <xsl:variable name="all"><xsl:value-of select="//STAT//CNT_ALL"/></xsl:variable>
 <xsl:variable name="expired"><xsl:value-of select="//STAT//CNT_EXPIRED"/></xsl:variable>
 <xsl:variable name="today"><xsl:value-of select="//STAT//CNT_TODAY"/></xsl:variable>
 <xsl:variable name="nextday"><xsl:value-of select="//STAT//CNT_NEXTDAY"/></xsl:variable>

<div class="my-actions">
   <h2>Мои действия</h2>
   <div class="my-actions-buttons">
     <div id="PRIVOFFICE_MENU" class="buttonContainer notProcessed"></div>
   </div>
</div>

<xsl:variable name="taskAll"><xsl:value-of select="//FT_STAT//TASK_ALL"/></xsl:variable>
<xsl:variable name="taskInProgress"><xsl:value-of select="//FT_STAT//TASK_INPROGRESS"/></xsl:variable>
<xsl:variable name="taskToAccept"><xsl:value-of select="//FT_STAT//TASK_TOACCEPT"/></xsl:variable>
<xsl:variable name="taskCompleted"><xsl:value-of select="//FT_STAT//TASK_COMPLETED"/></xsl:variable>

<div class="deadline" id="deadlineControl" data-type="control" data-card="CARD$PRIVATEOFFICE$FT_TASK_IN_CONTROL">
  <h2>Всего задач: <a href="javascript:void(0);" data-count="{$taskAll}" data-filter=""  onclick="mainpage.filterTasks(this)"><xsl:value-of select="$taskAll"/></a></h2>
  <div class="deadline-items">
    <a class="deadline-item" href="javascript:void(0);" data-count="{$taskInProgress}" data-filter="INPROGRESS" onclick="mainpage.filterTasks(this)">
      <strong><xsl:value-of select="$taskInProgress"/></strong>
      <span>в работе</span>
    </a>
    <a class="deadline-item" href="javascript:void(0);" data-count="{$taskToAccept}" data-filter="TOACCEPT" onclick="mainpage.filterTasks(this)">
      <strong><xsl:value-of select="$taskToAccept"/></strong>
      <span>Подтвердить</span>
    </a>
    <a class="deadline-item" href="javascript:void(0);" data-count="{$taskCompleted}" data-filter="COMPLETED"  onclick="mainpage.filterTasks(this)">
      <strong><xsl:value-of select="$taskCompleted"/></strong>
      <span>Завершены</span>
    </a>
  </div>
  <!-- <div class="deadline-progressbar">
    <span id="deadlineProgressBar"></span>
  </div> -->
</div>

<div class="deadline" data-type="tasks"  data-card="CARD$PRIVATEOFFICE_MAINPAGE_TASKS">
  <h2>Всего задач: <a href="javascript:void(0);" data-count="{$all}" data-filter=""  onclick="mainpage.filterTasks(this)"><xsl:value-of select="$all"/></a></h2>
  <div class="deadline-items">
    <a class="deadline-item" href="javascript:void(0);" data-count="{$expired}" data-filter="expired" onclick="mainpage.filterTasks(this)">
      <strong><xsl:value-of select="$expired"/></strong>
      <span>срок истек</span>
    </a>
    <a class="deadline-item" href="javascript:void(0);" data-count="{$today}" data-filter="today" onclick="mainpage.filterTasks(this)">
      <strong><xsl:value-of select="$today"/></strong>
      <span>срок сегодня</span>
    </a>
    <a class="deadline-item" href="javascript:void(0);" data-count="{$nextday}" data-filter="nextday"  onclick="mainpage.filterTasks(this)">
      <strong><xsl:value-of select="$nextday"/></strong>
      <span>срок завтра</span>
    </a>
  </div>
  <!-- <div class="deadline-progressbar">
    <span id="deadlineProgressBar"></span>
  </div> -->
</div>