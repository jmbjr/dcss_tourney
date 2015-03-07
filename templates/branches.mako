<% 
  from crawl_utils import XXX_TOURNEY_BASE 
  import html
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
          "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Experimental Branches</title>
    <link rel="stylesheet" type="text/css" href="tourney-score.css">
  </head>


  <body class="page_back">
    <div class="page">
      <%include file="toplink.mako"/>

      <div class="page_content">
        <div class="heading_left">
          <h1>Misc Branches</h1>
        </div>
        <br>
        <a href="${XXX_TOURNEY_BASE}/branches/shoals-lite.html">Shoals-Lite (obsolte)</a>
        <br>
        <a href="${XXX_TOURNEY_BASE}/branches/cards.html">Cards (obsolete)</a>
        <br>

        <div class="heading_left">
          <h1>Species Branches</h1>
        </div>
        <br>
        <a href="${XXX_TOURNEY_BASE}/branches/faithful.html">Lacertilians (faithful)</a>
        <br>
        <a href="${XXX_TOURNEY_BASE}/branches/salamander.html">Salamander</a>
        <br>
        <a href="${XXX_TOURNEY_BASE}/branches/bearkin.html">Bearkin</a>
        <br>
        <a href="${XXX_TOURNEY_BASE}/branches/imp.html">Imps</a>
        <br>
        <div class="heading_left">
          <h1>God Branches</h1>
        </div>
        <br>
        <a href="${XXX_TOURNEY_BASE}/branches/no_backtracking_god.html">Wuldraste (no backtracking god)</a>
        <br>
        <a href="${XXX_TOURNEY_BASE}/branches/evoker-god.html">Pakellas (evoker god)</a>
        <br>

    </div>
    ${html.update_time()}
  </body>
</html>

