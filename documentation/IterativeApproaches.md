# Iterative Approaches

The tuning of the RIS switching states is very challenging, since there are $2^{256}$ possible switching states for the 16x16 element RIS and thus an exhaustive search is not possible. In contrast to the [geometric approaches](./GeometricApproaches.md), which require the complete geometry of the setup, iterative approaches are presented here. The iterative approaches require a certain number of measurements and then converge towards a good switching state.

## Single Element Optimization

The single element optimization algorithm as described by  [[3]](./References.md#1), [[4]](./References.md#1) , [[5]](./References.md#1) iterates through all 256 elements of the surface, where every single element is toggled and the corresponding S21 parameter is measured with the VNA. The optimization starts with the 'All elements off' state.

If the goal is to maximize the reflected power in the direction of a user, then the toggled element is left on when the measured received power is higher than in the preceding measurement. If the goal is to minimize the reflected power in the direction of a user, then the toggled element is left on if the measured received power is lower than in the preceding measurement. Otherwise the respective element is switched off again.

A complete run of the algorithm takes 256 S21 measurements to complete. Which takes with the settings used for the VNA, control delays etc. around 64 seconds to complete.
The results files contain the following fields and data for the SE opt algorithm:

| Variable name         | Dimension | Type                    | Description                                                                             |
| --------------------- |:---------:|:-----------------------:| --------------------------------------------------------------------------------------- |
| convergence.algoSEmax | 1x256     | double                  | \|S21\| @ 5.375GHz for each step of the SE max algorithm (Convergence over iterations). |
| convergence.algoSEmin | 1x256     | double                  | \|S21\| @ 5.375GHz for each step of the SE min algorithm (Convergence over iterations). |
| patterns.algoSEmax    | 1x256     | cell{each 16x16 double} | RIS switching state ( pattern) for the respective step of the SE max algorithm.         |
| patterns.algoSEmin    | 1x256     | cell{each 16x16 double} | RIS switching state ( pattern) for the respective step of the SE min algorithm.         |
| results.algoSEmax     | 1x256     | cell{each S21 struct}   | S21 parameters for the respective step of the SE max algorithm.                         |
| results.algoSEmin     | 1x256     | cell{each S21 struct}   | S21 parameters for the respective step of the SE max algorithm.                         |

## Greedy Algorithm

The greedy algorithm used to optimize the RIS switching state is described in-detail in our publications [[2]](./References.md#2) and [[3]](./References.md#3).
The greedy algorithm uses two buffers that hold the magnitude readings found so far and the corresponding RIS configurations. The greedy search starts with an initialization phase, where random RIS configurations are generated and the corresponding S21 parameter for every setting is measured with the VNA. After filling the buffer with initial measurements, the buffered data is used to calculate a ratio for every element, expressing how many times the surface is active. The ratio is then used to generate a new configuration for the RIS. With the new setting a measurement is made. If the new reading is lower than the highest magnitude in the buffer the new reading replaces this reading in the buffers. The loop repeats until a predefined number of iterations, 2500 in our case, is reached.
The following fields and data are contained in the results files for the Greedy optimization algorithm:

| Variable name             | Dimension | Type                    | Description                                                                                                                    |
| ------------------------- |:---------:|:-----------------------:| ------------------------------------------------------------------------------------------------------------------------------ |
| convergence.algoGreedyMax | 1x2500    | double                  | \|S21\| @ 5.375GHz for each step of the Greedy max algorithm (Convergence over iterations).                                    |
| convergence.algoGreedyMin | 1x2500    | double                  | \|S21\| @ 5.375GHz for each step of the Greedy min algorithm (Convergence over iterations).                                    |
| patterns.algoGreedyMax    | 1x100     | cell{each 16x16 double} | RIS switching state ( pattern) for the last step (step 2500, converged) of the Greedy max algorithm for all buffered patterns. |
| patterns.algoGreedyMin    | 1x100     | cell{each 16x16 double} | RIS switching state ( pattern) for the last step (step 2500, converged) of the Greedy max algorithm for all buffered patterns. |
| results.algoGreedyMax     | 1x100     | cell{each S21 struct}   | S21 parameters for the last step (step 2500, converged) of the Greedy max algorithm for all buffered patterns                  |
| results.algoGreedyMin     | 1x100     | cell{each S21 struct}   | S21 parameters for the last step (step 2500, converged) of the Greedy max algorithm for all buffered patterns                  |
