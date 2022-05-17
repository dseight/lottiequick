# Contributing to LottieQuick

## Coding Style

Follow Qt C++ and QML coding conventions:
- [Qt Coding Style](https://wiki.qt.io/Qt_Coding_Style)
- [API Design Principles](https://wiki.qt.io/API_Design_Principles)
- [QML Coding Conventions](https://doc.qt.io/qt-5/qml-codingconventions.html)

Before submitting a patch, run `git clang-format` on your staged changes. But be aware that clang-format doesn't format `connect()` properly. E.g. this is what connect should look like:
```cpp
connect(sender, &MySender::valueChanged,
        receiver, &MyReciever::updateValue);
```
and here is what clang-format produces:
```cpp
connect(sender,
        &MySender::valueChanged,
        receiver,
        &MyReciever::updateValue);
```

## Submitting Patches

### Make atomic changes

Each pull request (PR) should be a single atomic change, meaning that it could be merged or rejected as a unit. It is okay for a PR to contain multiple commits if later commits depend on earlier ones.

### Split up long patches

Split up longer patches into a patch series of logical code changes. Each change should compile and execute successfully. For instance, don’t add a file to the CMakeLists.txt in patch one and then add the file itself in patch two. A commit message that mentions “Also, …” is often a good candidate for splitting into multiple patches.

### Don’t include irrelevant changes

In particular, don’t include formatting, coding style, or whitespace changes to bits of code that would otherwise not be touched by the patch. (It’s OK to fix coding style issues in the immediate area (few lines) of the lines you’re changing.) If you think a section of code really does need a reindent or other large-scale style fixes, submit this as a separate patch that makes no semantic changes; don’t put it in the same patch as your bug fix.

### Write a meaningful commit message

Commit messages should be meaningful and should stand on their own as a historical record of why the changes you applied were necessary or useful.

This project follows the usual standard for git commit messages: the first line is “Single line summary of change”. It usually should start with a capital letter and not end in a dot. Then there is a blank line and a more detailed description of the patch. Please do not use lines that are longer than 76 characters in your commit message (so that the text still shows up nicely with “git show” in an 80-columns terminal window).

The body of the commit message is a good place to document why your change is important. Make sure the body of the commit message can be read in isolation — a body that starts with “… so that” as a continuation of the subject line is harder to follow.

See also [How to Write a Git Commit Message](https://cbea.ms/git-commit/) by @cbeams.
