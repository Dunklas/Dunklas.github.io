---
title: "How I like to work with software development tasks"
tags: ["development", "culture"]
date: 2023-05-20T13:24:00Z
draft: false
---

### Bad way of working on a task
 - Starting before you have any idea of what you're about to do
 - Instantly follow new ideas, context switch
 - Hard to determine when you're done

First of all, you need to have a basic understanding the task.
Read through the description.
Do some reconnaissance.
What parts of the codebase will be involved?
How are similar things written?
Are there any known unknowns?
Anything that need to be clarified?
Discuss with your team members, your product owner or possibly your end users.

**Don't** get stuck here.
You don't need to work out every detail.

Next up, I like to convert my understanding to a high level plan.
Depending on the size of the task - The plan might be a set of sub tasks, a simple check list, or maybe just something in your brain (**REPHRASE**).
I prefer to have it in written form though.

Prioritize the plan.
Try to start with the main chunk of the feature, but in a naive way.
Delay stuff such as input validation, proper error handling, etc (**REPHRASE**).

Now is an excellent time for a break.
Stretch your legs, take some fresh air - Make sure you're energized for what's to come.

Next, execute!
Grab the first item from your high level plan.
Write tests, implement.
If your mind (or fingers) start to stray towards items further down in your plan, stay them!
You'll deal with it later.
If you get an idea of something important that you've completely forgot to account for in the high level plan - Don't chase that idea right now, simply add a note of it to the bottom of your high level plan.

Once you're done with the first item is an excellent time to commit to version control.
This doesn't necessarily need to be a commit in your main branch - It could be in a temporary branch as well.
The purpose is to have a clean state before starting with the next item.

Review your high level plan.
Do you need to re-prioritize?
Need to investigate some thing that you recently added to the list?
Once you're satisfied with the plan, grab the next item.
Rinse and repeat.

### Suggested way:
1. Make sure you understand the task
   - You don't? Ask someone!
   - If no-one knows, proceed to the next step and hope it will become more clear
2. Do some reconnaissance
   - What parts of the codebase will be involved?
   - How are other similar things written?
   - Are there any known unknowns? Need a whiteboard? Discuss with a team member?
3. Write a high level plan
   - Focus on behavior
   - If possible, try to start with an "end-to-end" primitive solution
   - Maybe sub tasks, maybe todo list, maybe mental
4. Prioritize items in the high level plan
5. Need a leg stretcher? Coffee?
6. Execute!
   - Work through the items in your high level plan, one by one
   - Always have a clear goal with what you're doing right now
   - **Important**! If you come up with something else that need be done, or investigated - Don't start with it right away, add it to your high levl plan
   - Between each thing in your high level plan is an awesome opportunity to commit to version control
   - Review your high level plan in between the items, mark the one you've done as completed, and make any neccesary update to if you've gotten any new information that changes things


### Why do I think this is good?
 - R-mode to L-mode
 - Staying focused on the task at hand
 - Delaying new ideas reduces context switching