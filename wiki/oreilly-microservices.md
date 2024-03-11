---
layout: post
title: "Building Microservices by Sam Newman - O'Reilly"
date: 2024-03-11
tags: programming, books, notes, web development, data engineering
description: "My notes -mostly interesting quotes and excerpts- on the book Building Microservices, 2nd Edition, by Sam Newman"
language: English
importance: 4
note_category: book-notes
---

## Chapter: 1. What Are Microservices?

> Arguably, with microservices we have made a decision to prioritize high cohesion of business functionality over high cohesion of technical functionality.

> Software as a Service (SaaS) applications are, in general, also a good fit for a microservice architecture. These products are typically expected to operate 24-7, which creates challenges when it comes to rolling out changes. The independent releasability of microservice architectures is a huge boon in this area.

> To ensure independent deployability, we need to make sure our microservices are loosely coupled: we must be able to change one service without having to change anything else. This means we need explicit, well-defined, and stable contracts between services. Some implementation choices make this difficult—the sharing of databases, for example, is especially problematic.

> With microservices, think of us opening up seams in our system that are addressable by outside parties. As circumstances change, we can build applications in different ways.

> So you can also see the focus on independent deployability as a forcing function—by focusing on this as an outcome, you’ll achieve a number of ancillary benefits.

> I’ve seen plenty of examples of SOA in which teams were striving to make the services smaller, but they still had everything coupled to a database and had to deploy everything together. Service oriented? Yes. But it’s not microservices.

> For many organizations, the modular monolith can be an excellent choice. If the module boundaries are well defined, it can allow for a high degree of parallel work, while avoiding the challenges of the more distributed microservice architecture by having a much simpler deployment topology.

> In my experience, probably the single biggest reason that organizations adopt microservices is to allow for more developers to work on the same system without getting in each other’s way. Get your architecture and organizational boundaries right, and you allow more people to work independently of each other, reducing delivery contention.

> with microservices, we can build systems that handle the total failure of some of the constituent services and degrade functionality accordingly.

> With a large, monolithic service, we need to scale everything together. Perhaps one small part of our overall system is constrained in performance, but if that behavior is locked up in a giant monolithic application, we need to handle scaling everything as a piece. With smaller services, we can scale just those services that need scaling

> at a bare minimum, I strongly advocate the implementation of a log aggregation system as a prerequisite for adopting a microservice architecture.

## Chapter: 2. How to Model Microservices

> The reality, as Parnas explored throughout much of his work, is that having modules doesn’t result in your actually achieving these outcomes. A lot depends on how the module boundaries are formed. From his own research, information hiding was a key technique to help get the most out of modular architectures

> The connections between modules are the assumptions which the modules make about each other.

> One of the most succinct definitions I’ve heard for describing cohesion is this: “the code that changes together, stays together.”

> I called this “onion architecture,” as it had lots of layers and made me cry when we had to cut through it.

> common coupling is sometimes OK, but often it’s not. Even when it’s benign, it means that we are limited in what changes can be made to the shared data, but it often speaks to a lack of cohesion in our code. It can also cause us problems in terms of operational contention. It’s for those reasons that we consider common coupling to be one of the least desirable forms of coupling—but it can get worse.

> An alternative approach I see in such cases is to implement the Order service as little more than a wrapper around database CRUD operations, where requests just map directly to database updates. This is akin to an object having private fields but public getters and setters—the behavior has leaked from the microservice to upstream consumers (reducing cohesion),

> When making changes in Order Processor, can I be sure that I am not changing the order data in such a way that it breaks Warehouse’s view of the world, or vice versa?

> as a result I tend to be relaxed about sharing static reference data in this way. Common coupling becomes more problematic, though, if the structure of the common data changes more frequently, or if multiple microservices are reading and writing to the same data.

> Content Coupling
Content coupling describes a situation in which an upstream service reaches into the internals of a downstream service and changes its internal state.

> “Pass-through coupling”9 describes a situation in which one microservice passes data to another microservice purely because the data is needed by some other microservice further downstream. In many ways it’s one of the most problematic forms of implementation coupling, as it implies not only that the caller knows not just that the microservice it is invoking calls yet another microservice, but also that it potentially needs to know how that one-step-removed microservice works.

> Domain coupling describes a situation in which one microservice needs to interact with another microservice, because the first microservice needs to make use of the functionality that the other microservice provides.

> The concept here of stability is important to us. For our microservice boundaries to deliver on the promise of independent deployability, allowing us to work on microservices in parallel and reduce the amount of coordination between teams working on these services, we need some degree of stability in the boundaries themselves. If the contract that a microservice exposes is constantly changing in a backward-incompatible fashion, then this will cause upstream consumers to constantly have to change too.

> A loosely coupled service knows as little as it needs to about the services with which it collaborates.

> In essence, microservices are just another form of modular decomposition, albeit one that has network-based interaction between the models and all the associated challenges that brings.

> information hiding, cohesion, and coupling

> We want our microservices to be able to be changed and deployed, and their functionality released to our users, in an independent fashion. The ability to change one microservice in isolation from another is vital.

### Common Coupling

> Common coupling occurs when two or more microservices make use of a common set of data. A simple and common example of this form of coupling would be multiple microservices making use of the same shared database, but it could also manifest itself in the use of shared memory or a shared filesystem.


> The main issue with common coupling is that changes to the structure of the data can impact multiple microservices at once.

## Chapter: 3. Splitting the Monolith

> The mapping from internal state to reporting database is the responsibility of the people who develop the microservice

> The reporting database allows us to hide internal state management, while still presenting the data in a database—something which can be very useful. For example, you might want to allow people to run off ad hoc defined SQL queries, run large-scale joins, or make use of existing toolchains that expect to have access to a SQL endpoint. The reporting database is a nice solution to this problem.

> With a reporting database, we instead create a dedicated database that is designed for external access, and we make it the responsibility of the microservice to push data from internal storage to the externally accessible reporting database

> Extracting the application code tends to be easier than extracting things from the database. If we found that it was impossible to extract the application code cleanly, we could abort any further work, avoiding the need to detangle the database. If, however, the application code is cleanly extracted but extracting the data proves to be impossible, we could be in trouble—thus it’s essential that even if you decide to extract the application code before the data, you need to have looked at the associated data storage and have some idea as to whether extraction is viable and how you will go about it.

> far too many organizations look only at the benefits of decomposing the backend functionality, which often results in an overly siloed approach to any architectural restructuring. Sometimes the biggest benefits can come from decomposition of the UI, so ignore this at your peril.

> Once you have a firm grasp on why you think microservices are a good idea, you can use this understanding to help prioritize which microservices to create first. Want to scale the application? Functionality that currently constrains the system’s ability to handle load is going to be high on the list. Want to improve time to market? Look at the system’s volatility to identify those pieces of functionality that change most frequently

> If you want a “clean” architecture, by all means laminate a printout of an idealized version of the system architecture you might have had, if only you had perfect foresight and limitless funds.

> The beauty of this pattern is that it can often be done without making any changes to the underlying monolithic application. The monolith is unaware that it has even been “wrapped” with a newer system.

## Chapter: 4. Microservice Communication Styles

