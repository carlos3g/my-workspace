"use strict";

// See https://hyper.is#cfg
module.exports = {
  config: {
    hyperTabs: {
      tabIcons: true,
      activityColor: "salmon",
      closeAlign: "right",
      border: true,
    },
    windowSize: [1000, 500],
    updateChannel: "stable",
    fontSize: 11,
    fontFamily: '"Fira Code", Consolas, monospace',
    fontWeight: "normal",
    fontWeightBold: "bold",
    lineHeight: 1,
    letterSpacing: 0,
    cursorColor: "rgba(248,28,229,0.8)",
    cursorAccentColor: "#000",
    cursorShape: "BLOCK",
    cursorBlink: true,
    foregroundColor: "#fff",
    backgroundColor: "#000",
    selectionColor: "rgba(248,28,229,0.3)",
    borderColor: "#333",
    css: "",
    termCSS: "",
    workingDirectory: "/home/carlos3g/projects",
    showHamburgerMenu: "",
    showWindowControls: "",
    padding: "12px 14px",
    colors: {
      black: "#000000",
      red: "#C51E14",
      green: "#1DC121",
      yellow: "#C7C329",
      blue: "#0A2FC4",
      magenta: "#C839C5",
      cyan: "#20C5C6",
      white: "#C7C7C7",
      lightBlack: "#686868",
      lightRed: "#FD6F6B",
      lightGreen: "#67F86F",
      lightYellow: "#FFFA72",
      lightBlue: "#6A76FB",
      lightMagenta: "#FD7CFC",
      lightCyan: "#68FDFE",
      lightWhite: "#FFFFFF",
      limeGreen: "#32CD32",
      lightCoral: "#F08080",
    },
    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Windows Subsystem for Linux (WSL) - previously Bash on Windows
    // - Example: `C:\\Windows\\System32\\wsl.exe`
    //
    // Git-bash on Windows
    // - Example: `C:\\Program Files\\Git\\bin\\bash.exe`
    //
    // PowerShell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    //
    // Cygwin
    // - Example: `C:\\cygwin64\\bin\\bash.exe`
    shell: "",
    // for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
    // by default `['--login']` will be used
    shellArgs: ["--login"],
    env: {},
    bell: "SOUND",
    copyOnSelect: false,
    defaultSSHApp: true,
    quickEdit: false,
    macOptionSelectionMode: "vertical",
    webGLRenderer: true,
    webLinksActivationKey: "",
    disableLigatures: true,
    disableAutoUpdates: false,
    screenReaderMode: false,
    preserveCWD: true,
    // for advanced config flags please refer to https://hyper.is/#cfg
  },
  plugins: [
    "hyper-dracula",
    "hyperborder",
    "hyperminimal",
    "hyperlinks",
    "hyper-tabs-enhanced",
  ],
  localPlugins: [],
  keymaps: {},
};
//# sourceMappingURL=config-default.js.map
