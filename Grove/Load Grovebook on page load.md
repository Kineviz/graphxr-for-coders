1. Choose a project
2. Pin Grove in the UI Configuration
3. Load a project. e.g. 'GroveFS'
4. Append `?groveFileKey=<name of Grovebook>` to the URL.

e.g. `https://graphxrdev.kineviz.com/p/6390d5f3b9c08c5144d4d56f/GroveFS?groveFileKey=showToast`

Optionally, append `&groveStartHidden=true`.

Register some code to run only once using this pattern:

```javascript
(() => {
  const key = "GROVE_SETUP";
  if (!window[key]) {
    console.log("[Grove] Running setup");
    window[key] = true;
    // SETUP CODE HERE
  } else {
    console.log("[Grove] We already setup");
  }
})()
```