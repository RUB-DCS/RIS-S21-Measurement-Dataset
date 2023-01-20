# RIS switching state optimization

The tuning of the RIS switching states is very challenging, since there are $2^{256}$ possible switching states for the 16x16 element RIS and thus an exhaustive search is not possible.
To find an RIS switching state, that optimizes the received power or minimizes the received power, we use two approaches:

## Iterative Approach

The iterative approaches require a certain number of measurements and then converge towards a good switching state. The algorithm are described in detail here: [Iterative approach](IterativeApproaches.md)

## Geometric Approach

The geometric approaches require the complete knowledge of the geometry of the setup, but therefore don't need additional measurements. The geometrix approaches are described in detail here: [Geometric approach](GeometricApproaches.md)