> With request-response, a microservice sends a request to a downstream service asking it to do something and expects to receive a response with the result of the request. This interaction can be undertaken via a synchronous blocking call, or it could be implemented in an asynchronous nonblocking fashion.

> Information hiding is still an important concept in event-driven collaboration—the more data we put into an event, the more assumptions external parties will have about the event. My general rule is that I am OK putting information into an event if I’d be happy sharing the same data over a request-response API.

> the default maximum size for a message in Kafka is 1 MB, and the latest release of RabbitMQ has a theoretical upper limit of 512 MB for a single message (down from the previous limit of 2 GB!), even though one could expect there to be some interesting performance issues with large messages like this. But even the 1 MB afforded to us as the maximum size of a message on Kafka gives us a lot of scope to send quite a bit of data. Ultimately, if you’re venturing into a space in which you are starting to worry about the size of your events, then I’d recommend a hybrid approach in which some information is in the event but other (larger) data can be looked up if required.

> if you’re using this pattern for very large volumes of data, it’s less likely that low latency is high on your list of requirements. If you are interested in sending larger volumes of data and having them processed more in “real time,” then using some sort of streaming technology like Kafka would be a better fit.

> The alternative, which I prefer, is to put everything into an event that you would be happy otherwise sharing via an API. If you’d let the Notifications microservice ask for the email address and name of a given customer, why not just put that information in the event in the first place?

> The intent behind an event could be considered the opposite of a request. The event emitter is leaving it up to the recipients to decide what to do. With request-response, the microservice sending the request knows what should be done and is telling the other microservice what it thinks needs to happen next. This of course means that in request-response, the requester has to have knowledge of what the downstream recipient can do, implying a greater degree of domain coupling. With event-driven collaboration, the event emitter doesn’t need to know what any downstream microservices are able to do, and in fact may not even know they exist—as a result, coupling is greatly reduced.

> An event is a statement about something that has occurred, nearly always something that has happened inside the world of the microservice that is emitting the event. The microservice emitting the event has no knowledge of the intent of other microservices to use the event, and indeed it may not even be aware that other microservices exist.

> When a microservice receives a response in this way, it might need to relate the response to the original request. This can be challenging, as a lot of time may have passed, and depending on the nature of the protocol being used, the response may not come back to the same instance of the microservice that sent the request. In our example of reserving stock as part of placing an order, we’d need to know how to associate the “stock reserved” response with a given order so we can carry on processing that particular order. An easy way to handle this would be to store any state associated with the original request into a database, such that when the response comes in, the receiving instance can reload any associated state and act accordingly.

> With an asynchronous request-response, things are less straightforward. Let’s revisit the process associated with reserving stock. In Figure 4-10, the request to reserve stock is sent as a message over some sort of message broker (we’ll explore message brokers later in this chapter). Rather than the message going directly to the Inventory microservice from Order Processor, it instead sits in a queue. The Inventory consumes messages from this queue when it is able. It reads the request, carries out the associated work of reserving the stock, and then needs to send the response back to a queue that Order Processor is reading from. The Inventory microservice needs to know where to route the response. In our example, it sends this response back over another queue that is in turn consumed by Order Processor.

> Downstream consuming microservices will typically be aware that there is new data to process via some sort of polling mechanism, or else perhaps through a periodically triggered timed job. That means that this mechanism is unlikely to be useful in low-latency situations.

> The main challenge with synchronous calls is the inherent temporal coupling that occurs

> With a data lake, sources upload raw data in whatever format they see fit, and downstream consumers of this raw data are expected to know how to process the information. With a data warehouse, the warehouse itself is a structured data store. Microservices pushing data to the data warehouse need to know the structure of the data warehouse—if the structure changes in a backward-incompatible way, then these producers will need to be updated.

> An API that makes sense in-process may not make sense in inter-process situations.

> With both the data warehouse and the data lake, the assumption is that the flow of information is in a single direction.

> This might lead you to reduce the amount of data being sent or received (perhaps not a bad thing if we think about information hiding), pick more efficient serialization mechanisms, or even offload data to a filesystem and pass around a reference to that file location instead.

> in general, I tend to start with deciding whether a request-response or an event-driven style of collaboration is more appropriate for the given situation. If I’m looking at request-response, then both synchronous and asynchronous implementations are still available to me, so I have a second choice to make. If picking an event-driven collaboration style, however, my implementation choices will be limited to nonblocking asynchronous choices.

> When the Order Processor makes a call to Loyalty in the preceding example, the Loyalty microservice needs to be reachable for the call to work.

> When making calls between microservices over a network, on the other hand, the data actually has to be serialized into some form

> we look at three of the most common forms of asynchronous communication—request-response calls, event-driven communication, and communication through common data.

> A style of communication that spans a multitude of implementations is communication through common data. This pattern is used when one microservice puts data into a defined location, and another microservice (or potentially multiple microservices) then makes use of the data. It can be as simple as one microservice dropping a file in a location, and at some point later on another microservice picks up that file and does something with it. This integration style is fundamentally asynchronous in nature.

> I’ve built many systems that just periodically scan a filesystem, note the presence of a new file, and react on it accordingly.

> It’s worth noting that any downstream microservice that is going to act on this data will need its own mechanism to identify that new data is available—polling is a frequent solution to this problem.

> the use of synchronous calls can make a system vulnerable to cascading issues caused by downstream outages more readily than can the use of asynchronous calls.

## Chapter: 5. Implementing Microservice Communication

> Topics are a good fit for event-based collaboration, whereas queues would be more appropriate for request/response communication.

> This pattern—of implementing a reader able to ignore changes we don’t care about—is what Martin Fowler calls a tolerant reader.

Expansion changes
Add new things to a microservice interface; don’t remove old things.

Tolerant reader
When consuming a microservice interface, be flexible in what you expect.

Right technology
Pick technology that makes it easier to make backward-compatible changes to the interface.

Explicit interface
Be explicit about what a microservice exposes. This makes things easier for the client and easier for the maintainers of the microservice to understand what can be changed freely.

> A structural breakage is a situation in which the structure of the endpoint changes in such a way that a consumer is now incompatible—this could represent fields or methods being removed, or new required fields being added. A semantic breakage refers to a situation in which the structure of the microservices endpoint remains the same but the behavior changes in such a way as to break consumers’ expectations.

> So why use a broker? Fundamentally, they provide some capabilities that can be very useful for asynchronous communication. The properties they provide vary, but the most interesting feature is that of guaranteed delivery, something that all widely used brokers support in some way. Guaranteed delivery describes a commitment by the broker to ensure that the message is delivered.

> At first glance, a queue just looks like a topic with a single consumer group. A large part of the distinction between the two is that when a message is sent over a queue, there is knowledge of what the message is being sent to. With a topic, this information is hidden from the sender of the message—the sender is unaware of who (if anyone) will end up receiving the message.

> With hypermedia controls, we are trying to achieve the same level of “smarts” for our electronic consumers.

> Fundamentally, GraphQL is a call aggregation and filtering mechanism, so in the context of a microservice architecture it would be used to aggregate calls over multiple downstream microservices. As such, it’s not something that would replace general microservice-to-microservice communication.

> Just because you are using GraphQL, don’t slip into thinking of your microservices as little more than an API on a database—it’s essential that your GraphQL API isn’t coupled to the underlying datastores of your microservices.

