<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <body>
        <h2>Metasploit Event Logs</h2>
        <table border="1">
          <tr>
            <th>ID</th>
            <th>Workspace ID</th>
            <th>Created At</th>
            <th>Name</th>
            <th>Info</th>
          </tr>
          <!-- Loop through each event -->
          <xsl:for-each select="//event">
            <tr>
              <td><xsl:value-of select="id"/></td>
              <td><xsl:value-of select="workspace-id"/></td>
              <td><xsl:value-of select="created-at"/></td>
              <td><xsl:value-of select="name"/></td>
              <td><xsl:value-of select="info"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
