**Note: These examples assume you have read [[Import GraphXR API]] first.**

## Clear the graph
```javascript
api.getLayoutGraph().applyTransform((graph) => {
  graph.clear();
});
```