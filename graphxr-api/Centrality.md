# Compute betweenness score
```javascript
Grove.AsyncButton({
  label: "Betweenness",
  onClick: async () => {
    const graph = api.getLayoutGraph();
    const result = api.betweenness(graph)
    graph.applyTransform((graph) => {
      graph.getNodes().forEach(node => {
        node.properties.betweenness = result.get(node.id)
      })
      return graph;
    }) 
  },
});
```