```javascript
const graph = api.getLayoutGraph();
graph.applyTransform(graph => {
  const node = api.makeNode({
    category: "Planet",
    properties: {
      name: "Earth",
    },
  })
  graph.addNode(node);
})
```