# Dota 2 Predictor
Predicting the outcome of a Dota 2 game based purely on the draft

## 0. Preface

Dota 2 is a free-to-play multiplayer online battle arena video game developed and published by Valve Corporation. It is typically a 5v5 game, with the two teams being the Radiant and the Dire.

Each player gets to select a hero at the start of the game called the 'Drafting Phase'. Each hero has it's own advantages and disadvantages.

There are 115 heroes as of 14-07-2018 in Dota 2 and each hero is countered by and counters certain other heroes in the game. The side (Radiant / Dire) may arguably affect the chances of a hero having an advantage.

The matchmaking system teams up players of roughly equal skill with each other, hence the variance in any other factor affecting the outcome is low.

With this knowledge, we shall consider only those attributes which may affect the outcome of a game in our final model. We shall also discard factors that change during the course of the game such as Kills / Deaths which may directly affect the game. However we shall consider the duration of the game, as some heroes have advantages later into the game rather than earlier.

## 1. Collecting the Data

For collecting the data, we need an API to access the Dota 2 Database. We will be using [Dota2Api](http://dota2api.readthedocs.io/en/latest/) for the same. A [gist from da-steve101](https://gist.github.com/da-steve101/1a7ae319448db431715bd75391a66e1b) had the necessary template for extracting *'N'* matches from the database which specify the required parameters. We will be using the gist with a few modifications for our attributes to extract.

If you wish to collect the data manually,
- [Get an API Key](https://steamcommunity.com/dev/apikey)
- Install dota2api with the following command

```
pip install dota2api
```
- Run the script linked above after changing Initialise() to Initialise(*"your API key"*) and modifying the script as you wish.

My internet's firewall refused to do any more than ~1800 fetches. So we were limited to a small dataset of 1750 games.


## 2. Running the Neural Network

We will be using R for simulating the Neural Network. If you wish to run the model yourself, download and install [R](https://cran.r-project.org/bin/windows/base/) and [RStudio](https://www.rstudio.com/products/rstudio/download/).

After installing
- Clone this repository with
```bash
git clone https://github.com/znxftw/dota2-draft.git
```
- Open */src/NeuralNetwork.R* in RStudio
- Set home directory of the repository as the data directory
- Uncomment the following lines
```R
install.packages('caTools')
install.packages('h2o')
```
- Execute the above lines with Shift + Enter 
- Recomment them after they have been installed
- Run each section one by one afterwards with Shift + Enter
