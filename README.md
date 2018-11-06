# QueueUp Predictions

When the 2018 edition of the League of Legends World Championship started, we wondered how we could make this
event even more interesting.

Even if [Worlds Pick'Em](https://pickem.na.lolesports.com/en-US) is fun, it only allows you to predict final
standings. Inspired by [Le Huit Parfait](http://huitparfait.fr/), [QueueUp Predictions](https://predictions.queueup.gg)
allows you to predict every single match of the tournament.

## How does it work ?

### Overview

- Once you added matches from `/admin`, users will be able to save their predictions up to 30 minutes before the match
starts.
- Every day at 4PM (GMT+1), the app updates the scores depending on each player's predictions:
  - 0 point: The user's prediction is wrong
  - 1 point: The user predicted the issue of the game (who won)
  - 3 points: The user predicted the game perfectly (who won, and how many games in a serie)

### Administration

The administrator can add matches from the administration. He will need to create the competition and the teams first.
Matches can be imported with a CSV file. Here is an example
[Google Sheets](https://docs.google.com/spreadsheets/d/1VCMWNwtcV1sxwC3ku2i_hlWgXEHJISeKKwuWB1CPdGg/edit?usp=sharing)
from which you can export a CSV file and import it into the app.
