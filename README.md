# Redux for iOS

This repository houses both the bootstrap project and the reference implementation of a workshop about using [Redux](http://reduxjs.org) in iOS applications, which took place at the 2016 edition of the [CocoaHeads Conference Brazil](http://cocoaheadsconference.com.br).

## About the project

This workshop follows participants through a very simple app that displays post titles from a pre-determined list of Subreddits. Subreddits and posts are rendered in table views, and each subreddit's list of posts is pushed into a stack-based navigation upon subreddit selection.

## Branching

- The `master` branch points to a bootstrap project that will be the starting point of the workshop.
- The `reference` branch points to a reference implementation of the final version of the app. It is useful as guide, but it should not dictate the course of the workshop.

## Requirements

- Xcode 8.0+
- iOS 10.1+

## Installation

The project has a single dependency, which is [Redux.swift]@(https://github.com/fellipecaetano/Redux.swift). It was initially integrated to the project using [Carthage]@(https://github.com/Carthage/Carthage), but the build doesn't require Carthage to be installed. The following installation steps should suffice:

1. Clone the desired branch using the following command
```shell
git clone -b <branch> https://github.com/fellipecaetano/ReduxAtCHConf
```

2. Enter the `app` directory

3. Use Xcode 8.0+ to open `RedditClient.xcworkspace`

4. Build and run

5. There's no step 5
