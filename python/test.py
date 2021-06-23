from x_ray_transformation import Domain, Surface, Hyperbolic, Euclidean, Gaussian, Polynomial, Sphere
from random import randrange


def test_metrics(num_elements: int = 1, x_values=None, y_values=None, lower_bound: int = 0, upper_bound: int = 1000) -> None:
    if x_values is None or y_values is None:
        x_values = [randrange(lower_bound, upper_bound, 1) for _ in range(num_elements)]
        y_values = [randrange(lower_bound, upper_bound, 1) for _ in range(num_elements)]

    metrics = [Euclidean(),
               Gaussian([0.25, 0.25], [0.45, -0.45], [0.3, -0.3], [0.3, -0.3]),
               Hyperbolic(2),
               Polynomial([-1.1, 0.0, -1.1, 0, 0, 3]),
               Sphere(2)]

    try:
        for metric in metrics:
            domain = Domain()
            surface = Surface(domain, metric)
            surface.metric.compute_values(x_values, y_values)

            print(surface.metric.__str__())
    except Exception as exception:
        print("Exception Raised: ", exception)
