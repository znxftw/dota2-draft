# Dota 2 Predictor
Predicting the outcome of a Dota 2 game based purely on the draft

## 0. Preface

Dota 2 is a free-to-play multiplayer online battle arena video game developed and published by Valve Corporation. It is typically a 5v5 game, with the two teams being the Radiant and the Dire.

Each player gets to select a hero at the start of the game called the 'Drafting Phase'. Each hero has it's own advantages and disadvantages.

There are 115 heroes as of 14-07-2018 in Dota 2 and each hero is countered by and counters certain other heroes in the game. The side (Radiant / Dire) may arguably affect the chances of a hero having an advantage and so does the Match Type (e.g. Single Draft matches limit your hero pool)

The matchmaking system teams up players of roughly equal skill with each other, hence the variance in any other factor affecting the outcome is low.

With this knowledge, we shall consider only those attributes which may affect the outcome of a game in our final model.

## 1. Collecting the Data
