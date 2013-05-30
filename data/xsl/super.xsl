<?xml version="1.0" encoding="gb2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">

<div class="classroom">
	<div class="roomname">教</div>
    <div class="clear_colum"></div>
    <div class="roomname">室</div>
    <div class="clear_colum"></div>
    <xsl:for-each select="build/room">
    	<div class="roomname">
    		<xsl:value-of select="roomname"/><span style="display:none"><xsl:value-of select="roominfo" /></span>
            
        </div>
        <div class="clear_colum"></div>
    </xsl:for-each>
</div>
<div class="classinfo">
	<div class="week">星期一</div>
    <div class="clear_colum"></div>
    <div class="week">星期二</div>
    <div class="clear_colum"></div>
    <div class="week">星期三</div>
    <div class="clear_colum"></div>
    <div class="week">星期四</div>
    <div class="clear_colum"></div>
    <div class="week">星期五</div>
    <div class="clear_colum"></div>
    <div class="week">星期六</div>
    <div class="clear_colum"></div>
    <div class="week">星期日</div>
    <div class="clear_colum"></div>
    <div class="jieshu1">
    	<div class="classinfo2">1</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">2</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">3</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">4</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">5</div>
        <div class="clear_colum"></div>
    </div>
    <div class="jieshu2">
    	<div class="classinfo2">1</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">2</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">3</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">4</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">5</div>
        <div class="clear_colum"></div>
    </div>
    <div class="jieshu1">
    	<div class="classinfo2">1</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">2</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">3</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">4</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">5</div>
        <div class="clear_colum"></div>
    </div>
    <div class="jieshu2">
    	<div class="classinfo2">1</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">2</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">3</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">4</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">5</div>
        <div class="clear_colum"></div>
    </div>
    <div class="jieshu1">
    	<div class="classinfo2">1</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">2</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">3</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">4</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">5</div>
        <div class="clear_colum"></div>
    </div>
    <div class="jieshu2">
    	<div class="classinfo2">1</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">2</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">3</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">4</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">5</div>
        <div class="clear_colum"></div>
    </div>
    <div class="jieshu1">
    	<div class="classinfo2">1</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">2</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">3</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">4</div>
        <div class="clear_colum"></div>
        <div class="classinfo2">5</div>
        <div class="clear_colum"></div>
    </div>
    <xsl:for-each select="build/room/course">
	<xsl:choose>
		<xsl:when test="value=1">
		<div class="classinfo1"></div>
        <div class="clear_colum"></div>
		</xsl:when>
		<xsl:when test="value=0">
		<div class="classinfo0"></div>
        <div class="clear_colum"></div>
		</xsl:when>
		<xsl:otherwise>
		<div class="classinfo2"></div>
        <div class="clear_colum"></div>
		</xsl:otherwise>
	</xsl:choose>
	</xsl:for-each>
</div>

<div class="classroom">
	<div class="roomname">教</div>
    <div class="roomname">室</div>
    <xsl:for-each select="build/room">
    	<div class="roomname">
    		<xsl:value-of select="roomname"/>
        </div>
    </xsl:for-each>
</div>
</xsl:template>
</xsl:stylesheet>