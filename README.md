# mvvmc-dependecy-injection

Since I started to work with MVVM-C I found it a great architecture in terms of separation of concern.
I could easyly write down new features and find points of failure really fast.

But it isn't always a bed of flowers. My team and I started to realize that there were some pain points we were having because of it, and the main ones were:

1. It was hard to deal with two-or-more level dependecy:
In the way we were working, we usually had the Coordinator instantiating their own View Model, and the View Model instantiating what we called a Requester, in order to ask things to the Internet.
With this model it was really annoying to inject a Requester into the Coordinator so it could inject it into the View Model. And if we add just one more level to this chain, it becomes impractical.

2. Coordinators didn't get deallocated when theirs VC's were popped:
In this model, each Coordinator has a strong reference to the next one. So, when a ViewController is removed from the navigation stack, it's Coordinator is kept into memory although it's View Controller isn't there anymore.

3. Big and painful initializers:
Usually, we need some references in most of the Coordinators and View Models we have, such as a PersistencyStore, a NetworkRequester, Analytics properties and more. 
This kind of need makes us write really big initializers with five or more paramters. And it comes more dramtic when there is a long flux and the last screen of it needs a parameter that wasn't passed to it.

That's why I started to look around for solutions and I found this concept of Dependecy Injection, that together with the Factory pattern, promises to help me solving this problem.
`DependecyInjection` is a project that tries to put in practice those concepts, considering some of the existing common needs in mobile projects, I guess.
