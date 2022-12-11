UI and File System related snippets applicable to Grove.

All of these examples assume GraphXR API is stored in `api`.
- latest: `api = getApi()`
- pinned: `api = getApi('0.0.240')`

### Simple, synchronous button
```javascript
Grove.Button({
  label: "Hello, world!",
  onClick: () => {
    console.log('Hello, world!');
  },
})
```

### Run async code in a button
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

### Button group
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

### Save a graph snapshot to Grove's File Explorer
```javascript
// The file 'my-graph-1' will be accessible to anyone with access to this Grovebook
Grove.AsyncButton({
  label: "Save Graph Snapshot",
  onClick: async () => {
    await Grove.save({ path: "my-graph-v1", json: api.getLayoutGraph().getSnapshot() });
  },
})
```

### Load a graph snapshot from Grove's File Explorer
```javascript
Grove.AsyncButton({
  label: "Load Graph Snapshot",
  onClick: async () => {
    const json = await Grove.loadFile({ path: "my-graph-v1", type: "json" });
    api.getLayoutGraph().applySnapshot(json);
  },
})
```

### Clear the graph
```javascript
Grove.Button({
  label: "Clear!",
  onClick: () => {
    api.getLayoutGraph().applyTransform((graph) => {
      graph.clear();
    });
  },
}),
```