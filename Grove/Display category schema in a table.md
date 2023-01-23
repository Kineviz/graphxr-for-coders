```javascript
Grove.Div(
  { className: "schema" },
  html`<style>
    .schema table {
      width: 100%;
    }
  </style>`,
  html`<h1>Categories</h1>`,
  // Arrays of elements are flattened into the list of children
  Object.entries(schema.categories).map(([category, categorySchema]) =>
    Grove.Div(
      { className: "border border-primary rounded p-4 mb-2" },
      // Container elements take a variable list of children
      html`<h2>${Grove.Icon({ id: "circle", style: getCategoryStyle(category) })} ${category}</h2>`,
      Grove.ButtonGroup({className: "mb-3"},
        Grove.AsyncButton(Grove.Icon({ id: "trash" }), {
        	label: "Delete Category",
          onClick: async () => {
            api.getLayoutGraph().applyTransform((graph) => {
              graph.removeNodes(
                graph
                  .getNodes()
                  .filter(api.nodesByCategory(category))
                  .map((x) => x.id)
              );
            });
            api.triggerForceLayout();
          },
        }),
      ),
      Inputs.table(
        Object.entries(categorySchema.keys).map(([key, { values }]) => ({
          property: key,
          uniqueCount: Object.entries(values).length,
          transform: key,
        })),
        {
          layout: "auto",
          header: {
            property: "Property",
            uniqueCount: "Uniques",
            transform: "Transform",
          },
          width: {
            transform: 100,
          },
          sort: "uniqueCount",
          reverse: true,
          rows: 20,
          format: {
            transform: (key) =>
              Grove.ButtonGroup(
                Grove.AsyncButton(Grove.Icon({ id: "plus" }), {
                  tooltip: "Extract new category",
                  onClick: async () => {
                    api.getLayoutGraph().applyTransform(
                      api.extract({
                        category,
                        props: [
                          {
                            name: key,
                            isKey: true,
                          },
                        ],
                        newCategory: key,
                        newRelationship: `${category}_${key}`,
                      })
                    );
                    api.triggerForceLayout();
                  },
                })
              ),
          },
        }
      )
    )
  )
);
```