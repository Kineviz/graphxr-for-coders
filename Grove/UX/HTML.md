## Render a table of statistics for property keys and their unique values in each category
This one requires two cells.
```javascript
// Cell 1
schema = api
  .getLayoutGraph()
  .getNodes()
  .reduce(
    (stats, node) => {
      const { category, properties } = node;
      const { categories } = stats;
      if (!categories[category]) categories[category] = { keys: {} };
      const { keys } = categories[category];
      Object.entries(properties).forEach(([key, value]) => {
        if (!keys[key]) keys[key] = { values: {} };
        if (!keys[key]["values"][value]) keys[key]["values"][value] = 0;
        keys[key]["values"][value] += 1;
      });
      return stats;
    },
    { categories: {} }
  )

// Cell 2
Grove.Div(
  Object.entries(schema.categories).map(([category, categorySchema]) =>
    Grove.Div(
      html`<h1>${category}</h1>`,
      Grove.Table(
        Grove.Tr(
          Grove.Th("Key"),
          Grove.Th("Unique Values"),
          Grove.Th("Transform")
        ),
        Object.entries(categorySchema.keys).map(([key, { values }]) =>
          Grove.Tr(
            key,
            Object.entries(values).length,
            Grove.ButtonGroup(
              Grove.AsyncButton(html`<span class="fa fa-plus"></span>`, {
                label: "Extract to new category",
                onClick: async () => {
                  api
                    .getLayoutGraph()
                    .applyTransform(
                      api.extract({
                        category,
                        props: [{ name: key, isKey: true }],
                        newCategory: key,
                      })
                    );
                },
              })
            )
          )
        )
      )
    )
  )
)
```