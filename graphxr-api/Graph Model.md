## Prerequisites
[[Import GraphXR API]]

## Clear the graph
```javascript
api.getLayoutGraph().applyTransform((graph) => {
  graph.clear();
});
```