> Namely, it makes it possible for a client-side device to define queries that can avoid the need to make multiple requests to retrieve the same information. This can offer significant improvements in terms of the performance of constrained client-side devices and can also avoid the need to implement bespoke server-side aggregation.

> The limitations placed on HTTP due to the requirement to use TCP are being addressed. HTTP/3, which is currently in the process of being finalized, is looking to shift over to using the newer QUIC protocol. QUIC provides the same sorts of capabilities as TCP (such as improved guarantees over UDP) but with some significant enhancements that have been shown to deliver improvements in latency and reductions in bandwidth. It’s likely to be several years before HTTP/3 has a widespread impact on the public internet, but it seems reasonable to assume that organizations can benefit earlier than this within their own networks.

> HTTP itself defines some useful capabilities that play very well with the REST style. For instance, the HTTP verbs (e.g., GET, POST, and PUT) already have well-understood meanings in the HTTP specification as to how they should work with resources. The REST architectural style actually tells us that these verbs should behave the same way on all resources, and the HTTP specification happens to define a bunch of verbs we can use. GET retrieves a resource in an idempotent way, for example, and POST creates a new resource.

> Another principle introduced in REST that can help us avoid the coupling between client and server is the concept of hypermedia as the engine of application state

> gRPC fits a synchronous request-response model well but can also work in conjunction with reactive extensions. It’s high on my list whenever I’m in situations where I have a good deal of control over both the client and server ends of the spectrum. If you’re having to support a wide variety of other applications that might need to talk to your microservices, the need to compile client-side code against a server-side schema can be problematic. In that case, some form of REST over HTTP API would likely be a better fit.

> When a message is put into the queue, only one member of the consumer group will receive that message; this means the queue works as a load distribution mechanism. This is an example of the competing consumers pattern

> Semantic versioning is a specification that allows just that. With semantic versioning, each version number is in the form MAJOR.MINOR.PATCH. When the MAJOR number increments, it means that backward-incompatible changes have been made. When MINOR increments, new functionality has been added that should be backward compatible. Finally, a change to PATCH states that bug fixes have been made to existing functionality.

> Postel’s law (otherwise known as the robustness principle), which states: “Be conservative in what you do, be liberal in what you accept from others.”

> This is in effect an example of the expand and contract pattern, which allows us to phase in breaking changes. We expand the capabilities we offer, supporting both old and new ways of doing something. Once the old consumers do things in the new way, we contract our API, removing the old functionality.

> The longer it takes for you to get consumers upgraded to the newer version and released, the more you should look to coexist different endpoints in the same microservice rather than coexist entirely different versions.

> Service meshes come in different shapes and sizes, but what unites them is that their architecture is based on trying to limit the impact caused by calls to and from the proxy. This is achieved primarily by distributing the proxy processes to run on the same physical machines as the microservice instances, to ensure that the number of remote network calls is limited.

> For a situation in which you have only single nodes, having DNS refer directly to hosts is probably fine. But for those situations in which you need more than one instance of a host, have DNS entries resolve to load balancers that can handle putting individual hosts into and out of service as appropriate.

> So if you are using libraries for code reuse across microservice boundaries, you have to accept that multiple different versions of the same library might be out there at the same time. You can of course look to update all of these to the last version over time, but as long as you are OK with this fact, then by all means reuse code via libraries. If you really do need to update that code for all users at exactly the same time, then you’ll actually want to look at reusing code via a dedicated microservice instead.

> Another extreme measure I saw was actually in the context of deprecating libraries, but it could also theoretically be used for microservice endpoints. The example given was of an old library that people were trying to retire from use inside the organization in favor of a newer, better one. Despite lots of work to move code over to use the new library, some teams were still dragging their heels. The solution was to insert a sleep in the old library so that it responded more slowly to calls (with logging to show what was happening). Over time, the team driving the deprecation just kept increasing the duration of the sleep, until eventually the other teams got the message. You obviously have to be extremely sure that you’ve exhausted other reasonable efforts to get consumers to upgrade before considering something like this!

> Remember, one of the secrets to an effective microservice architecture is to embrace a consumer-first approach. Your microservices exist to be called by other consumers. The consumers’ needs are paramount, and if you are making changes to a microservice that are going to cause upstream consumers problems, this needs to be taken into account.

> My general preference is to use emulation of old endpoints wherever possible. The challenges of implementing emulation are in my opinion much easier to deal with than those of coexisting microservice versions.

> DNS lets us associate a name with the IP address of one or more machines. We could decide, for example, that our Accounts microservice is always found at accounts.musiccorp.net. We would then have that entry point to the IP address of the host running that microservice, or perhaps we’d have it resolve to a load balancer that is distributing load across a number of instances. This means we’d have to handle updating these entries as part of deploying our service.

## Chapter: 6. Workflow

> One of the easiest ways of doing this is to project a view regarding the state of a saga by consuming the events being emitted. If we generate a unique ID for the saga, what is known as a correlation ID, we can put it into all of the events that are emitted as part of this saga. When one of our services reacts to an event, the correlation ID is extracted and used for any local logging processes, and it’s also passed downstream with any further calls or events that are fired.

> we also avoid the concerns about centralization of logic (if you don’t have a place where logic can be centralized, then it won’t be centralized!).

> In the preceding architecture, no one service knows about any other microservice. They need to know only what to do when a certain event is received—we’ve drastically reduced the amount of domain coupling.

> The other issue, which is more subtle, is that logic that should otherwise be pushed into the services can start to become absorbed in the orchestrator instead. If this begins to happen, you may find that your services become anemic, with little behavior of their own, just taking orders from orchestrators

> you don’t send events to a microservice; you just fire them out, and the microservices that are interested in these events are able to receive them and act accordingly.

> A compensating transaction is an operation that undoes a previously committed transaction

> It’s really important to note that a saga allows us to recover from business failures, not technical failures. For example, if we try and take payment from the customer but the customer has insufficient funds, then this is a business failure that the saga should be expected to handle. On the other hand, if the Payment Gateway times out or throws a 500 Internal Service Error, then this is a technical failure that we need to handle separately. The saga assumes the underlying components are working properly—that the underlying system is reliable, and that we are then coordinating the work of reliable components

> With a saga being broken into individual transactions, we need to consider how to handle failure—or, more specifically, how to recover when a failure happens. The original saga paper describes two types of recovery: backward recovery and forward recovery.<br>Backward recovery involves reverting the failure and cleaning up afterwards—a rollback. For this to work, we need to define compensating actions that allow us to undo previously committed transactions. Forward recovery allows us to pick up from the point where the failure occurred and keep processing. For that to work, we need to be able to retry transactions, which in turn implies that our system is persisting enough information to allow this retry to take place.<br>Depending on the nature of the business process being modeled, you may expect that any failure mode triggers a backward recovery, a forward recovery, or perhaps a mix of the two.

> If you have pieces of state that you want to manage in a truly atomic and consistent way, and you cannot work out how to sensibly get these characteristics without an ACID-style transaction, then leave that state in a single database, and leave the functionality that manages that state in a single service (or in your monolith). If you’re in the process of working out where to split your monolith and what decompositions might be easy (or hard), then you could well decide that splitting apart data that is currently managed in a transaction is just too difficult to handle right now. Work on some other area of the system, and come back to this later.

