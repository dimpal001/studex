def factorial_iterative(n):
    """
    Calculate factorial using an iterative approach.
    """
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result


def factorial_recursive(n):
    """
    Calculate factorial using a recursive approach.
    """
    if n == 0 or n == 1:
        return 1
    else:
        return n * factorial_recursive(n - 1)


def main():
    number = int(input("Enter a number to calculate its factorial: "))

    if number < 0:
        print("Factorial is not defined for negative numbers.")
    else:
        print(f"Factorial of {number} (Iterative): {factorial_iterative(number)}")
        print(f"Factorial of {number} (Recursive): {factorial_recursive(number)}")


if __name__ == "__main__":
    main()
