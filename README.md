# Blood On The Clocktower

A captivating social deduction game of murder, mystery, and demons. Each player has an ability and is never eliminated.

5-20 players

Trouble Brewing is the only edition ready at this time. 

### Usage

To run the game setup script, clone the repo and in terminal enter:

```
./setup.sh
```

Sample output:

```
$ ./setup.sh 
Number of players? 
9
imp
poisoner
drunk
saint
slayer
washerwoman
fortune_teller
soldier
investigator

```

### Docker usage

If you're experiencing issues with the .sh script on your OS you can also use the Dockerized version of the script. 


Start with building the script container.

```
make build
```

Now run the script using:

```
make run
```