> 2PC can be a quick way to inject huge amounts of latency into your system, especially if the scope of locking is large, or if the duration of the transaction is large. It’s for this reason two-phase commits are typically used only for very short-lived operations. The longer the operation takes, the longer you’ve got resources locked!

> When a two-phase commit works, at its heart it is very often just coordinating distributed locks. The workers need to lock local resources to ensure that the commit can take place during the second phase. Managing locks and avoiding deadlocks in a single-process system isn’t fun. Now imagine the challenges of coordinating locks among multiple participants. It’s not pretty.

> Sometimes you can simplify your rollback operations just by tweaking how your workflow is carried out. By pulling forward those steps that are most likely to fail and failing the process earlier, you avoid having to trigger later compensating transactions, as those steps weren’t even triggered in the first place.

## Chapter: 7. Build

> the artifact you verify should be the artifact you deploy! If you build a microservice, test it, say “yes, it’s working,” and then build it again for deployment into production, how do you know that the software you validated is the same software you deployed?

> In my experience, the main advantages of a monorepo approach—finer-grained reuse and atomic commits—don’t seem to outweigh the challenges that emerge at scale. For smaller teams, either approach is fine, but as you scale, I feel that the one repository per microservice (multirepos) approach is more straightforward.

> Pattern: One Repository per Microservice (aka Multirepo)

> we should build an artifact once and once only. Building the same thing over and over again is a waste of time and bad for the planet

> continuous delivery is the concept whereby each check-in is treated as a release candidate, and whereby we can assess the quality of each release candidate to decide if it’s ready to be deployed. With continuous deployment on the other hand, all check-ins have to be validated using automated mechanisms (tests for example), and any software that passes these verification checks is deployed automatically, without human intervention. Continuous deployment can therefore be considered an extention of continuous delivery.

> One Giant Repo, One Giant Build

> A solution to this problem is to have different stages in our build, creating what is known as a build pipeline. So we can have a dedicated stage for all the fast tests, which we run first, and if they all pass, we then run a separate stage for the slower tests.<br><br>This build pipeline concept gives us a nice way of tracking the progress of our software as it clears each stage, helping give us insight into the quality of our software. We create a deployable artifact, the thing that will ultimately be deployed into production, and use this artifact throughout the pipeline.

> When the build is broken, is it the #1 priority of the team to fix it?

> Do you have a suite of tests to validate your changes?

> Do you check in to mainline once per day?

> So how do you know if you’re actually practicing CI? I really like Jez Humble’s three questions he asks people to test if they really understand what CI is about

> To do this, a CI server detects that the code has been committed, checks it out, and carries out some verification such as making sure that the code compiles and that tests pass.

> Continuous delivery (CD) builds on this concept, and then some. As outlined in Jez Humble and Dave Farley’s book of the same name,3 CD is the approach whereby we get constant feedback on the production readiness of each and every check-in, and furthermore treat each and every check-in as a release candidate.

## Chapter: 8. Deployment

> So, to deploy your microservice, you define a pod, which will contain your microservice instance inside it; you define a service, which will let Kubernetes know how your microservice will be accessed; and you apply changes to the running pods using a deployment.

> So you can see Kubernetes as a generous contribution from Google to the wider IT industry, or as an attempt by Google to remain relevant in the fast-moving public cloud space. I have no problem seeing both things as equally true.

> I’ve spoken to many organizations that have adopted Kubernetes primarily because they’re worried about being locked in to a single vendor, but these organizations haven’t understood this nuance—applications built on Kubernetes are portable across Kubernetes clusters in theory, but not always in practice.

> In their book Accelerate,6 Nicole Forsgren, Jez Humble, and Gene Kim show clear evidence drawn from extensive research that high-performing companies deploy more frequently than their low-performing counterparts and at the same time have much lower change failure rates.<br>The idea that you “go fast and break stuff” doesn’t really seem to apply when it comes to shipping software—shipping frequently and having lower failure rates goes hand in hand, and organizations that have realized this have changed how they think about releasing software.

> Deployment is what happens when you install some version of your software into a particular environment (the production environment is often implied). Release is when you make a system or some part of it (for example, a feature) available to users.

> we can separate the concept of deployment from that of release.

> In the context of Kubernetes, you can think of a service as a stable routing endpoint—basically, a way to map from the pods you have running to a stable network interface that is available within the cluster.

> Blue-green deployment is one of the simplest examples of this concept in action—you have one version of your software live (blue), and then you deploy a new version alongside the old version in production (green). You check to make sure that the new version is working as expected, and if it is, you redirect customers to see the new version of your software. If you find a problem before the switchover, no customer is impacted.

> He has gone on to describe progressive delivery as “continuous delivery with fine-grained control over the blast radius”—so it’s an extension of continuous delivery but also a technique that gives us the ability to control the potential impact of our newly released software.

> With a canary release, a request to a piece of functionality will be served by either the old or the new version. This means we can’t compare how the two versions of functionality would handle the same request, something that can be important if you want to make sure that the new functionality works in exactly the same way as the old version of functionality.<br>With a parallel run you do exactly that—you run two different implementations of the same functionality side by side, and send a request to the functionality to both implementations.

> These organizations make use of techniques like feature toggles, canary releases, parallel runs, and more, which we’ll detail in this section. This shift in how we think about releasing functionality falls under the banner of what is called progressive delivery. Functionality is released to users in a controlled manner; instead of a big-bang deployment, we can be smart about who sees what functionality—for example, by rolling out a new version of our software to a subset of our users.

> Commonly, you’ll have only one container in a pod—for example, an instance of your microservice. There are some occasions (rare, in my experience) where having multiple containers deployed together can make sense

> Tools like Docker allow us to define what a container should look like and create an instance of that container on a machine. But most solutions require that our software be defined on multiple machines, perhaps to handle sufficient load, or to ensure that the system has redundancy in place to tolerate the failure of a single node.

> Container orchestration platforms handle how and where container workloads are run. The term “scheduling” starts to make more sense in this context. The operator says, “I want this thing to run,” and the orchestrator works out how to schedule that job—finding available resources, reallocating them if necessary, and handling the details for the operator.

> Kubernetes can variously be described as a container orchestration platform or, to use a term that has fallen out of favor, a container scheduler.

> If you’re on the public cloud, and your problem fits FaaS as a deployment model, do that instead and skip Kubernetes. Your developers will likely end up being much more productive.

> Found an awesome PaaS like Heroku or Zeit, and have an application that fits the constraints of the platform? Push all the work to the platform and spend more time working on your product. Both Heroku and Zeit are pretty fantastic platforms with awesome usability from a developer point of view.

> Trade-offs abound here. Balancing cost against ease of use, isolation, familiarity…it can become overwhelming. So let’s review a set of rules I like to call Sam’s Really Basic Rules of Thumb for Working Out Where to Deploy Stuff:<br><br>If it ain’t broke, don’t fix it.<br>Give up as much control as you feel happy with, and then give away just a little bit more. If you can offload all your work to a good PaaS like Heroku (or a FaaS platform), then do it and be happy. Do you really need to tinker with every last setting?<br>Containerizing your microservices it is not pain-free, but is a really good compromise around cost of isolation and has some fantastic benefits for local development, while still giving you a degree of control over what happens. Expect Kubernetes in your future.

