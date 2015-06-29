The Popcorn Engine is an escalation management web app that allows people in support roles to automate the process of deciding who has to take escalations to the team by leadership for special reasons. The app tracks who has done what and assigns a "rank" to all participants. When they take an escalation, their rank increments. When a new escalation comes in, it will only pool the members of the lowest rank available for random selection. This ensures that no one is free from the responsibility and prevents only one person from taking all the escalations.

[See the demo here](http://popcorn-engine.herokuapp.com) (under construction)

---
###Components

- Main page has giant popcorn button.

- Pressing giant button grabs data from remote source specified and parses it accordingly

- Sorts through retrieved data and adds new candidates to its own database.

- Compares retrieved data to own db to create pool of available victims to choose from.

- Prompts to confirm chosen victim took escalation, re-rolls otherwise.

- Displays current rankings.

- Manually add/delete candidates and manage rankings.

---
###Features

- Slack integration

- Hipchat integration

- Can email notification upon acceptance of escalation stating escalation reason and current ranking.

- Can add reason for escalation/escalation tracking over time.

---
###Design Aesthetics

- Blue and Red primary color scheme.

- Fun and lighthearted.

- Big, minimalist graphics.

- Ranking page should feel like arcade ranking page.

---
###User flow

Main Page
 - Giant popcorn button
 - menu hamburger that fades in the menu

Ranking page
 - Displays rankings from db
 - Can search rankings.

Manage page
 - Can add/delete users.
 - Can change rank of users.