**Note: These examples assume you have read [[Import GraphXR API]] first.**

## Save a graph snapshot to Grove's File Explorer
```javascript
// The file 'cache' will be accessible to anyone with access to this Grovebook
Grove.AsyncButton({
  label: "Save Graph Snapshot",
  onClick: async () => {
    const path = "cache";
    const json = api.getLayoutGraph().getSnapshot();
    await Grove.saveFile({ path, json });
    Grove.showToast(`Saved snapshot "${path}"`);
  },
})
```

## Load a graph snapshot from Grove's File Explorer
```javascript
Grove.AsyncButton({
  label: "Load Graph Snapshot",
  onClick: async () => {
    const path = "cache";
    const json = await Grove.loadFile({ path, type: "json" });
    api.getLayoutGraph().applySnapshot(json);
    Grove.showToast(`Loaded snapshot "${path}"`);
  },
})
```