> Well, before I go any further, I really hope that it goes without saying that if what you are currently doing works for you, then keep doing it! Don’t let fashion dictate your technical decisions.

> Type 2 virtualization is the sort implemented by AWS, VMware, vSphere, Xen, and KVM. (Type 1 virtualization refers to technology in which the VMs run directly on hardware, not on top of another operating system.) On our physical infrastructure we have a host operating system. On this OS we run something called a hypervisor, which has two key jobs. First, it maps resources like CPU and memory from the virtual host to the physical host. Second, it acts as a control layer, allowing us to manipulate the virtual machines themselves.

> Concepts like rolling upgrades can be handy here, and this is one area where the use of a platform like Kubernetes makes your life much easier. With a rolling upgrade, your microservice isn’t totally shut down before the new version is deployed, instead instances of your microservice are slowly ramped down as new instances running new versions of your software are ramped up. It’s worth noting, though, that if the only thing you are looking for is something to help with zero-downtime deployments, then implementing Kubernetes is likely huge overkill. Something simple like a blue-green deployment mechanism (which we’ll explore more in “Separating Deployment from Release”) can work just as effectively.

> Sarah Wells at the Financial Times cites the ability to implement zero-downtime deployment as being the single biggest benefit in terms of improving the speed of delivery. With the confidence that releases wouldn’t interrupt its users, the Financial Times was able to drastically increase the frequency of releases. In addition, a zero-downtime release can be much more easily done during working hours. Quite aside from the fact that doing so improves the quality of life of the people involved with the release (compared to working evenings and weekends), a well-rested team working during the day is less likely to make mistakes and will have support from many of their colleagues when they need to fix issues.

> Zero-Downtime Deployment

> your system can be brought into a known state through the use of source code.

> Fundamentally, a Kubernetes cluster consists of two things. First, there’s a set of machines that the workloads will run on called the nodes. Secondly, there’s a set of controlling software that manages these nodes and is referred to as the control plane. These nodes could be running physical machines or virtual machines under the hood. Rather than scheduling a container, Kubernetes instead schedules something it calls a pod. A pod consists of one or more containers that will be deployed together.

> Infrastructure as Code (IAC)

## Chapter: 9. Testing

> Nonfunctional requirements is an umbrella term used to describe those characteristics your system exhibits that cannot simply be implemented like a normal feature. They include aspects like the acceptable latency of a web page, the number of users a system should support, how accessible your user interface should be to people with disabilities, or how secure your customer data should be.

Optimize for fast feedback, and separate types of tests accordingly.

Avoid the need for end-to-end tests that span more than one team—consider using consumer-driven contracts instead.

Use consumer-driven contracts to provide focus points for conversations between teams.

Try to understand the trade-off between putting more effort into testing and detecting issues faster in production (optimizing for MTBF versus optimizing for MTTR).

Give testing in production a try!

> Unit tests are small in scope, so when they fail we can find the problem quickly. They are also quick to write and really quick to run. As our tests get larger in scope, we get more confidence in our system, but our feedback starts to suffer as the tests take longer to run. They are also more costly to write and maintain,

> The more moving parts there are, the more brittle our tests may be and the less deterministic they are. If you have tests that sometimes fail, but everyone just reruns them because they may pass again later, then you have flaky tests. And tests covering lots of different processes are not the only culprit. Tests that cover functionality being exercised on multiple threads (and across multiple processes) are also often problematic; a failure could mean a race condition or a time-out, or that the functionality is actually broken. Flaky tests are the enemy. When they fail, they don’t tell us much. We rerun our CI builds in the hope that they will pass again later, only to see check-ins pile up, and suddenly we find ourselves with a load of broken functionality.

> We don’t want to duplicate effort, nor do we want to completely centralize this to the extent that the teams building services are too far removed from things. If you can find a clean way to assign end-to-end tests to a specific team, then do it. If not, and if you can’t find a way to remove end-to-end tests and replace them with something else, then you’ll likely need to treat the end-to-end test suite as a shared codebase, but with joint ownership. Teams are free to check in to this suite, but ownership of the health of the suite has to be shared between the teams developing the services themselves. If you want to make extensive use of end-to-end tests with multiple teams, I think this approach is essential, and yet I have seen it done only rarely, and never without issues. Ultimately, I am convinced that at a certain level of organizational scale, you need to move away from cross-team end-to-end tests for this reason.

> With contract tests, a team whose microservice consumes an external service writes tests that describe how it expects an external service will behave. This is less about testing your own microservice and more about specifying how you expect an external service to behave.

> Typically, this is done by having the downstream producer team run the consumer contracts for each consuming microservice as part of its test suite that would be run on every build. Very importantly from a test feedback point of view, these tests need to be run only against a single producer in isolation, so they can be faster and more reliable than the end-to-end tests they might replace.

> Arguably, consumer-driven contracts are as much about fostering clear lines of communication and collaboration, where needed, between microservices and the teams that consume them. It could be argued, in fact, that implementing CDCs is just making more explicit the communication between the teams that must already exist.

> If one of these CDCs breaks during a build of the Customer service, it becomes obvious which consumer would be impacted.

> Alternatively, if you are creating an API for thousands of potential consumers, such as with a publicly available web service API, you may have to play the role of the consumer yourself (or perhaps work with a subset of your consumers) in defining these tests. Breaking huge numbers of external consumers is a pretty bad idea, so if anything the importance of CDCs is increased!

> As outlined in detail earlier in the chapter, end-to-end tests have a large number of disadvantages that grow significantly as you add more moving parts under test. From speaking to people who have been implementing microservices at scale for a while now, I have learned that most of them over time remove the need entirely for end-to-end tests in favor of other mechanisms to validate the quality of their software—for example, the use of explicit schemas and CDCs, in-production testing, or perhaps some of the progressive delivery techniques we’ve discussed, such as canary releases.

> The complexity of a distributed system is such that it can be infeasible to catch all potential problems that might occur before we hit production itself.

> A microservice architecture is often only as reliable as its weakest link, and as a result it’s common for our microservices to build in mechanisms to allow them to improve their robustness in order to improve system reliability. We’ll explore this topic more in “Stability Patterns”, but examples include running multiple instances of a microservice behind a load balancer to tolerate the failure of an instance, or using circuit breakers to programmatically handle situations in which downstream microservices cannot be contacted.

> The key thing to take away when reading the pyramid is that as we go up the pyramid, the test scope increases, as does our confidence that the functionality being tested works. On the other hand, the feedback cycle time increases as the tests take longer to run, and when a test fails, it can be harder to determine which functionality has broken. As we go down the pyramid, in general the tests become much faster, so we get much faster feedback cycles. We find broken functionality faster, our continuous integration builds are faster, and we are less likely to move on to a new task before finding out we have broken something. When those smaller-scoped tests fail, we also tend to know what broke, often down to the exact line of code—each test is better isolated, making it easier for us to understand and fix breakages. On the flip side, we don’t get a lot of confidence that our system as a whole works if we’ve tested only one line of code!

## Chapter: 10. From Monitoring to Observability

