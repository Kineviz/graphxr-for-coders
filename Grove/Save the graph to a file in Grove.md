Some examples assume GraphXR API is stored in `api`.
- latest: `api = getApi()`
- pinned: `api = getApi('0.0.240')`

## Save a graph snapshot to Grove's File Explorer
```javascript
// The file 'my-graph-1' will be accessible to anyone with access to this Grovebook
Grove.AsyncButton({
  label: "Save Graph Snapshot",
  onClick: async () => {
    await Grove.save({ path: "my-graph-v1", json: api.getLayoutGraph().getSnapshot() });
  },
})
```

## Load a graph snapshot from Grove's File Explorer
```javascript
Grove.AsyncButton({
  label: "Load Graph Snapshot",
  onClick: async () => {
    const json = await Grove.loadFile({ path: "my-graph-v1", type: "json" });
    api.getLayoutGraph().applySnapshot(json);
  },
})
```