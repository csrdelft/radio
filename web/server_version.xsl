<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
  <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" media-type="text/html"/>
  <xsl:template match = "/icestats" >
    <html>
    <head>
    <title>Server Informatie - C.S.R. Radio</title>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css" id="theme" />
    <link rel="stylesheet" type="text/css" href="style.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
    <div class="container">
      <!--index header menu -->
      <div class="header">
        <ul class="nav nav-pills pull-right">
          <li><a href="admin/">Admin</a></li>
          <li><a href="status.xsl">Overzicht</a></li>
          <li class="active"><a href="server_version.xsl">Versie</a></li>
        </ul>
        <h3 class="text-muted">C.S.R. Radio - Versie</h3>
      </div>
      <!--end index header menu -->

      <xsl:for-each select="/icestats">
        <div class="panel panel-info">
          <div class="panel-heading">Server Informatie</div>
          <div class="panel-body">
            <dl class="dl-horizontal">
              <dt>Locatie</dt>
              <dd><xsl:value-of select="location" /></dd>
              <dt>Administrator</dt>
              <dd><xsl:value-of select="admin" /></dd>
              <dt>Host</dt>
              <dd><xsl:value-of select="host" /></dd>
              <dt>Versie</dt>
              <dd><xsl:value-of select="server_id" /></dd>
            </dl>
          </div>
        </div>
      </xsl:for-each>
      <div class="footer">Gesponsord door de PubCie, te vinden op <a href="https://www.csrdelft.nl" target="_blank">csrdelft.nl</a></div>
    </div>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
