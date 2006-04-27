<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/statistics">
	<style>
		*.pass{
			background-color: green;
		}
		*.fail{	
			background-color: red;
		}
		*.unknown{	
			background-color: yellow;
		}
	</style>

		<table>
			<tr>
				<th>Build Label</th>
				<th>Status</th>
				<xsl:for-each select="./integration[1]/statistic">
					<th>
						<xsl:value-of select="./@name" />
					</th>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="./integration">
				<xsl:variable name="colorClass">
					<xsl:choose>
						<xsl:when test="./@status = 'Success'">pass</xsl:when>
						<xsl:when test="./@status = 'Unknown'" >unknown</xsl:when>
						<xsl:otherwise>fail</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr>
					<th>
						<xsl:value-of select="./@build-label"/>
					</th>
					<th class="{$colorClass}">
						<xsl:value-of select="./@status"/>
					</th>
					<xsl:for-each select="./statistic">
						<td>
							<xsl:value-of select="."/>
						</td>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>

  