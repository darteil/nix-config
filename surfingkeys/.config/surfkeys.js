const {
  aceVimMap,
  mapkey,
  imap,
  iunmap,
  imapkey,
  getClickableElements,
  vmapkey,
  map,
  unmap,
  cmap,
  addSearchAlias,
  removeSearchAlias,
  tabOpenLink,
  readText,
  Clipboard,
  Front,
  Hints,
  Visual,
  RUNTIME,
} = api;

settings.scrollStepSize = 70;

Hints.style(
  " \
    font-family: 'Source Code Pro', Ubuntu, sans; \
    font-size: 12px; \
    font-weight: 600; \
    border: 1px solid black; \
    border-radius: 0px; \
    padding: 0 3px; \
  "
);

Hints.style(
  " \
    font-family: 'Source Code Pro', Ubuntu, sans; \
    font-size: 12px; \
    font-weight: 600; \
    border: 1px solid black; \
    border-radius: 0px; \
    padding: 0 3px; \
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#FFF785), color-stop(100%,#FFC542)); \
  ",
  "text"
);

Visual.style("cursor", "background: unset; background-color: #ca4b16");

settings.theme = `
  .sk_theme {
    background: #fdf6e3;
    color: #647b83;
  }
  .sk_theme tbody {
    color: #647b83;
  }
  .sk_theme input {
    color: #647b83;
  }
  .sk_theme .url {
    color: #647b83;
  }
  .sk_theme .annotation {
    color: #647b81;
  }

  /* Omnibar styling */

  #sk_omnibarSearchArea .prompt, #sk_omnibarSearchArea .resultPage {
    display: flex;
  }
  .sk_theme .omnibar_highlight {
    color: #333;
    background: #ebdbb2;
  }
  .sk_theme #sk_omnibarSearchResult {
    font-size: 16px;
  }
  .sk_theme #sk_omnibarSearchResult ul>li:nth-child(odd) {
    background: #fdf6e3;
  }
  .sk_theme #sk_omnibarSearchResult ul>li.focused {
    background: #efe8d5;
  }

  #sk_omnibar {
    border-radius: 0;
  }
  .sk_omnibar_middle #sk_omnibarSearchArea {
    margin: 0;
    padding: 10px 10px 8px 10px;
  }

  /* Keystroke hints */

  #sk_keystroke {
    border: 1px solid #258bd5;
    font-family: 'Source Code Pro', Ubuntu, sans;
    background: #fdf6e3;
    color: #647b83;
    padding: 5px;
    border-radius: 2px;
  }
  #sk_keystroke kbd {
    background-color: white;
    box-shadow: unset;
    border-color: #e6eaff;
  }
  #sk_keystroke .kbd-span {
    font-size: 15px;
  }
  #sk_keystroke span.annotation {
    font-size: 14px;
    color: #1a1d31;
    padding-left: 13px;
    line-height: 20px;
  }
  #sk_keystroke kbd > .candidates {
    color: #ff4081;
    font-weight: normal;
  }

  /* sk editor */

  #sk_editor {
    background: #fdf6e3 !important; 
  }
  .ace-chrome .ace_print-margin,
  .ace-chrome .ace_gutter,
  .ace-chrome .ace_gutter-cell,
  .ace-chrome .ace_dialog {
    background: #fdf6e3;
  }
  .normal-mode .ace_cursor {
    background-color: #ca4b16 !important;
    border: #ca4b16 !important;
    opacity: 0.7 !important;
  }

`;
