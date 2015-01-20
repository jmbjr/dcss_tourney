<%
   import loaddb, query, crawl_utils, html

   c = attributes['cursor']
   branch = attributes['branch']

   stats = query.get_branch_stats(c, branch)

   won_games = query.find_games(c, source_file =  branch, killertype = 'winning',
                                sort_max = 'end_time', limit=None)
   best_games = []

   if len(won_games) < 5:
     best_games = query.find_games(c, source_file = branch,
                                   sort_max = 'score',
                                   limit = 10)
     if len(best_games) < len(won_games):
       best_games = []

   recent_games = query.find_games(c, source_file = branch, sort_max = 'end_time',
                                   limit = 9999)




   asterisk = """<p class='fineprint'>* Winning Game</p>"""
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
          "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>${branch}</title>
    <link rel="stylesheet" type="text/css" href="../tourney-score.css">
  </head>

  <body class="page_back">
    <div class="page bannered">
      <%include file="toplink.mako"/>


      <div class="page_content content-bannered">
        <div class="heading_left">
          <h1>Experimental Game Summary information for ${branch}</h1>
        </div>

        <hr>

        <div class="content">
          <div class="branch_status">
            <table class="bordered">
              <tr>
                <th>Games won / played</th>
                <td>${stats['won']} / ${stats['played']}
                  (${stats['win_perc']})</td>
              </tr>
            </table>
          </div>


          <div class="game_table">
            <h3>Wins</h3>
            ${html.full_games_table(won_games, count=False)}
          </div>

          % if streak_games:
          <div class="game_table">
            <h3>Longest streak of wins</h3>
            ${html.full_games_table(streak_games)}
          </div>
          % endif

          %if best_games:
          <div class="game_table">
            <h3>Best Games</h3>
            ${html.full_games_table(best_games, win=False)}
          </div>
          %endif

          % if won_gods:
          <div id="won-gods">
            <h3>Winning Gods:</h3>
            <div class="bordered inline">
              ${", ".join(won_gods)}
            </div>

            <p class="fineprint">
              We say that a game is won using a (non-Xom) god if the branch reaches
              ****** piety with that god without worshipping any
              other god first; this is not necessarily the same god worshipped at the end of the game. A game is won using Xom only if it is a Chaos Knight
              who never abandons Xom. A game is won using 'No God' only if the branch
              never worships a god. 
            </p>

            <h3>Remaining Gods:</h3>
            <div class="bordered inline">
              ${", ".join(query.find_remaining_gods(won_gods)) or 'None'}
            </div>
          </div>
          % endif

          <div class="game_table">
            <h3>Recent Games</h3>
            ${html.full_games_table(recent_games, count=False, win=False)}
          </div>

          <hr>

          % if uniq_slain:
          <div>
            <table class="bordered">
              <colgroup>
                 <col width="10%">
                 <col width="85%">
              </colgroup>
              <tr>
                <th>Uniques Slain</th>
                <td>${", ".join(uniq_slain)}</td>
              </tr>
              % if len(uniq_slain) > len(uniq_unslain):
                <tr>
                  <th>Uniques Left</th>
                  % if uniq_unslain:
                  <td>${", ".join(uniq_unslain)}</td>
                  % else:
                  <td>None</td>
                  % endif
                </tr>
              % endif
            </table>
          </div>
          <hr>
          % endif

          </div>

          % if combo_highscores or species_highscores or class_highscores:
            <div>
              ${html.branch_scores_block(c, combo_highscores,
                                         'Combo Highscores')}
              ${html.branch_scores_block(c, species_highscores,
                                         'Species Highscores')}
              ${html.branch_scores_block(c, class_highscores,
                                         'Background Highscores')}
            </div>
            <hr>
          % endif

      </div> <!-- content -->
    </div> <!-- page -->

    ${html.update_time()}
  </body>
</html>
