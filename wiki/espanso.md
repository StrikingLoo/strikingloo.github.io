---
layout: post
title: "Espanso"
date: 2023-03-14
tags: productivity, software, bash
description: "A compilation of Espanso scripts that exemplify its syntax, from the documentation and my own uses"
abstract: "A compilation of Espanso scripts that exemplify its syntax, from the documentation and my own uses"
language: English
importance: 4
---

### Text Replacement

```
# Simple text replacement
  - trigger: ":espanso"
    replace: "Hi there!"
```

### Choice 

```
  - trigger: ":quote"
    replace: "{{output}}"
    vars:
      - name: output
        type: choice
        params:
          values:
            - "Every moment is a fresh beginning."
            - "Everything you can imagine is real."
            - "Whatever you do, do it well."
```

### Calling a Shell Command from Espanso

```
  # Print the output of a shell command
  - trigger: ":shell"
    replace: "{{output}}"
    vars:
      - name: output
        type: shell
        params:
          cmd: "echo 'Hello from your shell'"
```

### Using text from Clipboard 

```
  - trigger: ":a"
    replace: "<a href='{{clipboard}}' />$|$</a>"
    vars:
      - name: "clipboard"
        type: "clipboard"
```

### Catching an Argument Through Regex

```
  - regex: ":greet\\((?P<person>.*)\\)"
    replace: "Hi {{person}}!"
```

### Config Files

To add more config files instead of depending on base.yml, you can add them to your user folder and include the lines

```
name: $A_NAME
parent: default
```

At the top.
