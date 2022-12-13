GraphXR ([[What is GraphXR?]]) provides a coder friendly API, called [[GraphXR API]] which makes it easier to work with data, layouts, transforms, and algorithms. GraphXR bundles 🌳 [[Grove]], a JavaScript playground suitable for rapidly developing custom applications with GraphXR and GraphXR API.

## Quickstart
1. Create a GraphXR account
2. Login and create a new project
3. Open Grove from the Project > Extensions tab
4. Click on the pencil to start editing
5. Create two cells
```javascript
// 1
Grove.Button({
  label: "Hello, world!",
  onClick: () => {
    console.log('Hello, world!');
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
  },
})

// 2
api = getApi();
```
6. Click the "Hello, world!" button
7. Expected: a node appears with category "Planet" and property name = "Earth".