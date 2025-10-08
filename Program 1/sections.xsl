<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="html" indent="yes" />
  
  <xsl:template match="/">
    <html>
      <head>
        <style>
          body {
          font-family: Arial, sans-serif;
          background-color: #fff;
          margin: 40px;
          }
          table {
          border-collapse: collapse;
          width: 100%;
          font-size: 14px;
          }
          th, td {
          border: 1px solid #ddd;
          padding: 8px;
          text-align: left;
          vertical-align: top;
          }
          th {
          background-color: #f9f9f9;
          font-weight: bold;
          color: #333;
          }
          tr:nth-child(even) { background-color: #f7f7f7; }
          tr:hover { background-color: #f1f1f1; }
          h2 {
          font-size: 22px;
          margin-bottom: 15px;
          }
        </style>
      </head>
      
      <body>
        <table>
          <tr>
            <th>Course ID, Section, Title</th>
            <th>Available Seats</th>
            <th>Instructor</th>
            <th>Date Range</th>
            <th>Days</th>
            <th>Times</th>
            <th>Building / Room</th>
            <th>Cr/Hr</th>
            <th>Status</th>
          </tr>
          
          <xsl:for-each select="Sections/Section">
            <tr>
              <td>
                <xsl:value-of select="concat(Course/Id, ' ', Course/Number, ' ', Number)" />
                <br/>
                <xsl:value-of select="Course/Title" />
              </td>
              <td>
                <xsl:value-of select="concat(Enrolled, ' of ', Capacity)" />
              </td>
              <td>
                <xsl:value-of select="concat(Instructor/Last, ', ', Instructor/First)" />
              </td>
              <td>
                <xsl:value-of select="concat(DateRange/StartDate, ' - ', DateRange/EndDate)" />
              </td>
              <td><xsl:value-of select="Days" /></td>
              <td><xsl:value-of select="Times" /></td>
              <td>
                <xsl:value-of select="concat(Location/Building, ' ', Location/Room)" />
              </td>
              <td><xsl:value-of select="Credits" /></td>
              <td><xsl:value-of select="Status" /></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>





