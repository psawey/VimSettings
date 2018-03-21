﻿// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // Choose either "stable" for receiving highly polished,
    // or "canary" for less polished but more frequent updates
    updateChannel: 'stable',

    // default font size in pixels for all tabs
    fontSize: 16,

    // font family with optional fallbacks
    // fontFamily: 'Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    // fontFamily: 'Consolas',
    fontFamily: 'Consolas, "Courier New", monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    // cursorColor: 'rgba(248,28,229,0.8)',
    cursorColor: '#d4d4d4',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BEAM',

    // set to true for blinking cursor
    cursorBlink: true,

    // color of the text
    // foregroundColor: '#fff',
    foregroundColor: '#d4d4d4',

    // terminal background color
    // backgroundColor: '#000',#1e1e1e
    backgroundColor: '#1e1e1e',

    // border color (window, tabs)#444444
    borderColor: '#000',

    // custom css to embed in the main window
    css: '',

    // custom css to embed in the terminal window
    termCSS: '',

    // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    modifierKeys: {
      cmdIsMeta: false,
      altIsMeta: true
    },

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '14px 16px 10px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#000000',
      red: '#800000',
      green: '#008000',
      yellow: '#808000',
      blue: 'rgba(86, 156, 214, 1)',
      magenta: '#800080',
      cyan: '#008080',
      white: '#d4d4d4',
      lightBlack: '#808080',
      lightRed: '#ff0000',
      lightGreen: '#00ff00',
      lightYellow: '#ffff00',
      lightBlue: '#0000ff',
      lightMagenta: '#ff00ff',
      lightCyan: '#00ffff',
      lightWhite: '#ffffff'
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // Powershell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: 'C:\\Program Files\\Git\\git-cmd.exe',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--command=usr/bin/bash.exe', '-l', '-i'],

    // for environment variables
    env: { TERM: 'cygwin'},

    // set to false for no bell
    bell: false,

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: true,

    // if true, on right click selected text will be copied or pasted if no
    // selection is present (true by default on Windows)
    // quickEdit: true

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
    hypercwd: {
      initialWorkingDirectory: ''
    },
    summon: {
      hideDock: true,
      hideOnBlur: false,
      hotkey: 'Ctrl+`'
    },
    confirmQuit: true
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  // 'hyperlayout'
  plugins: ['hypercwd', 'hyperterm-summon'],
  // , 'hyperlayout'

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    // 'window:devtools': 'ctrl+shift+o',
    'editor:movePreviousWord': 'alt+left',
    'editor:moveNextWord': 'alt+right'
  }
};
