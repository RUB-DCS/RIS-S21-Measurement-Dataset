# Dataset file format

The S21 measurements were recorded in Matlab<sup>&reg;</sup> and saved as one .mat-file each, containing all S21 measurements and RIS patterns(switching states) for them.

The dataset is divided into three subfolders 'nonSpecular', 'specular' and 'rotatingStage'. Each .mat-file within these folders has a unique ID (two-digit number) as file name. The number indicates the corresponding geometry and can also be found in tabular form here: [Geometries](Geometries.md)

Each .mat-file of the subfolders 'nonSpecular' and 'specular' contains the following variables:

| Variable name | Dimension | Type   | Description                                                                                                                      |
| ------------- |:---------:|:------:| -------------------------------------------------------------------------------------------------------------------------------- |
| convergence   | 1x1       | struct | Convergence value: Amplitude vs. Iterations for Greedy algorithm and Single Element Optimization                                 |
| freqPoints    | 1x201     | double | Frequency axis \[Hz\] (201 pts)                                                                                                  |
| geometry      | 1x1       | struct | Contains the geometry parameters of the specific setup. Parameters are also summarized in the table: [Geometries](Geometries.md) |
| patterns      | 1x1       | struct | Contains the RIS switching state/patterns corresponding to the S21 values in the variable 'results'.                             |
| reference     | 1x1       | struct | Contains four S21 reference measurements                                                                                         |
| results       | 1x1       | struct | Contains the S21 parameters for the corresponding RIS switching states in 'patterns'                                             |

 The 'rotatingStage' folder contains abweichend the following variables:        

Table: Rotating Stage

Detail explanation of the struct-variables:

## Fields of 'convergence'-struct

| Field name    | Dimension | Type   | Description                                                                                                                                      |
| ------------- |:---------:|:------:| ------------------------------------------------------------------------------------------------------------------------------------------------ |
| algoSEmax     | 1x256     | double | Convergence value: Amplitude vs. Iterations for Single Element Maximization @ 5.375Ghz Details on the algorithm: [SEmax](IterativeApproaches.md) |
| algoSEmin     | 1x256     | double | Convergence value: Amplitude vs. Iterations for Single Element Minimization @ 5.375Ghz Details on the algorithm: [SEmin](IterativeApproaches.md) |
| algoGreedyMax | 1x2500    | double | Convergence value: Amplitude vs. Iterations for Greedy Maximization @ 5.375Ghz Details on the algorithm: [GreedyMax](IterativeApproaches.md)     |
| algoGreedyMin | 1x2500    | double | Convergence value: Amplitude vs. Iterations for Greedy Minimization @ 5.375Ghz Details on the algorithm: [GreedyMin](IterativeApproaches.md)     |

## Fields of 'geometry'-struct

| Field name       | Dimension | Type   | Description                                                                             |
| ---------------- |:---------:|:------:| --------------------------------------------------------------------------------------- |
| distAnt1         | 1x1       | double | Distance of antenna 1 to the center of the RIS                                          |
| distAnt2         | 1x1       | double | Distance of antenna 2 to the center if the RIS                                          |
| AzimuthAngAnt1   | 1x1       | double | Azimuth angle of Ant 1 relative to the RIS, where 0° is perpendicular to the RIS.       |
| AzimuthAngAnt2   | 1x1       | double | Azimuth angle of Ant 2 relative to the RIS, where 0° is perpendicular to the RIS.       |
| heightAnt1       | 1x1       | double | Height of antenna 1.                                                                    |
| heightAnt2       | 1x1       | double | Height of antenna 2.                                                                    |
| ElevationAngAnt1 | 1x1       | double | Elevation angle of antenna 1 relative to the RIS, where 0° is perpendicular to the RIS. |
| ElevationAngAnt2 | 1x1       | double | Elevation angle of antenna 2 relative to the RIS, where 0° is perpendicular to the RIS. |

## Fields of 'patterns'-struct

| Field name    | Dimension | Type | Description                                                                                                                                                                                                  |
| ------------- |:---------:|:----:| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| algoSEmax     | 1x256     | cell | RIS switching states for each iteration of the single element maximization algorithm. Each cell contains a 16x16 double array representing the RIS switching state in a binary fashion \[0;1\]               |
| algoSEmin     | 1x256     | cell | RIS switching states for each iteration of the single element minimization algorithm. Each cell contains a 16x16 double array representing the RIS switching state in a binary fashion \[0;1\]               |
| algoGreedyMax | 1x100     | cell | RIS switching states buffer for the last, converged iteration of the greedy maximization algorithm. Each cell contains a 16x16 double array representing a RIS switching state in a binary fashion \[0;1\]   |
| algoGreedyMin | 1x100     | cell | RIS switching states buffer for the last, converged iteration of the greedy minimization algorithm. Each cell contains a 16x16 double array representing a RIS switching state in a binary fashion \[0;1\]   |
| rand          | 1x1000    | cell | RIS switching states for at least 1000 pseudo-random switching states. Note: The rand-seed was configured to be the same for all geometries such that the same 'random' patterns are just in every geometry. |
| KW            | 1x7428    | cell | RIS switching states for specific geometric patterns, explained in detail, here: [KW](GeometricApproaches.md#KW)                                                                                             |
| MH            | 1x1000    | cell | RIS switching states for specific geometric patterns, explained in detail, here: [MH](GeometricApproaches.md#MH)                                                                                             |
| ST            | 1x322     | cell | RIS switching states for specific geometric patterns, explained in detail, here: [ST](GeometricApproaches.md#ST)                                                                                             |

## Fields of 'reference'-struct

| Field name | Dimension | Type   | Description                                                                                  |
| ---------- |:---------:|:------:| -------------------------------------------------------------------------------------------- |
| noPlate    | 1x1       | struct | S21 reference measurement, without RIS in place.                                             |
| Plate      | 1x1       | struct | S21 reference measurement, with metal plate of the same size as the RIS in place.            |
| RISallOff  | 1x1       | struct | S21 reference measurement, with the RIS in place, where all elements are configure to 'off'. |
| RISallOn   | 1x1       | struct | S21 reference measurement, with the RIS in place, where all elements are configure to 'on'.  |

## Fields of 'results'-struct

| Field name    | Dimension | Type   | Description                                                                                        |
| ------------- |:---------:|:------:| -------------------------------------------------------------------------------------------------- |
| algoSEmax     | 1x1       | struct | S21 measurement, with RIS configured to the respective switching states in patterns.algoSEmax.     |
| algoSEmin     | 1x1       | struct | S21 measurement, with RIS configured to the respective switching states in patterns.algoSEmin.     |
| algoGreedyMax | 1x1       | struct | S21 measurement, with RIS configured to the respective switching states in patterns.algoGreedyMax. |
| algoGreedyMin | 1x1       | struct | S21 measurement, with RIS configured to the respective switching states in patterns.algoGreedyMin. |
| rand          | 1x1       | struct | S21 measurement, with RIS configured to the respective switching states in patterns.rand.          |
| MH            | 1x1       | struct | S21 measurement, with RIS configured to the respective switching states in patterns.MH.            |
| KW            | 1x1       | struct | S21 measurement, with RIS configured to the respective switching states in patterns.KW.            |
| ST            | 1x1       | struct | S21 measurement, with RIS configured to the respective switching states in patterns.ST.            |
