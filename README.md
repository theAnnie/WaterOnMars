# WaterOnMarsDetector

NASA wishes to analyse soil on the surface of the planet Mars for the presence of water, using on-board instruments of the Curiosity rover. 
The sensors on the rover output raw data which can visualised as a grid representing the concentration of water in soil sample at 2D (x,y) coordinates on a map.

The raw measurements will always range from 0 (no water detected) to 9 (lots of water detected).

This data must be processed to find concentrated areas of water presence. The analysis consists of generating a score for each location on the grid.
The score is determined by adding the location's own raw water concentration value to its surrounding raw values. For instance, the score of location (1,1) in the following grid is determined as follows:

5 + 3 + 1 + 4 + 1 + 1 + 2 + 3 + 2 = 22

|---|---|---|---|---|
| 5 | 3 | 1 | 2 | 0 |
| 4 | 1 | 1 | 3 | 2 |
| 2 | 3 | 2 | 4 | 3 |
| 0 | 2 | 3 | 3 | 2 |
| 1 | 0 | 2 | 4 | 3 |

When dealing with locations around the edge of the grid the score should ignore values outside the grid. For instance the score of location (0,0) is as follows:

5 + 3 + 4 + 1 = 13