> As is often the case, the concept of observability has been around for decades but has only recently come to software development. The observability of a system is the extent to which you can understand the internal state of the system from external outputs. It typically requires a more holistic understanding of your software—seeing it more as a system rather as than a set of disparate entities.

> The problem of clock skew causes all sorts of issues in distributed systems. Protocols do exist to try and reduce clock skew in systems—the Network Time Protocol (NTP) being the most widely used example. NTP, however, isn’t guaranteed to work, and even when it does work, all it can do is reduce skew, not eliminate it.

> Above all, this is about accepting that not all things are knowable before you hit production. Get good at handling the unknown.

> Google’s microservices generate about 5 billion RPCs per second; building observability tools that scale to 5B RPCs/sec therefore boils down to building observability tools that are profoundly feature poor. If your organization is doing more like 5 million RPCs/sec, that’s still quite impressive, but you should almost certainly not use what Google uses: at 1/1000th the scale, you can afford much more powerful features.

> You should try to write your logs out in a standard format. You definitely want to have all your metrics in one place, and you may want to have a list of standard names for your metrics too; it would be very annoying for one service to have a metric called ResponseTime, and another to have one called RspTimeSecs, when they mean the same thing.

> All forms of testing in production are arguably a form of “monitoring” activity. We are carrying out these forms of testing in production to ensure that our production system is running as we expect, and many forms of testing in production can be incredibly effective in picking up problems before our users even notice.

> If you are looking for systems that are able to store and manage high cardinality data, allowing for much more sophisticated observation (and questioning) of your system’s behavior, I’d strongly suggest looking at either Honeycomb or Lightstep. Although these tools are often seen as solutions to distributed tracing (which we’ll explore more later), they are highly capable at storing, filtering, and querying high-cardinality data.

> A popular open source toolchain for log aggregation has been to make use of a log forwarding agent like Fluentd to send logs to Elasticsearch, using Kibana as a way to slice and dice the resulting stream of logs. The biggest challenge with this stack tends to be the overhead of managing Elasticsearch itself, but this may be less of an issue if you need to run Elasticsearch for other purposes, or if you make use of a managed provider.

> Correlation IDs in logs are the sorts of things that don’t seem that useful initially, but trust me—over time, they can be incredibly useful. Unfortunately, they can be a pain to retrofit into a system. It’s for this reason I strongly suggest that you implement correlation IDs in logging as early as possible.

> Since the first edition of this book, Prometheus has become a popular open source tool for the use of gathering and aggregating metrics

> Some log forwarding agents give you the ability to reformat logs prior to forwarding them to your central log store. Personally, I’d avoid this wherever possible. The issue is that reformatting logs can be computationally intensive, to the point where I’ve seen real production issues caused by CPU being tied up carrying out this task. It’s much better to change the logs as they are written by your microservice itself.

> it’s important that you pick a sensible standard log format—otherwise your queries will end up being difficult or perhaps impossible to write. You want the date, time, microservice name, log level, and so on in consistent places in each log.

> Before you do anything else to build out your microservice architecture, get a log aggregation tool up and running. Consider it a prerequisite for building a microservice architecture. You’ll thank me later.

> on the subject of log aggregation, I’ll come as close I get to giving one-size-fits-all advice: you should view implementing a log aggregation tool as a prerequisite for implementing a microservice architecture.

> We can project from this event stream a trace (assuming we can correlate these events), a searchable index, or an aggregation of numbers.

> Fundamentally, we can see any piece of information we can get from our system—any of these external outputs—generically as an event.

> More traditional approaches to monitoring would have you think in advance about what could go wrong and define alerting mechanisms to tell you when these things happened. But as the system becomes increasingly distributed, you’ll encounter issues that would never have occurred to you.

> With a highly observable system, you’ll have a collection of external outputs that you can interrogate in different ways—the concrete outcome of having an observable system is that you can ask questions of your production system that you never would have thought to ask before.

> we might start thinking about writing out more structured log lines, perhaps using a JSON format, so we can find information like a customer or order ID in a consistent location. Again, the log aggregation tool will need to be configured to parse and extract the required information from the log. The other thing to note is that if you log JSON, that might make it more difficult to be directly read by a human without additional tooling to parse out the required values—simply reading the log in a plain text viewer may not be terribly useful.

> We monitor the system. We look at it. Things will start to go wrong if you focus on just the monitoring—the activity—without thinking about what you expect that activity to achieve.

## Chapter: 12. Resiliency

> Circuit breakers help our application fail fast—and failing fast is always better than failing slow. The circuit breakers allow us to fail before wasting valuable time (and resources) waiting for an unhealthy downstream microservice to respond.

> Isolation, like so many of the other techniques we have looked at, can help improve the robustness of our applications, but it’s rare that it does so for free. Deciding on the acceptable trade-offs around isolation versus cost and increased complexity, like so many other things, can be vital.

> In idempotent operations, the outcome doesn’t change after the first application, even if the operation is subsequently applied multiple times. If operations are idempotent, we can repeat the call multiple times without adverse impact.

> Some people get quite caught up with this concept and assume it means that subsequent calls with the same parameters can’t have any impact, which then leaves us in an interesting position. We really would still like to record the fact that a call was received in our logs, for example. We want to record the response time of the call and collect this data for monitoring. The key point here is that it is the underlying business operation that we are considering idempotent, not the entire state of the system.

> Along with “Friends don’t let friends write their own crypto” should go “Friends don’t let friends write their own distributed consistent data store.” If you think you need to write your own CP data store, read all the papers on the subject first, then get a PhD, and then look forward to spending a few years getting it wrong. Meanwhile, I’ll be using something off the shelf that does it for me, or more likely trying really hard to build eventually consistent AP systems instead.

> Remember, robustness in the context of resilience engineering means the extent to which our system can handle expected problems.

> When looking more broadly at the concept of resiliency, though, we realize that antifragility is just a subset of the concept of resiliency. When we consider the concepts of graceful extensibility and sustained adaptability, which we introduced earlier, this becomes clear.

> Russ Miles shares the example of a Game Day exercise he facilitated that had been designed to examine, in part, the overreliance on a single staff member named Bob. For the Game Day, Bob was sequestered in a room and unable to help the team during the simulated outage. Bob was observing, though, and ended up having to step in when the team, in its attempt to fix issues with the “fake” system, ended up logging into production by mistake and was in the process of destroying production data. One can only assume that lots of lessons were learned in the aftermath of that exercise.

Robustness
The ability to absorb expected perturbation

Rebound
The ability to recover after a traumatic event

Graceful extensibility
How well we deal with a situation that is unexpected

Sustained adaptability
The ability to continually adapt to changing environments, stakeholders, and demands


> Key stability patterns like circuit breakers, time-outs, redundancy, isolation, idempotency, and the like are all tools at your disposal, but you have to decide when and where to use them.

> While the circuit breaker is blown, you have some options. One is to queue up the requests and retry them later on. For some use cases, this might be appropriate, especially if you’re carrying out some work as part of an asynchronous job. If this call is being made as part of a synchronous call chain, however, it is probably better to fail fast.

