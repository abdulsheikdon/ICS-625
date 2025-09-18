<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="html" indent="yes"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Bookstore Listing</title>
        <style>
          table {
          border-collapse: collapse;
          width: 80%;
          }
          th, td {
          border: 1px solid black;
          padding: 8px;
          text-align: left;
          }
          th {
          background-color: #ffffffff;
          }
          .highlight {
          background-color: #4fe00bff;
          }
        </style>
      </head>
      <body>
        <h2>Bookstore Listing</h2>
        <table>
          <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Year</th>
            <th>Price</th>
            <th>Category</th>
          </tr>
          
          <xsl:for-each select="bookstore/book">
            <tr>
              <xsl:attribute name="class">
                <xsl:if test="title/@lang='en'">highlight</xsl:if>
              </xsl:attribute>
              <td><xsl:value-of select="title"/></td>
              <td><xsl:value-of select="author"/></td>
              <td><xsl:value-of select="year"/></td>
              <td><xsl:value-of select="price"/></td>
              <td><xsl:value-of select="@category"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
