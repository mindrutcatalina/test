# Liga AC 2022

You are given a list of golfers. For each golfer you know their ID, name and the name of the club they are a member in.

You are given a list of scores. For each score you know its value and who it belongs to (golfer ID). Each golfer will have at least one score.

A golfer's skill level is defined as the average value among their scores (rounded down to the nearest integer).

### Evaluation
Solve as many subtasks as you can. You can submit partial solutions.

Focus on correctness, performance and code quality.

### Sample Input
```
7
1 Mihai Merion
2 George Sungarden
100 Maria Applebrook
13 Elena Applebrook
5 Andrei Sungarden
77 Sergiu Sungarden
99 Cristina Applebrook
10
80 77
99 100
60 77
88 100
71 77
61 1
68 2
95 13
63 5
90 99
```

### Subtask 1
Print the clubs sorted by their number of members starting with the largest.

Within a club print the names of the members sorted by their skill level starting with the best (highest value).

### Output 1
```
Sungarden: Sergiu George Andrei
Applebrook: Elena Maria Cristina
Merion: Mihai
```

### Explanation 1
```
Sergiu has 3 scores: 80, 60 and 73. His skill level is (80 + 60 + 71) / 3 = 70.3 which is rounded down to 70.
Maria has 2 scores: 99 and 88. Her skill level is (99 + 88) / 2 = 93.5 which is rounded down to 93.
Mihai has only one score, so his skill level is 61.
George's skill level is 68.
Elena's skill level is 95.
Andrei's skill level is 63.
Cristina's skill level is 90.
```

### Subtask 2
The goal of this task is to balance the clubs' skill levels. A club's skill level is calculated as the maximum of the member golfers' skill levels.

Balancing the clubs' skill levels means that the weakest club and the strongest club are as close as possible skill-wise. In other words, minimize the difference between the highest and lowest club skills.

You can transfer any number of golfers from one club to another, but make sure not to leave any clubs empty.

You should output the club members after completing the transfers using the same format as Subtask 1.

### Output 2
```
Sungarden: Maria Sergiu George Andrei
Applebrook: Elena
Merion: Cristina Mihai
```

### Explanation 2
```
Sungarden members skill levels: 70, 68, 63.
Applebrook members skill levels: 95, 93, 90.
Merion members skill levels: 61.

Sungarden's skill level is 70.
Applebrook's skill level is 95.
Merion's skill level is 61.

One possible solution (but not the only one) is transferring Maria from Applebrook to Sungarden and Cristina from Applebrook to Merion. The clubs' skill levels become the following:
Sungarden's skill level is 93.
Applebrook's skill level is 95.
Merion's skill level is 90.

The difference between the weakest and the strongest club is 5.
```

### Subtask 3
Your goal is the same as Subtask 2, but you only have 1 transfer available.

The transfers done in Subtask 2 are independent of this subtask.

### Output 3
```
Sungarden: Sergiu George Andrei
Applebrook: Maria Cristina
Merion: Elena Mihai
```

### Explanation 3
```
Sungarden members skill levels: 70, 68, 63.
Applebrook members skill levels: 95, 93, 90.
Merion members skill levels: 61.

Sungarden's skill level is 70.
Applebrook's skill level is 95.
Merion's skill level is 61.

One possible solution (but not the only one) is transferring Elena from Applebrook to Merion. The clubs' skill levels become the following:
Sungarden's skill level is 70.
Applebrook's skill level is 93.
Merion's skill level is 95.
```
