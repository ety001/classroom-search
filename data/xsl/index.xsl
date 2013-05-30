<?xml version="1.0" encoding="gb2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">

<div id="ClassContent1" class="bcinfo">
            <div class="bctop">以下是今天该楼教室的空课情况——本周情况可以使用高级查询</div>
            <div class="image1"><span>南区5号教学楼</span></div>
            <div class="bccontent">
             	<strong>第一大节</strong>
                <xsl:for-each select="builds/build1/course1/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第二大节</strong>
                <xsl:for-each select="builds/build1/course2/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第三大节</strong>
                <xsl:for-each select="builds/build1/course3/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第四大节</strong>
                <xsl:for-each select="builds/build1/course4/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第五大节</strong>
                <xsl:for-each select="builds/build1/course5/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
</div>

<div id="ClassContent2" class="bcinfo">
            <div class="bctop">以下是今天该楼教室的空课情况——本周情况可以使用高级查询</div>
            <div class="image2"><span>北区4号教学楼</span></div>
            <div class="bccontent">
             	<strong>第一大节</strong>
                <xsl:for-each select="builds/build2/course1/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第二大节</strong>
                <xsl:for-each select="builds/build2/course2/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第三大节</strong>
                <xsl:for-each select="builds/build2/course3/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第四大节</strong>
                <xsl:for-each select="builds/build2/course4/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第五大节</strong>
                <xsl:for-each select="builds/build2/course5/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
</div>

<div id="ClassContent3" class="bcinfo">
            <div class="bctop">以下是今天该楼教室的空课情况——本周情况可以使用高级查询</div>
            <div class="image3"><span>北区5号教学楼</span></div>
            <div class="bccontent">
             	<strong>第一大节</strong>
                <xsl:for-each select="builds/build3/course1/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第二大节</strong>
                <xsl:for-each select="builds/build3/course2/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第三大节</strong>
                <xsl:for-each select="builds/build3/course3/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第四大节</strong>
                <xsl:for-each select="builds/build3/course4/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第五大节</strong>
                <xsl:for-each select="builds/build3/course5/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
</div>

<div id="ClassContent4" class="bcinfo">
            <div class="bctop">以下是今天该楼教室的空课情况——本周情况可以使用高级查询</div>
            <div class="image4"><span>北区8号教学楼</span></div>
            <div class="bccontent">
             	<strong>第一大节</strong>
                <xsl:for-each select="builds/build4/course1/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第二大节</strong>
                <xsl:for-each select="builds/build4/course2/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第三大节</strong>
                <xsl:for-each select="builds/build4/course3/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第四大节</strong>
                <xsl:for-each select="builds/build4/course4/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第五大节</strong>
                <xsl:for-each select="builds/build4/course5/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
</div>

<div id="ClassContent5" class="bcinfo">
            <div class="bctop">以下是今天该楼教室的空课情况——本周情况可以使用高级查询</div>
            <div class="image5"><span>北区9号教学楼</span></div>
            <div class="bccontent">
             	<strong>第一大节</strong>
                <xsl:for-each select="builds/build5/course1/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第二大节</strong>
                <xsl:for-each select="builds/build5/course2/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第三大节</strong>
                <xsl:for-each select="builds/build5/course3/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第四大节</strong>
                <xsl:for-each select="builds/build5/course4/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第五大节</strong>
                <xsl:for-each select="builds/build5/course5/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
</div>

<div id="ClassContent6" class="bcinfo">
            <div class="bctop">以下是今天该楼教室的空课情况——本周情况可以使用高级查询</div>
            <div class="image6"><span>西区4号教学楼</span></div>
            <div class="bccontent">
             	<strong>第一大节</strong>
                <xsl:for-each select="builds/build6/course1/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第二大节</strong>
                <xsl:for-each select="builds/build6/course2/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第三大节</strong>
                <xsl:for-each select="builds/build6/course3/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第四大节</strong>
                <xsl:for-each select="builds/build6/course4/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
            <div class="bccontent">
             	<strong>第五大节</strong>
                <xsl:for-each select="builds/build6/course5/classrooms">
                <div><xsl:value-of select="classroom"/></div>
                </xsl:for-each>
            </div>
            <div class="clear_left"></div>
</div>
</xsl:template>
</xsl:stylesheet>