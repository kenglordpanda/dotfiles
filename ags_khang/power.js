const WINDOW_NAME = "powermenu";

const AppItem = (app) =>
  Widget.Button({
    on_clicked: () => {
      App.closeWindow(WINDOW_NAME);
      app.launch();
    },
    attribute: { app },
    child: Widget.Box({
      children: [
        Widget.Icon({
          icon: app.icon_name || "",
          size: 42,
        }),
        Widget.Label({
          class_name: "title",
          label: app.name,
          xalign: 0,
          vpack: "center",
          truncate: "end",
        }),
      ],
    }),
  });

const PowerMenu = ({ width = 100, height = 500, spacing = 12 }) => {
  return Widget.Menu({
    children: [
      Widget.MenuItem({
        child: Widget.Label("hello"),
      }),
    ],
  });
};

export const powermenu = Widget.Window({
  name: WINDOW_NAME,
  setup: (self) =>
    self.keybind("Escape", () => {
      App.closeWindow(WINDOW_NAME);
    }),
  visible: false,
  keymode: "exclusive",
  child: PowerMenu({
    width: 1000,
    height: 5000,
    spacing: 12,
  }),
});