> We have to recognize that no matter how consistent our systems might be in and of themselves, they cannot know everything that happens, especially when we’re keeping records of the real world. This is one of the main reasons that AP systems end up being the right call in many situations. Aside from the complexity of building CP systems, they can’t fix all our problems anyway.

> With a circuit breaker, after a certain number of requests to the downstream resource have failed (due either to error or to a time-out), the circuit breaker is blown. All further requests that go through that circuit breaker fail fast while the breaker is in its blown (open) state

> If we aren’t prepared for surprise—for the fact that our expected view of the world might be wrong—we end up with a brittle system. As we approach the limits of what we expect our system to be able to handle, things fall apart—we are unable to perform adequately.

> implement a bulkhead with regard to the downstream calls. We should have used different connection pools for each downstream connection. That way, if one connection pool got exhausted, the other connections wouldn’t be impacted

> Robustness by definition requires prior knowledge—we are putting measures into place to deal with known perturbations.

> One of the challenges around improving the robustness of our system is that as we increase the robustness of our application, we introduce more complexity to our system, which can be the source of new issues.

> By all means, do your best to protect against the bad things that you think might happen—improving your system’s robustness—but also understand that as your system grows in scale and complexity, eliminating any potential problem becomes unsustainable.

> Automation can’t handle surprise

> this chapter will focus primarily on what a microservice architecture can help deliver in terms of resiliency—which is almost entirely limited to improving the robustness of applications.

> In many ways, bulkheads are the most important of the patterns we’ve looked at so far. Time-outs and circuit breakers help you free up resources when they are becoming constrained, but bulkheads can ensure they don’t become constrained in the first place. They can also give you the ability to reject requests in certain conditions to ensure that resources don’t become even more saturated; this is known as load shedding.

> I’m amazed at how many organizations put processes and controls in place to try to stop failure from occurring but put little to no thought into actually making it easier to recover from failure in the first place.

> If one of those services goes down, and that results in the whole web page being unavailable, then we have arguably made a system that is less resilient than one that requires only one service to be available.

> for every customer-facing interface that uses multiple microservices, or every microservice that depends on multiple downstream collaborators, you need to ask yourself, “What happens if this is down?” and know what to do.

> We ended up implementing three fixes to avoid this happening again: getting our time-outs right, implementing bulkheads to separate out different connection pools, and implementing a circuit breaker to avoid sending calls to an unhealthy system in the first place.

> Time-outs are incredibly useful. Put time-outs on all out-of-process calls, and pick a default time-out for everything. Log when time-outs occur, look at what happens, and change them accordingly. Look at “normal” healthy response times for your downstream services, and use that to guide where you set the time-out threshold.

> Don’t just think about the time-out for a single service call; also think about a time-out for the overall operation, and abort the operation if this overall time-out budget is exceeded.

> having a budget for how long an operation is allowed to take can be a useful idea—you might not decide to do the third (or even second) retry if you’ve already exceeded the overall time-out budget. On the other hand, if this is happening as part of a non-user-facing operation, waiting longer to get something done might be totally acceptable.

> An essential part of building a resilient system, especially when your functionality is spread over a number of different microservices that may be up or down, is the ability to safely degrade functionality.

## Chapter: 13. Scaling

> Much of the work here is in implementing your load distribution mechanisms. These can range from the simple, such as HTTP load balancing, to the more complex, such as using a message broker or configuring database read replicas.

> A model I’ve often used to describe the different types of scaling is the Scale Cube from The Art of Scalability,1 which breaks scaling down into three categories that in the context of computer systems cover functional decomposition, horizontal duplication, and data partitioning.

> We can also hit an issue with queries. Looking up an individual record is easy, as I can just apply the hashing function to find which instance the data should be on and then retrieve it from the correct shard. But what about queries that span the data in multiple nodes—for example, finding all the customers who are over 18? If you want to query all shards, you need to either query each individual shard and join in memory or else have an alternative read store where both data sets are available. Often querying across shards is handled by an asynchronous mechanism, using cached results. Mongo uses map/reduce jobs, for example, to perform these queries.

> For Robustness
If you have an entire set of data available to you in a local cache, you have the potential to operate even if the origin is unavailable—this in turn could improve the robustness of your system.

> With functional decomposition, you extract functionality and allow it to be scaled independently. Extracting functionality from an existing system and creating a new microservice is almost the canonical example of functional decomposition.

> As you may have inferred from this brief overview, scaling databases for writes is where things get very tricky, and where the capabilities of the various databases really start to become differentiated. I often see people changing database technology when they start hitting limits on how easily they can scale their existing write volume.

The scaling axes can be a useful model to use when considering what types of scaling are available to you:

Vertical scaling
In a nutshell, this means getting a bigger machine.

Horizontal duplication
Having multiple things capable of doing the same work.

Data partitioning
Dividing work based on some attribute of the data, e.g., customer group.

Functional decomposition
Separation of work based on the type, e.g., microservice decomposition.


> We need to be able to rapidly experiment and understand what capabilities we need to build. If we tried building for massive scale up front, we’d end up front-loading a huge amount of work to prepare for load that may never come, while diverting effort away from more important activities, like understanding if anyone will actually want to use our product.

> I’d suggest using autoscaling for failure conditions first while you collect the data. Once you want to start autoscaling for load, make sure you are very cautious about scaling down too quickly. In most situations, having more computing power at hand than you need is much better than not having enough!

> Both reactive and predictive scaling are very useful and can help you be much more cost effective if you’re using a platform that allows you to pay only for the computing resources you use.

> The ideal number of places to cache is zero. Anything else should be an optimization you have to make—but be aware of the complexity it can bring.

> The trade-off around caching—balancing freshness of data against optimization of your system for load or latency—is a delicate one, and if you cannot easily reason about how fresh (or not) data might be, this becomes difficult.

> A simple one-size-fits-all TTL for any given resource type is a sensible starting point.

> Does that mean we haven’t sold items or had items restocked during that time? Perhaps. It could also mean our notification mechanism is down and that we aren’t being sent updates any more. If this is a concern, then we could send a heartbeat event via the same notification mechanism—Recommendation, in our case—to let subscribers know that notifications are still coming, but nothing has actually changed.

> The main benefit of this mechanism is that it reduces the potential window wherein the cache is serving stale data. The window in which a cache might now be serving stale data is limited to the time taken for the notification to be sent and processed. Depending on the mechanism you use to send the notification, this could be pretty fast.

> It’s worth noting that, although from the consumer point of view this caching is invisible (it’s an internal implementation concern), that doesn’t mean we’d have to implement this by caching in code in a microservice instance. We could, for example, maintain a reverse proxy within our microservice’s logical boundary, use a hidden Redis node, or divert read queries to read replicas of a database.

> Another mitigation for this is to have a shared client-side cache, perhaps making use of a dedicated caching tool like Redis or memcached, as we see in Figure 13-11. Here, we avoid the problem of inconsistency between the different clients. This can also be more efficient in terms of resource use, as we are reducing the number of copies of this data we need to manage (caches often end up being in memory, and memory is often one of the biggest infrastructural constraints). The flip side is that our clients now need to make a round trip to the shared cache.

> In general, client-side caches tend to be pretty effective, as they avoid the network call to the downstream microservice. This makes them suitable not only for caching for improved latency but also for caching for robustness.

