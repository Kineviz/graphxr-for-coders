```javascript
Grove.Div(
  html`<h1>Animation</h1>`,
  Grove.ButtonGroup(
    Grove.Button(Grove.Icon({ id: "fast-backward" }), {
      onClick: () => {
        api.setCameraOptions({ hideAxes: true, speed: -1.5, rotating: true });
      },
    }),
    Grove.Button(Grove.Icon({ id: "backward" }), {
      onClick: () => {
        api.setCameraOptions({ hideAxes: true, speed: -1.0, rotating: true });
      },
    }),
    Grove.Button(Grove.Icon({ id: "play" }), {
      onClick: () => {
        api.setCameraOptions({ hideAxes: true, speed: 1.0, rotating: true });
      },
    }),
    Grove.Button(Grove.Icon({ id: "pause" }), {
      onClick: () => {
        api.setCameraOptions({ hideAxes: false, rotating: false });
      },
    }),
    Grove.Button(Grove.Icon({ id: "forward" }), {
      onClick: () => {
        api.setCameraOptions({ hideAxes: true, speed: 1.5, rotating: true });
      },
    }),
    Grove.Button(Grove.Icon({ id: "fast-forward" }), {
      onClick: () => {
        api.setCameraOptions({ hideAxes: true, speed: 2.0, rotating: true });
      },
    })
  )
)
```