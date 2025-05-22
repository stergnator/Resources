# Javascript Notes

## How do `.then()` and `catch` work with `async/await`?

The `async/await` syntax in JavaScript provides a more readable and synchronous-like way to work with `promises`, but it still relies on the underlying `promise` mechanism for handling asynchronous operations. `then` and `catch` continue to play a role in error handling and `promise` resolution when using `async/await`, although their usage might look slightly different compared to traditional `promise` chaining.

### `.then()` with `async/await`

When an `async` function is called, it implicitly returns a `promise`. The `await` keyword is used inside an `async` function to pause the execution until a `promise` is resolved. Once the `promise` is resolved, the `await` expression returns the `resolved` value, and the execution of the `async` function continues.
While you can use `.then()` with an `async` function's returned `promise`, it's often unnecessary *because `await` already handles the resolution of the `promise` within the `async` function*.

```javascript
async function fetchData() {
  try {
    const response = await fetch('https://example.com/data');
    const data = await response.json();
    return data;
  } catch (error) {
    throw new Error('Failed to fetch data');
  }
}

fetchData()
  .then(result => console.log('Data:', result))
  .catch(error => console.error('Error:', error.message));

```

### `catch` with `async/await`

Error handling in `async/await` is typically done using `try...catch` blocks. Any errors thrown within the `try block`, including those from awaited `promises`, will be caught in the `catch` block.

```javascript
async function fetchData() {
  try {
    const response = await fetch('https://example.com/data');
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Error fetching data:', error);
    // Optionally re-throw the error to propagate it further
    throw error;
  }
}

fetchData().catch(error => console.error("Outer catch:", error));

```


### Mixing async/await with .then() and .catch()

While it's possible to mix `async/await` with `.then()` and `.catch()`, it's generally not recommended as it can make the code harder to read and understand. The primary benefit of `async/await` is to simplify asynchronous code, and mixing it with traditional `promise` chaining can negate this benefit.

