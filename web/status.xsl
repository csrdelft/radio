<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
  <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" media-type="text/html"/>
  <xsl:template match = "/icestats" >
    <html>
    <head>
    <title>C.S.R. Radio - Week van academische vorming</title>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css" id="theme" />
    <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="style.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
    <div class="container">
      <!--index header menu -->
      <div class="header">
        <ul class="nav nav-pills pull-right">
          <li><a href="admin/">Admin</a></li>
          <li class="active"><a href="status.xsl">Overzicht</a></li>
          <li><a href="server_version.xsl">Versie</a></li>
        </ul>
        <h3 class="text-muted">C.S.R. Radio - Overzicht</h3>
      </div>
      <!--end index header menu -->
      <xsl:if test="not(source)">
        <div class="panel">Er zijn op dit moment geen uitzendingen</div>
      </xsl:if>

      <!--mount point stats-->
      <xsl:for-each select="source">
        <xsl:choose>
          <xsl:when test="listeners">
            <div class="panel panel-default" id="">
              <div class="panel-heading">
                <span>Radio <var><xsl:value-of select="@mount" /></var></span>
              </div>
              <div class="panel-body">
                <dl class="dl-horizontal">
                  <dd>
                <xsl:choose>
                  <xsl:when test="authenticator">
                    <a href="/auth.xsl" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-lock"></span>Login</a>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:if test="server_type and ((server_type = 'application/ogg') or (server_type = 'audio/ogg') or (server_type = 'audio/mpeg'))">
                      <span class="audioplayer">
                        <audio controls="controls" preload="none" style="width:100%">
                          <source src="{@mount}" type="{server_type}" />
                        </audio>
                      </span>
                    </xsl:if>
                  </xsl:otherwise>
                </xsl:choose>
                  </dd>
                  <xsl:if test="server_name">
                    <dt>Titel:</dt>
                    <dd><xsl:value-of select="server_name" /></dd>
                  </xsl:if>
                  <xsl:if test="server_description">
                    <dt>Beschrijving:</dt>
                    <dd><xsl:value-of select="server_description" /></dd>
                  </xsl:if>
                  <xsl:if test="genre">
                    <dt>Genre:</dt>
                    <dd><xsl:value-of select="genre" /></dd>
                  </xsl:if>
                  <xsl:if test="stream_start">
                    <dt>Begonnen:</dt>
                    <dd><xsl:value-of select="stream_start" /></dd>
                  </xsl:if>
                  <!-- <xsl:if test="server_type">
                    <dt>Content Type:</dt>
                    <dd><xsl:value-of select="server_type" /></dd>
                  </xsl:if> -->
                  <!-- <xsl:if test="bitrate">
                    <dt>Bitrate:</dt>
                    <dd><xsl:value-of select="bitrate" /></dd>
                  </xsl:if> -->
                  <xsl:if test="quality">
                    <dt>Quality:</dt>
                    <dd><xsl:value-of select="quality" /></dd>
                  </xsl:if>
                  <xsl:if test="video_quality">
                    <dt>Video Quality:</dt>
                    <dd><xsl:value-of select="video_quality" /></dd>
                  </xsl:if>
                  <xsl:if test="frame_size">
                    <dt>Framesize:</dt>
                    <dd><xsl:value-of select="frame_size" /></dd>
                  </xsl:if>
                  <xsl:if test="frame_rate">
                    <dt>Framerate:</dt>
                    <dd><xsl:value-of select="frame_rate" /></dd>
                  </xsl:if>
                  <xsl:if test="listeners">
                    <dt>Luisteraars:</dt>
                    <dd><xsl:value-of select="listeners" /></dd>
                  </xsl:if>
                  <xsl:if test="listener_peak">
                    <dt>Piek Luisteraars:</dt>
                    <dd><xsl:value-of select="listener_peak" /></dd>
                  </xsl:if>
                  <xsl:if test="server_url">
                    <dt>Meer info:</dt>
                    <dd><a target="_blank" href="{server_url}"><xsl:value-of select="server_url" /></a></dd>
                  </xsl:if>
                  <xsl:if test="title">
                    <dt>Current Song:</dt>
                    <dd><xsl:if test="artist">
                        <xsl:value-of select="artist" /> -
                      </xsl:if>
                      <xsl:value-of select="title" /></dd>
                  </xsl:if>
                  <dt>IRC:</dt>
                  <dd><a target="_blank" href="https://kiwiirc.com/nextclient/#irc://irc.freenode.com/#csrradio">#csrradio</a></dd>
                </dl>
              </div>
            </div>
          </xsl:when>
          <xsl:otherwise>
            <p><xsl:value-of select="@mount" /> - Not Connected</p>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
      <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
      <div class="footer">Gesponsord door de PubCie, te vinden op <a href="https://www.csrdelft.nl" target="_blank">csrdelft.nl</a></div>
    </div>
    <script src="//code.jquery.com/jquery-latest.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script>/*<![CDATA[*/
    $('*[title]').tooltip();
    /*]]>*/</script>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