> Fundamentally, using a local cache to enable robustness in a situation in which the origin is unavailable means you are favoring availability over consistency.

> More broadly, caching for scale is useful in any situation in which the origin is a point of contention. Putting caches between clients and the origin can reduce the load on the origin, better allowing it to scale.

> The main concern around write-behind caches is going to be the potential for data loss. If the cache itself isn’t durable, we could lose the data before the data is written to the origin.

## Chapter: 14. User Interfaces

> widgets are normally either spliced into the UI using server-side templating or else dynamically inserted into the browser on the client side. In both cases, the challenge is that the widget is running in the same browser page with other parts of the frontend, meaning that you need to be careful that the different widgets don’t conflict with one another.

> With an aggregating gateway, we can instead issue a single call from the user interface to the gateway. The aggregating gateway then carries out all the required calls, combines the results into a single response, and throws away any data that the user interface doesn’t require

> The concept of doing some form of call filtering and aggregation on the backend can be really important, though, in terms of optimizing the user’s experience of our user interfaces. The issue is that in a delivery organization with multiple teams, a central gateway can lead to requirements for lots of coordination among those teams.

> while in a single microservice boundary I will typically do whatever I can to refactor out duplication into suitable abstractions, I don’t have the same reaction when confronted by duplication across microservices.

> I often describe the use of a BFF with a user interface as though the UI is actually split into two parts. One part sits on the client device (the web interface or native mobile application), with the second part, the BFF, being embedded on the server side.<br>The BFF is tightly coupled to a specific user experience and will typically be maintained by the same team as the user interface, thereby making it easier to define and adapt the API as the UI requires

> Another lesson from the REA story (and one we’ve covered many times already) is that software often works best when aligned around team boundaries, and BFFs are no exception.

> A way to reduce the duplication in functionality here would be to extract this common behavior into a new microservice. In Figure 14-15, we see our new dedicated Wishlist microservice that our Android and iOS applications can both make use of.

> I think the old adage of creating an abstraction when you’re about to implement something for the third time still feels like a good rule of thumb, even at the service level.

> Pattern: Backend for Frontend (BFF)
The main distinction between a BFF and a central aggregating gateway is that a BFF is single purpose in nature—it is developed for a specific user interface.

> Pattern: Widget-Based Decomposition
With widget-based decomposition, a screen in a graphical interface contains widgets that can be independently changed.

> Fundamentally, the nature of the call aggregation and filtering is largely driven by the requirements of the external user interfaces. As such, it would make natural sense for the gateway to be owned by the team(s) creating the UI.

> The simplicity of page-based decomposition from a technical implementation point of view is a real appeal here. You don’t need any fancy JavaScript running in the browser, nor do you need to use problematic iFrames. The user clicks a link, and a new page is requested.

> Pattern: Page-Based Decomposition
In page-based decomposition, our UI is decomposed into multiple web pages. Different sets of pages can be served from different microservices. In Figure 14-4, we see an example of this pattern for MusicCorp. Requests for pages in /albums/ are routed directly to the Albums microservice, which handles serving up those pages, and we do something similar with /artists/. A common navigation is used to help stitch together these pages.

> The understanding that we cannot predict exactly how a customer might end up interacting with our products has driven adoption of more granular APIs, like those delivered by microservices.

> The model that I greatly prefer and feel is better aligned to achieving the goal of independent deployability is to have the UI broken apart and managed by a team that also manages the server-side components

> My preferred model is a team owning the end-to-end delivery of functionality in a specific part of the domain.

> The trick is to find a more effective way to deploy your specialists. Ideally, they would be embedded in the teams. Sometimes, though, there might not be enough work to justify their full-time presence in a given team, in which case they may well split their time between multiple teams. Another model is to have a dedicated team with these skills whose explicit job is to enable other teams.

> The web page as a unit of decomposition is such a core concept of the web as a whole that it becomes a simple and obvious technique for breaking down a large web-based user interface.<br>I think the problem is that in the rush to use single-page application technology, these user interfaces are becoming increasingly rare, to the extent that user experiences that in my opinion would better fit a website implementation end up being shoehorned into a single-page application.

> Speed of delivery trumps a consistency of user experience, at least as far as AWS is concerned.

> The micro frontend approach is an organizational pattern whereby different parts of a frontend can be worked on and deployed independently. To quote from a highly recommended article by Cam Jackson on the topic,3 we can define micro frontends as follows: “An architectural style where independently deliverable frontend applications are composed into a greater whole.”

> Where microservices deliver independent deployability for the backend functionality, micro frontends deliver independent deployability for the frontend.

> In Team Topologies, Skelton and Pais describe these teams as enabling teams. Their job is to go out and help other teams who are focused on delivering new features to do their job.

> Widget-based decomposition involves splicing different parts of a frontend together into a single screen. Page-based decomposition, on the other hand, has the frontend split apart into independent web pages.

## Chapter: 15. Organizational Structures

> A platform that can implement common functionality, such as the ability to handle desired state management for microservices, log aggregation, and inter-microservice authorization and authentication, can deliver huge improvements in productivity and enable teams to take on more responsibility without also having to drastically increase the amount of work they do.

> Conway’s law highlights the perils of trying to enforce a system design that doesn’t match the organization. This points us, for microservices at least, toward a model where strong ownership of microservices is the norm. Sharing microservices or attempting to practice collective ownership at scale can often result in us undermining the benefits of microservices.

> An old-fashioned architect would tell people what to do. In the new, modern, decentralized organization, architects are surveying the landscape, spotting trends, helping connect people, and acting as a sounding board to help other teams get stuff done.

> Netflix designed the organizational structure for the system architecture it wanted. I’ve also heard that this extended into the seating plans for teams at Netflix

> loosely coupled, stream-aligned teams, we expect them to do their own testing in isolated environments, manage deployments in such a way that they can be done during the day, and make changes to their system architecture when needed. All of this seems to be pushing more and more responsibility—and work—into these teams. Enabling teams as a general concept can help here, but ultimately stream-aligned teams need a self-service set of tools that allows them to do their job—this is the platform.

> Fundamentally, the stronger the ownership model a team can adopt, the less coordination is needed, and therefore the more productive the team can be.

## Chapter: 16. The Evolutionary Architect

> Software architecture is the shape of the system. Architecture happens, by design or accident. We make a series of ad hoc decisions, and we end up with the results—without thinking about things in terms of architecture, we end up with architecture nonetheless. Architecture can sometimes be what happens while we’re busy making other plans.

> software architects need to shift their thinking away from creating the perfect end product and focus instead on helping create a framework in which the right systems can emerge and continue to grow as we learn more.

> a great way to help frame our decision making is to define a set of principles and practices that guide it, based on goals that we are trying to achieve.

> The act of making nontechnical product owners more accountable for prioritization around technical activities is nontrivial, but it is absolutely worth it in my experience.

> In a nutshell, we can consider governance as agreeing how things should be done, making sure people know how things should be done, and making sure things are done that way.

> Wouldn’t it be great if you could make it really easy for all developers to follow most of the guidelines you have with very little work? What if, out of the box, the developers had most of the code in place to implement the core attributes that each microservice needs?<br>Many frameworks exist for different programming languages that attempt to give you the building blocks for your own microservice template.
