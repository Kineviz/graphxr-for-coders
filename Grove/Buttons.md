## Simple, synchronous button
```javascript
Grove.Button({
  label: "Hello, world!",
  onClick: () => {
    console.log('Hello, world! 🧙');
  },
})
```

## Run async code in a button
```javascript
Grove.AsyncButton({
  label: "setTimeout",
  onClick: async () => {
    return new Promise((resolve) => {
      setTimeout(() => resolve(), 1000);
    })
  },
})
```

## Button group
```javascript
Grove.ButtonGroup([
  Grove.AsyncButton({
    label: "1",
    onClick: async () => {
      console.log('I am button 1');
    },
  }),
  Grove.Button({
    label: "2",
    onClick: async () => {
      console.log('I am button 2'),
    },
  })
])
```
