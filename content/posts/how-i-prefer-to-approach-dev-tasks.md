---
title: "How I like to work with software development tasks"
tags: ["development", "culture"]
date: 2023-05-20T13:24:00Z
draft: false
---
Sometimes I see people (myself included) working on software development tasks in a non-structured way.
You might have a vague understanding of what you're about to accomplish.
Aimlessly traversing the code base, hoping to find places that you might need to change.
You instantly start to chase new ideas, while forgetting about prior (and possibly important) ideas.
You might not commit intermediary working states, and have a hard time finding what you've messed up once something is broken.
It's hard to determine when you're done.

In this post, I aim to explain how I like to approach tasks in a bit more structured way.

---

First of all, you need to have a basic understanding the task.
Read through the description.
Do some reconnaissance.
Is there anything you should **not** do? Can you move it to a separate task?
Anything that need to be clarified? Discuss with your team members, your product owner or possibly your end users.
What parts of the codebase will be involved?

**Don't** get stuck here.
You don't need to work out every detail.

Next up, I like to convert my understanding to a high level plan.
Depending on the size of the task - The plan might be a set of sub tasks, a checklist, or maybe just a few steps that you keep in mind.
I prefer to have it in written form though.

Prioritize the plan.
If possible, I personally prefer to start with a naive end-to-end implementation of the main chunk of the feature.
Delaying things such as input validation, proper error handling, etc.

Now is an excellent time for a break.
Stretch your legs, take some fresh air.

Once you're back - Execute!
Grab the first item from your high level plan.
Write tests, implement.
If your mind (or fingers) start to stray towards items further down in your plan, stay them!
You'll deal with it later.
If you get an idea of something important that you've completely forgot to account for in the high level plan - Don't chase that idea right now, simply add a note of it to the bottom of your high level plan.
If you get stuck on a non-critical aspect of the item you're currently working on - Make it into its own item in the high level plan and deal with it later.

Once you're done with the first item is an excellent time to commit to version control.
This doesn't necessarily need to be a commit in your main branch - It could be squashed into a larger commit later as well.
The purpose is to have a clean state before starting with the next item.

Review your high level plan.
Put a checkmark next to the item you just completed.
Do you need to re-prioritize?
Need to investigate some thing that you recently added?
Once you're satisfied with the plan, grab the next item.
Rinse and repeat.

---

 - R-mode to L-mode
 - Staying focused on the task at hand, always a clear goal
 - Delaying new ideas reduces context switching