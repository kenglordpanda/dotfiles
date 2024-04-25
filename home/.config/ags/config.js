const time = Variable("", {
  poll: [
    1000,
    function () {
      return Date().toString();
    },
  ],
});

const battery = await Service.import("battery");
const contBattery = Widget.LevelBar({
  widthRequest: 100,
  value: battery.bind("percent").as((p) => p / 100),
});

const calendar = Widget.Calendar({
  showDayNames: true,
  showDetails: true,
  showHeading: true,
  showWeekNumbers: true,
  detail: (self, y, m, d) => {
    return `<span color="white">${y}. ${m}. ${d}.</span>`;
  },
  onDaySelected: ({ date: [y, m, d] }) => {
    print(`${y}. ${m}. ${d}.`);
  },
});
// Define inBar Widgets here

// hyprland specific
const hyprland = await Service.import("hyprland");

const focusedTitle = Widget.Label({
  hpack: "end",
  label: hyprland.active.client.bind("title"),
  visible: hyprland.active.client.bind("address").as((addr) => !!addr),
  justification: "center",
  truncate: "end",
  maxWidthChars: 10,
  useMarkup: true,
});

const systemtray = await Service.import("systemtray");

/** @param {import('types/service/systemtray').TrayItem} item */
const SysTrayItem = (item) =>
  Widget.Button({
    child: Widget.Icon().bind("icon", item, "icon"),
    tooltipMarkup: item.bind("tooltip_markup"),
    onPrimaryClick: (_, event) => item.activate(event),
    onSecondaryClick: (_, event) => item.openMenu(event),
  });

const sysTray = Widget.Box({
  children: systemtray.bind("items").as((i) => i.map(SysTrayItem)),
});
// end hyprland specific

// End Def Widgets

const Bar = (/** @type {number} */ monitor) =>
  Widget.Window({
    monitor,
    name: `bar${monitor}`,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: Widget.Box({
        spacing: 8,
        homogeneous: false,
        vertical: false,
        children: [focusedTitle, sysTray],
      }),
      // center_widget: Widget.Box({
      //   spacing: 8,
      //   homogenous: false,
      //   vertical: false,
      //   children: [calendar],
      // }),

      end_widget: Widget.Box({
        spacing: 8,
        homogeneous: false,
        vertical: false,
        children: [contBattery],
      }),
    }),
  });

App.config({
  windows: [Bar(0)],
});
